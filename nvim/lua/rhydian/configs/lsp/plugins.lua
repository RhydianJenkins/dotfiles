local mason_present, mason = pcall(require, "mason")
local lspconfig_present, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
local cmp_nvim_lsp_present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local null_ls_present, null_ls = pcall(require, "null-ls")
local mason_null_ls_present, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_present then
    print("mason plugin not found")
    return
end

if not null_ls_present then
    print("null ls plugin not found")
    return
end

if not mason_null_ls_present then
    print("mason null ls plugin not found")
    return
end

if not lspconfig_present then
    print("lspconfig plugin not found")
    return
end

if not mason_lspconfig_present then
    print("mason lspconfig plugin not found")
    return
end

if not cmp_nvim_lsp_present then
    print("cmp_nvim_lsp plugin not found")
    return
end

return {
    mason = mason,
    lspconfig = lspconfig,
    mason_lspconfig = mason_lspconfig,
    cmp_nvim_lsp = cmp_nvim_lsp,
    null_ls = null_ls,
    mason_null_ls = mason_null_ls,
}
