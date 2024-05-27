return {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
        require('ultimate-autopair').setup({
            extensions = {
                tsnode = false,
                utf8 = false,
            }
        })
    end
}

