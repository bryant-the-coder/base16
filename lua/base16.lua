local function highlight(group, guifg, guibg, attr, guisp)
    local arg = {}
    if guifg then
        if vim.tbl_contains({ "none", "NONE", "None" }, guifg) then
            arg["fg"] = ""
        else
            arg["fg"] = guifg
        end
    end
    if guibg then
        if vim.tbl_contains({ "none", "NONE", "None" }, guibg) then
            arg["bg"] = ""
        else
            arg["bg"] = guibg
        end
    end
    if attr then
        if type(attr) == "table" then
            for _, at in ipairs(attr) do
                arg[at] = true
            end
        else
            if not vim.tbl_contains({ "none", "NONE", "None" }, attr) then
                arg[attr] = true
            end
        end
    end
    if guisp then
        arg["sp"] = guisp
    end

    -- nvim.ex.highlight(parts)
    vim.api.nvim_set_hl(0, group, arg)
end

-- Modified from https://github.com/chriskempson/base16-vim
local function apply_base16_theme(theme)
    -- Neovim terminal colours
    if vim.fn.has("nvim") then
        vim.g.terminal_color_0 = "#" .. theme.base00
        vim.g.terminal_color_1 = "#" .. theme.base08
        vim.g.terminal_color_2 = "#" .. theme.base0B
        vim.g.terminal_color_3 = "#" .. theme.base0A
        vim.g.terminal_color_4 = "#" .. theme.base0D
        vim.g.terminal_color_5 = "#" .. theme.base0E
        vim.g.terminal_color_6 = "#" .. theme.base0C
        vim.g.terminal_color_7 = "#" .. theme.base05
        vim.g.terminal_color_8 = "#" .. theme.base03
        vim.g.terminal_color_9 = "#" .. theme.base08
        vim.g.terminal_color_10 = "#" .. theme.base0B
        vim.g.terminal_color_11 = "#" .. theme.base0A
        vim.g.terminal_color_12 = "#" .. theme.base0D
        vim.g.terminal_color_13 = "#" .. theme.base0E
        vim.g.terminal_color_14 = "#" .. theme.base0C
        vim.g.terminal_color_15 = "#" .. theme.base07
        if vim.o.background == "light" then
            vim.g.terminal_color_background = "#" .. theme.base05
            vim.g.terminal_color_foreground = "#" .. theme.base0B
        else
            vim.g.terminal_color_background = "#" .. theme.base00
            vim.g.terminal_color_foreground = "#" .. theme.base0E
        end
    end

    -- TODO: Allow import from base30

    -- Vim editor colors
    highlight("Normal", theme.base05, theme.base00, nil, nil)
    highlight("Bold", nil, nil, "bold", nil)
    highlight("Debug", theme.base08, nil, nil, nil)
    highlight("Directory", theme.base0D, nil, nil, nil)
    highlight("Error", theme.base00, theme.base08, nil, nil)
    highlight("ErrorMsg", theme.base08, theme.base00, nil, nil)
    highlight("Exception", theme.base08, nil, nil, nil)
    highlight("FoldColumn", theme.base0C, theme.base01, nil, nil)
    highlight("Folded", theme.base03, theme.base01, nil, nil)
    highlight("IncSearch", theme.base01, theme.base09, nil, nil)
    highlight("CurSearch", theme.base01, theme.base09, nil, nil)
    highlight("Italic", nil, nil, nil, nil)
    highlight("Macro", theme.base08, nil, nil, nil)
    highlight("MatchParen", nil, theme.base03, nil, nil)
    highlight("ModeMsg", theme.base0B, nil, nil, nil)
    highlight("MoreMsg", theme.base0B, nil, nil, nil)
    highlight("Question", theme.base0D, nil, nil, nil)
    highlight("Search", theme.base01, theme.base0A, nil, nil)
    highlight("Substitute", theme.base01, theme.base0A, nil, nil)
    highlight("SpecialKey", theme.base03, nil, nil, nil)
    highlight("TooLong", theme.base08, nil, nil, nil)
    highlight("Underlined", theme.base08, nil, nil, nil)
    highlight("Visual", nil, theme.base02, nil, nil)
    highlight("VisualNOS", theme.base08, nil, nil, nil)
    highlight("WarningMsg", theme.base08, nil, nil, nil)
    highlight("WildMenu", theme.base08, theme.base0A, nil, nil)
    highlight("Title", theme.base0D, nil, nil, nil)
    -- highlight("Conceal", theme.base0D, theme.base00, nil, nil)
    highlight("Conceal", nil, nil, nil, nil)
    highlight("Cursor", theme.base00, theme.base05, nil, nil)
    highlight("NonText", theme.base03, nil, nil, nil)
    highlight("NeorgMarkupVerbatim", theme.base03, nil, nil, nil)
    highlight("LineNr", theme.base03, nil, nil, nil)
    highlight("SignColumn", theme.base03, nil, nil, nil)
    highlight("StatusLine", theme.base04, nil, nil, nil)
    highlight("StatusLineNC", theme.base03, nil, nil, nil)
    highlight("VertSplit", theme.base02, nil, nil, nil)
    highlight("ColorColumn", nil, theme.base01, nil, nil)
    highlight("CursorColumn", nil, theme.base01, nil, nil)
    highlight("CursorLine", nil, theme.base01, nil, nil)
    highlight("CursorLineNr", theme.base04, nil, nil, nil)
    highlight("QuickFixLine", nil, theme.base01, nil, nil)
    highlight("PMenu", theme.base05, theme.base01, nil, nil)
    -- highlight("PMenuSel", theme.base01, theme.base05, nil, nil)
    highlight("TabLine", theme.base03, theme.base01, nil, nil)
    highlight("TabLineFill", theme.base03, theme.base01, nil, nil)
    highlight("TabLineSel", theme.base0B, theme.base01, nil, nil)

    -- Standard syntax highlighting
    highlight("Boolean", theme.base09, nil, nil, nil)
    highlight("Character", theme.base08, nil, nil, nil)
    highlight("Comment", theme.base03, nil, "italic", nil)
    highlight("Conditional", theme.base0E, nil, "italic", nil)
    highlight("Constant", theme.base09, nil, nil, nil)
    highlight("Define", theme.base0E, nil, nil, nil)
    highlight("Delimiter", theme.base0F, nil, nil, nil)
    highlight("Float", theme.base09, nil, nil, nil)
    highlight("Identifier", theme.base08, nil, nil, nil)
    highlight("Include", theme.base0D, nil, nil, nil)
    highlight("Label", theme.base0A, nil, nil, nil)
    highlight("Number", theme.base09, nil, nil, nil)
    highlight("Operator", theme.base05, nil, nil, nil)
    highlight("PreProc", theme.base0A, nil, nil, nil)
    highlight("Repeat", theme.base0A, nil, nil, nil)
    highlight("Special", theme.base0C, nil, nil, nil)
    highlight("SpecialChar", theme.base0F, nil, nil, nil)
    highlight("Statement", theme.base08, nil, nil, nil)
    highlight("StorageClass", theme.base0A, nil, nil, nil)
    highlight("String", theme.base0B, nil, nil, nil)
    highlight("Structure", theme.base0E, nil, nil, nil)
    highlight("Tag", theme.base0A, nil, nil, nil)
    highlight("Todo", theme.base0A, theme.base01, nil, nil)
    highlight("Type", theme.base0A, nil, nil, nil)
    highlight("Typedef", theme.base0A, nil, nil, nil)

    -- Diff highlighting
    highlight("DiffAdd", theme.base0B, theme.base01, nil, nil)
    highlight("DiffChange", theme.base03, theme.base01, nil, nil)
    highlight("DiffDelete", theme.base08, theme.base01, nil, nil)
    highlight("DiffText", theme.base0D, theme.base01, nil, nil)
    highlight("DiffAdded", theme.base0B, theme.base00, nil, nil)
    highlight("DiffFile", theme.base08, theme.base00, nil, nil)
    highlight("DiffNewFile", theme.base0B, theme.base00, nil, nil)
    highlight("DiffLine", theme.base0D, theme.base00, nil, nil)
    highlight("DiffRemoved", theme.base08, theme.base00, nil, nil)

    -- Git highlighting
    highlight("gitcommitOverflow", theme.base08, nil, nil, nil)
    highlight("gitcommitSummary", theme.base0B, nil, nil, nil)
    highlight("gitcommitComment", theme.base03, nil, nil, nil)
    highlight("gitcommitUntracked", theme.base03, nil, nil, nil)
    highlight("gitcommitDiscarded", theme.base03, nil, nil, nil)
    highlight("gitcommitSelected", theme.base03, nil, nil, nil)
    highlight("gitcommitHeader", theme.base0E, nil, nil, nil)
    highlight("gitcommitSelectedType", theme.base0D, nil, nil, nil)
    highlight("gitcommitUnmergedType", theme.base0D, nil, nil, nil)
    highlight("gitcommitDiscardedType", theme.base0D, nil, nil, nil)
    highlight("gitcommitBranch", theme.base09, nil, "bold", nil)
    highlight("gitcommitUntrackedFile", theme.base0A, nil, nil, nil)
    highlight("gitcommitUnmergedFile", theme.base08, nil, "bold", nil)
    highlight("gitcommitDiscardedFile", theme.base08, nil, "bold", nil)
    highlight("gitcommitSelectedFile", theme.base0B, nil, "bold", nil)

    -- Mail highlighting
    highlight("mailQuoted1", theme.base0A, nil, nil, nil)
    highlight("mailQuoted2", theme.base0B, nil, nil, nil)
    highlight("mailQuoted3", theme.base0E, nil, nil, nil)
    highlight("mailQuoted4", theme.base0C, nil, nil, nil)
    highlight("mailQuoted5", theme.base0D, nil, nil, nil)
    highlight("mailQuoted6", theme.base0A, nil, nil, nil)
    highlight("mailURL", theme.base0D, nil, nil, nil)
    highlight("mailEmail", theme.base0D, nil, nil, nil)

    -- Spelling highlighting
    -- highlight("SpellBad", nil, nil, "undercurl", theme.base08)
    highlight("SpellLocal", nil, nil, "undercurl", theme.base0C)
    highlight("SpellCap", nil, nil, "undercurl", theme.base0D)
    highlight("SpellRare", nil, nil, "undercurl", theme.base0E)

    -- treesitter
    -- ==========
    -- Misc
    highlight("@comment", theme.base03, nil, "italic", nil)
    highlight("@error", theme.base08, nil, nil, nil)
    highlight("@none", theme.base05, nil, nil, nil)
    highlight("@preproc", theme.base0A, nil, nil, nil)
    highlight("@define", theme.base0A, nil, nil, nil)
    highlight("@operator", theme.base05, nil, nil, nil)

    -- Punctuation
    highlight("@punctuation.delimiter", theme.base0F, nil, nil, nil)
    highlight("@puncuation.bracket", theme.base0D, nil, nil, nil)
    highlight("@punctuation.special", theme.base05, nil, nil, nil)

    -- Literals
    highlight("@string", theme.base0B, nil, nil, nil)
    highlight("@string.regex", theme.base0C, nil, nil, nil)
    highlight("@string.escape", theme.base0C, nil, nil, nil)
    highlight("@string.special", theme.base0C, nil, nil, nil)
    highlight("@character", theme.base08, nil, nil, nil)
    highlight("@character.special", theme.base0F, nil, nil, nil)
    highlight("@boolean", theme.base09, nil, nil, nil)
    highlight("@number", theme.base09, nil, nil, nil)
    highlight("@float", theme.base09, nil, nil, nil)

    -- Functions
    highlight("@function", theme.base0D, nil, "italic", nil)
    highlight("@function.builtin", theme.base0D, nil, nil, nil)
    highlight("@function.call", theme.base0D, nil, nil, nil)
    highlight("@function.macro", theme.base08, nil, nil, nil)
    highlight("@method", theme.base0D, nil, "italic", nil)
    highlight("@method.call", theme.base0D, nil, nil, nil)
    highlight("@constructor", theme.base0C, nil, nil, nil)
    highlight("@parameter", theme.base08, nil, "italic", nil)

    -- Keywords
    highlight("@keyword", theme.base0E, nil, nil, nil)
    highlight("@keyword.function", theme.base0E, nil, nil, nil)
    highlight("@keyword.operator", theme.base0E, nil, nil, nil)
    highlight("@keyword.return", theme.base0E, nil, nil, nil)
    highlight("@conditional", theme.base0E, nil, "italic", nil)
    highlight("@repeat", theme.base0A, nil, nil, nil)
    highlight("@debug", theme.base08, nil, nil, nil)
    highlight("@label", theme.base0A, nil, nil, nil)
    highlight("@include", theme.base0D, nil, nil, nil)
    highlight("@exception", theme.base08, nil, nil, nil)

    -- Types
    highlight("@type", theme.base0A, nil, nil, nil)
    highlight("@type.builtin", theme.base0A, nil, nil, nil)
    highlight("@type.definition", theme.base0A, nil, nil, nil)
    highlight("@type.qualifier", theme.base0A, nil, nil, nil)
    highlight("@storageclass", theme.base0A, nil, nil, nil)
    highlight("@attribute", theme.base0A, nil, nil, nil)
    highlight("@field", theme.base08, nil, "italic", nil)
    highlight("@property", theme.base08, nil, nil, nil)

    -- Identifiers
    highlight("@variable", theme.base05, nil, "italic", nil)
    highlight("@variable.builtin", theme.base09, nil, nil, nil)
    highlight("@constant", theme.base09, nil, nil, nil)
    highlight("@constant.builtin", theme.base09, nil, nil, nil)
    highlight("@constant.macro", theme.base08, nil, nil, nil)
    highlight("@namespace", theme.base08, nil, nil, nil)
    highlight("@symbol", theme.base0B, nil, nil, nil)

    -- Text
    highlight("@text", theme.base05, nil, nil, nil)
    highlight("@text.strong", nil, nil, "bold", nil)
    highlight("@text.emphasis", theme.base09, nil, "italic", nil)
    highlight("@text.underline", theme.base05, nil, "underline", nil)
    highlight("@text.strike", theme.base05, nil, "strikethrough", nil)
    highlight("@text.title", nil, nil, { "bold", "underline" }, nil)
    highlight("@text.literal", theme.base09, nil, nil, nil)
    highlight("@text.uri", theme.base09, nil, "underline", nil)
    highlight("@text.math", theme.base0C, nil, nil, nil)
    highlight("@text.environment", theme.base0D, nil, nil, nil)
    highlight("@text.environment.name", theme.base05, nil, "italic", nil)
    highlight("@text.reference", theme.base05, nil, nil, nil)
    highlight("@text.todo", theme.base0A, nil, nil, nil)
    highlight("@text.note", theme.base0D, nil, nil, nil)
    highlight("@text.warning", theme.base0A, nil, nil, nil)
    highlight("@text.danger", theme.base0F, theme.base00, nil, nil)
    highlight("@text.diff.add", theme.base0B, nil, nil, nil)
    highlight("@text.diff.delete", theme.base08, nil, nil, nil)

    -- Tags
    highlight("@tag", theme.base0A, nil, nil, nil)
    highlight("@tag.attribute", theme.base0A, nil, nil, nil)
    highlight("@tag.delimiter", theme.base0F, nil, nil, nil)

    -- Conceal
    highlight("@conceal", theme.base05, nil, nil, nil)

    -- Locals
    highlight("@definition", nil, nil, "underline", theme.base04)
    highlight("@scope", nil, nil, "bold", nil)

    highlight("TSAnnotation", theme.base0F, nil, nil, nil)
    highlight("TSError", theme.base08, nil, nil, nil)
    highlight("TSParameterReference", theme.base05, nil, nil, nil)
    highlight("TSPunctDelimiter", theme.base0F, nil, nil, nil)

    -- code from https://github.com/NvChad/nvim-base16.lua
    -- Modified from https://github.com/chriskempson/base16-vim
    vim.g.color_base_01 = theme.base01
    vim.g.color_base_09 = theme.base09
    vim.g.color_base_0F = theme.base0F
    highlight("LspDiagnosticsDefaultError", theme.base08, nil, nil, nil)
    highlight("LspDiagnosticsDefaultWarning", theme.base0A, nil, nil, nil)
    highlight("LspDiagnosticsDefaultWarn", theme.base0A, nil, nil, nil)
    highlight("LspDiagnosticsDefaultInformation", theme.base0D, nil, nil, nil)
    highlight("LspDiagnosticsDefaultInfo", theme.base0D, nil, nil, nil)
    highlight("LspDiagnosticsDefaultHint", theme.base0C, nil, nil, nil)

    highlight("Keyword", theme.base0E, nil, nil, nil)
    highlight("PMenu", theme.base05, theme.base00, nil, nil)
    highlight("Special", theme.base0C, nil, "italic", nil)
    highlight("markdownBold", theme.base0A, nil, "bold", nil)
    highlight("@quantifier", theme.base0C, nil, "italic", nil)
    highlight("@require_call", theme.base0E, nil, "italic", nil)
    highlight("@utils", theme.base0D, nil, nil, nil)
    highlight("@code", theme.base03, nil, nil, nil)
    highlight("@rust_path", theme.base0B, nil, nil, nil)
    highlight("CodeActionAvailable", theme.base08, nil, nil, nil)

    highlight("rainbowcol1", theme.base08, nil, nil, nil)
    highlight("rainbowcol2", theme.base09, nil, nil, nil)
    highlight("rainbowcol3", theme.base0A, nil, nil, nil)
    highlight("rainbowcol4", theme.base0B, nil, nil, nil)
    highlight("rainbowcol5", theme.base0D, nil, nil, nil)
    highlight("rainbowcol6", theme.base0E, nil, nil, nil)
    --[[ highlight("TSRainbowRed", theme.base08, nil, nil, nil)
    highlight("TSRainbowOrange", theme.base09, nil, nil, nil)
    highlight("TSRainbowYellow", theme.base0A, nil, nil, nil)
    highlight("TSRainbowGreen", theme.base0B, nil, nil, nil)
    highlight("TSRainbowBlue", theme.base0D, nil, nil, nil)
    highlight("TSRainbowViolet", theme.base0E, nil, nil, nil)
    highlight("TSRainbowCyan", theme.base0C, nil, nil, nil) ]]
    highlight("@neorg.markup.italic", nil, nil, "italic", nil)
    -- Indent
    highlight("IndentBlanklineIndent1", theme.base0B, nil, nil, nil)
    highlight("IndentBlanklineIndent2", theme.base0D, nil, nil, nil)
    highlight("IndentBlanklineIndent3", theme.base0E, nil, nil, nil)
    highlight("IndentBlanklineIndent4", theme.base0A, nil, nil, nil)
    highlight("IndentBlanklineIndent5", theme.base0F, nil, nil, nil)

    highlight("WhiteSpace", "#45475A", nil, nil, nil)

    highlight("LazyH1", theme.base02, theme.base0B, nil)
    highlight("LazyH2", theme.base08, nil, "italic")
    highlight("LazyReasonPlugin", theme.base08, nil, nil)
    highlight("LazyValue", theme.base0D, nil, nil)
    highlight("LazyDir", theme.base05, nil, nil)
    highlight("LazyUrl", theme.base05, nil, nil)
    highlight("LazyCommit", theme.base0B, nil, nil)
    highlight("LazyNoCond", theme.base08, nil, nil)
    highlight("LazySpecial", theme.base0C, nil, nil)
    highlight("LazyReasonFt", theme.base0E, nil, nil)
    highlight("LazyOperator", theme.base05, nil, nil)
    highlight("LazyReasonKeys", theme.base0D, nil, nil)
    highlight("LazyReasonEvent", theme.base0A, nil, nil)
    highlight("LazyReasonStart", theme.base05, nil, nil)
    highlight("LazyReasonRuntime", theme.base0C, nil, nil)
    highlight("LazyReasonCmd", theme.base09, nil, nil)
    highlight("LazyReasonSource", theme.base0C, nil, nil)
    highlight("LazyReasonImport", theme.base05, nil, nil)
    highlight("LazyProgressDone", theme.base05, nil, nil)
    highlight("LazyTaskOutput", theme.base05, nil, nil)
    highlight("LazyCommitIssue", theme.base0F, nil, nil)
    highlight("LazyButton", theme.base03, theme.base01, nil)
    -- TODO
    -- nvim.command 'syntax on'
end

return setmetatable({
    themes = function(name)
        name = "themes/" .. name .. "-base16"
        local present, theme_array = pcall(require, name)
        if present then
            return theme_array
        else
            error("No such base16 theme: " .. name)
        end
    end,
    apply_theme = apply_base16_theme,
    theme_from_array = function(array)
        assert(#array == 16, "base16.theme_from_array: The array length must be 16")
        local result = {}
        for i, value in ipairs(array) do
            assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
            local key = ("base%02X"):format(i - 1)
            result[key] = value
        end
        return result
    end,
}, {
    __call = function(_, ...)
        apply_base16_theme(...)
    end,
})
