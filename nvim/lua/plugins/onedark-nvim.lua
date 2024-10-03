return {
	"navarasu/onedark.nvim",
	opts = { style = "darker" },
	config = function(_, opts)
		local onedark = require("onedark")
		onedark.setup(opts)
		onedark.load()
	end
}
