return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                intelephense = {
                    settings = {
                        intelephense = {
                            licenseKey = "~/.config/intelephense/license.txt",
                        },
                    },
                },
            },
        },
    },
}
