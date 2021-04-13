require("harpoon").setup({
    projects = {
        ["/home/theprimeagen/personal/harpoon/{}"] = {
            term = {
                cmds = {
                    "echo hello {}"
                }
            },
        },

        ["/home/theprimeagen/work/nrdp/{}"] = {
            term = {
                cmds = {
                    "ninja -C /home/theprimeagen/work/nrdp/builds/{} -j 25 && cp compile_commands.json /home/theprimeagen/work/nrdp/{}\n",
                }
            }
        }
    }
})

