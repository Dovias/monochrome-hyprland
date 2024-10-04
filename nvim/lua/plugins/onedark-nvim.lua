return {
	"navarasu/onedark.nvim",
	opts = { style = "warmer" },
	config = function(_, opts)
		local onedark = require("onedark")
		onedark.setup(opts)
		onedark.load()
	end
}
