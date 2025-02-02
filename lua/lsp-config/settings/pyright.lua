local HOME = os.getenv("HOME")

return {
    on_attach = require("lsp-config.handlers").on_attach,
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                autoSearchPaths = true,
                reportWildcardImportFromLibrary = "none",
                reportUnusedImport = "none",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                stubPath = HOME .. "/.local/share/nvim/mason/registry/typings/",
            },
        },
    },
}
