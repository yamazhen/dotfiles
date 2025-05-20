-- I created this to switch between recently accessed buffers
-- Works like a stack, where the most recently accessed buffer is on top
-- I wanted a lightweight solution that doesn't require any plugins
-- Will turn this into a plugin soon

local M = {}
M.max_history_size = 10
M.histories = {}
M.last_entered = {}
M.current_positions = {}
M.is_cycling = false

local function is_trackable_buffer(bufnr)
	local path = vim.api.nvim_buf_get_name(bufnr)
	return path ~= ""
		and vim.api.nvim_buf_is_valid(bufnr)
		and vim.bo[bufnr].buftype == ""
		and vim.fn.buflisted(bufnr) == 1
end

local function get_current_window()
	return vim.api.nvim_get_current_win()
end

local function ensure_window_history(winid)
	winid = winid or get_current_window()
	if not M.histories[winid] then
		M.histories[winid] = {}
		M.current_positions[winid] = 1
	end
end

local function add_to_history(bufnr, winid)
	winid = winid or get_current_window()

	if not is_trackable_buffer(bufnr) then
		return
	end

	ensure_window_history(winid)

	local path = vim.api.nvim_buf_get_name(bufnr)
	M.last_entered[winid] = bufnr

	table.insert(M.histories[winid], 1, { bufnr = bufnr, path = path })
	M.current_positions[winid] = 1

	if #M.histories[winid] > M.max_history_size then
		table.remove(M.histories[winid])
	end
end

function M.cycle(offset)
	local winid = get_current_window()
	ensure_window_history(winid)

	local history = M.histories[winid]

	if #history <= 1 then
		return
	end

	local new_position = M.current_positions[winid] + offset
	if new_position < 1 or new_position > #history then
		vim.notify(
			"Reached " .. (new_position < 1 and "top" or "bottom") .. " of buffer stack",
			vim.log.levels.WARN,
			{ title = "Buffer Stack" }
		)
		return
	end

	local entry = history[new_position]
	if entry.bufnr and vim.api.nvim_buf_is_valid(entry.bufnr) and vim.api.nvim_buf_is_loaded(entry.bufnr) then
		M.is_cycling = true
		vim.api.nvim_win_set_buf(winid, entry.bufnr)
		M.current_positions[winid] = new_position

		vim.defer_fn(function()
			M.is_cycling = false
		end, 50)
	else
		table.remove(history, new_position)
		M.cycle(offset)
	end
end

function M.clean_up_window(winid)
	if M.histories[winid] then
		M.histories[winid] = nil
		M.current_positions[winid] = nil
		M.last_entered[winid] = nil
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		local winid = get_current_window()

		if M.is_cycling or (M.last_entered[winid] and M.last_entered[winid] == args.buf) then
			return
		end

		add_to_history(args.buf, winid)
	end,
})

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(args)
		local winid = tonumber(args.match)
		if winid then
			M.clean_up_window(winid)
		end
	end,
})

vim.keymap.set("n", "<C-n>", function()
	M.cycle(1)
end)

vim.keymap.set("n", "<C-p>", function()
	M.cycle(-1)
end)

local function init_current()
	local current_win = get_current_window()
	local current_buf = vim.api.nvim_get_current_buf()

	if is_trackable_buffer(current_buf) then
		add_to_history(current_buf, current_win)
	end
end

init_current()

return M
