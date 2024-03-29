return {
	settings = {
		pylsp = {
			plugins = {
				pyflakes = {
					enabled = false,
				},
				pycodestyle = {
					ignore = { "W391", "E401", "E41", "E226", "E126", "E501", "W504" },
					maxLineLength = 100,
				},
				ruff = {
					enabled = true,
					extendSelect = { "I" },
				},
			},
		},
	},
}
