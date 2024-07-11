return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    keys = {
        {
            "<leader>sc",
            function()
                require("nvim-silicon").shoot()
            end,
            desc = "Take a screenshot of the current code",
            mode = { "n", "v" },
        }
    },
    config = function()
        require("nvim-silicon").setup({
            output = function()
                return os.getenv("HOME") .. "/Downloads/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_screenshot_code.png"
            end,
        })
    end,
}
