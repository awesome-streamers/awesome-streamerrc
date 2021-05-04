require("harpoon").setup({
    projects = {
        ["/home/theprimeagen/work/nrdp/backport-2"] = {
            term = {
                cmds = {
                    "ninja -C /home/theprimeagen/work/nrdp/builds/backport-2 -j 25 && cp compile_commands.json /home/theprimeagen/work/nrdp/backport-2\n",
                }
            }
        }
    }
})

