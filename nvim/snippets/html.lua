local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("th:text", {
		t('th:text="'),
		i(1),
		t('"'),
	}),

	s("th:utext", {
		t('th:utext="'),
		i(1),
		t('"'),
	}),

	s("th:if", {
		t('th:if="'),
		i(1),
		t('"'),
	}),

	s("th:unless", {
		t('th:unless="'),
		i(1),
		t('"'),
	}),

	s("th:each", {
		t('th:each="'),
		i(1),
		t('"'),
	}),

	s("th:href", {
		t('th:href="'),
		i(1),
		t('"'),
	}),

	s("th:src", {
		t('th:src="'),
		i(1),
		t('"'),
	}),

	s("th:action", {
		t('th:action="'),
		i(1),
		t('"'),
	}),

	s("th:object", {
		t('th:object="'),
		i(1),
		t('"'),
	}),

	s("th:field", {
		t('th:field="'),
		i(1),
		t('"'),
	}),

	s("th:value", {
		t('th:value="'),
		i(1),
		t('"'),
	}),

	s("th:class", {
		t('th:class="'),
		i(1),
		t('"'),
	}),

	s("th:classappend", {
		t('th:classappend="'),
		i(1),
		t('"'),
	}),

	s("th:id", {
		t('th:id="'),
		i(1),
		t('"'),
	}),

	s("th:style", {
		t('th:style="'),
		i(1),
		t('"'),
	}),

	s("th:styleappend", {
		t('th:styleappend="'),
		i(1),
		t('"'),
	}),

	s("th:attr", {
		t('th:attr="'),
		i(1),
		t('"'),
	}),

	s("th:attrappend", {
		t('th:attrappend="'),
		i(1),
		t('"'),
	}),

	s("th:attrprepend", {
		t('th:attrprepend="'),
		i(1),
		t('"'),
	}),

	s("th:switch", {
		t('th:switch="'),
		i(1),
		t('"'),
	}),

	s("th:case", {
		t('th:case="'),
		i(1),
		t('"'),
	}),

	s("th:remove", {
		t('th:remove="'),
		i(1),
		t('"'),
	}),

	s("th:with", {
		t('th:with="'),
		i(1),
		t('"'),
	}),

	s("th:inline", {
		t('th:inline="'),
		i(1),
		t('"'),
	}),

	-- Special case for th:data with multiple insert nodes
	s("th:data-", {
		t("th:data-"),
		i(1, "attribute"),
		t('="'),
		i(2),
		t('"'),
	}),

	-- Form-related attributes
	s("th:selected", {
		t('th:selected="'),
		i(1),
		t('"'),
	}),

	s("th:checked", {
		t('th:checked="'),
		i(1),
		t('"'),
	}),

	s("th:disabled", {
		t('th:disabled="'),
		i(1),
		t('"'),
	}),

	s("th:readonly", {
		t('th:readonly="'),
		i(1),
		t('"'),
	}),

	s("th:multiple", {
		t('th:multiple="'),
		i(1),
		t('"'),
	}),

	s("th:required", {
		t('th:required="'),
		i(1),
		t('"'),
	}),

	-- Template fragments
	s("th:fragment", {
		t('th:fragment="'),
		i(1),
		t('"'),
	}),

	s("th:include", {
		t('th:include="'),
		i(1),
		t('"'),
	}),

	s("th:replace", {
		t('th:replace="'),
		i(1),
		t('"'),
	}),

	s("th:insert", {
		t('th:insert="'),
		i(1),
		t('"'),
	}),

	s("th:errors", {
		t('th:errors="'),
		i(1),
		t('"'),
	}),

	s("th:method", {
		t('th:method="'),
		i(1),
		t('"'),
	}),

	s("th:placeholder", {
		t('th:placeholder="'),
		i(1),
		t('"'),
	}),
}
