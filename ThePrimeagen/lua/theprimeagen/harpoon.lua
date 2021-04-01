require("harpoon").setup({
    projects = {

        ["/home/theprimeagen/work/nrdp/20.2"] = {
            term = {
                cmds = {
                    "ninja -C /home/theprimeagen/work/nrdp/builds/20.2 -j 25 && cp compile_commands.json /home/theprimeagen/work/nrdp/20.2\n",
                }
            }
        },
        ["/home/theprimeagen/work/nrdp/20.3"] = {
            term = {
                cmds = {
                    "ninja -C /home/theprimeagen/work/nrdp/builds/20.3 -j 25 && cp compile_commands.json /home/theprimeagen/work/nrdp/20.3\n",
                }
            }
        },
        ["/home/theprimeagen/work/nrdp/20.1"] = {
            term = {
                cmds = {
                    "ninja -C /home/theprimeagen/work/nrdp/builds/20.1 -j 25 && cp compile_commands.json /home/theprimeagen/work/nrdp/20.1\n",
                }
            }
        },
        ["/home/theprimeagen/work/tvui-automation"] = {
            term = {
                cmds = {
                    "yarn test\n"
                }
            }
        }
    }
})

