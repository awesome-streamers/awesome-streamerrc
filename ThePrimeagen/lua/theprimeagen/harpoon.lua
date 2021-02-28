require("harpoon").setup({
    projects = {
        ["/home/theprimeagen/work/tvui-automation"] = {
            term = {
                cmds = {
                    "yarn test\n"
                }
            }
        }
    }
}) 

