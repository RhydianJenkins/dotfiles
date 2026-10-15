vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone/all.json"] = {
                    "kubernetes-manifests/**/*.yaml",
                },
            },
        },
    },
})
