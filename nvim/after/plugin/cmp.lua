local cmp_present, cmp = pcall(require, "cmp")
local lspkind_present, lspkind = pcall(require, "lspkind")
local luasnip_present, luasnip = pcall(require, "luasnip")

if not cmp_present then
    print("cmp plugin not found")
    return
end

if not lspkind_present then
    print("lspkind plugin not found")
    return
end

if not luasnip_present then
    print("luasnip plugin not found")
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})
vim.api.nvim_set_hl(0, "CmpItemKindBuffer", { fg = "#928374" })

local source_mapping = {
    buffer = "[Buf]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
    supermaven = "[SM]",
    luasnip = "[Snip]",
}

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        -- Enter to confirm selection
        -- set select to true to also confirm even if not explicitly selected
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "supermaven" },
        { name = "zsh" },
    }, {
        { name = "path" },
        { name = "buffer" },
    }),

    formatting = {
        fields = { "abbr", "kind", "menu" },
        expandable_indicator = true,
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]

            if entry.source.name == "supermaven" then
                vim_item.kind_hl_group = "CmpItemKindSupermaven"
                vim_item.kind = ""
            end

            if entry.source.name == "buffer" then
                vim_item.kind_hl_group = "CmpItemKindBuffer"
                vim_item.kind = "﬘"
            end

            if entry.source.name == "luasnip" then
                vim_item.kind = ""
            end

            vim_item.menu = menu
            return vim_item
        end,
    },

    experimental = {
        ghost_text = false,
    },
})

cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" },
    }, {
        { name = "buffer" },
    }),
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
    }, {
        { name = "buffer" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
