function run_java_test_all(debug)
	if debug then
		return vim.cmd('TermExec cmd="mvn test -Dmaven.surefire.debug"')
	end
	return vim.cmd('TermExec cmd="mvn test"')
end

function get_test_runner(test_name, debug)
	if debug then
		return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"'
	end
	return 'mvn test -Dtest="' .. test_name .. '"'
end

function run_java_test_method(debug)
	local utils = require("utils")
	local method_name = utils.get_current_full_method_name("\\#")
	vim.cmd('TermExec cmd="' .. get_test_runner(method_name, debug) .. '"')
end

function run_java_test_class(debug)
	local utils = require("utils")
	local class_name = utils.get_current_full_class_name()
	vim.cmd('TermExec cmd="' .. get_test_runner(class_name, debug) .. '"')
end

function get_spring_boot_runner(profile, debug)
	local debug_param = ""
	if debug then
		debug_param =
			"-Dspring-boot.run.jvmArguments=-Xdebug\\ -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
	end

	local profile_param = ""
	if profile then
		profile_param = "-Dspring-boot.run.profiles=" .. profile .. " "
	end

	return "mvn spring-boot:run " .. profile_param .. debug_param
end

function run_spring_boot(debug)
	vim.cmd('TermExec cmd="' .. get_spring_boot_runner("local", debug) .. '"')
end

function attach_to_debug()
	local dap = require("dap")
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to the process",
			hostName = "localhost",
			port = "5005",
		},
	}
	dap.continue()
end

-- Create keybinds

local opts = {
	mode = "n", -- normal mode
	prefix = "<leader>",
	buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	J = {
		name = "Java",
		r = {
			function()
				run_spring_boot()
			end,
			"Run",
		},
		d = {
			function()
				run_spring_boot(true)
			end,
			"Start Debugger",
		},
		a = {
			function()
				attach_to_debug()
			end,
			"Attach to debugger",
		},
		t = {
			name = "Testing",
			m = {
				function()
					require("jdtls").test_nearest_method()
				end,
				"Test Method",
			},
			c = {
				function()
					require("jdtls").test_class()
				end,
				"Test Class",
			},
			a = {
				function()
					run_java_test_all()
				end,
				"All Tests",
			},
			M = {
				function()
					require("jdtls").test_nearest_method(true)
				end,
				"Test Method Debug",
			},
			C = {
				function()
					require("jdtls").test_class(true)
				end,
				"Test Class Debug",
			},
			A = {
				function()
					run_java_test_all(true)
				end,
				"All Tests Debug",
			},
		},
	},
}

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.register(mappings, opts)
