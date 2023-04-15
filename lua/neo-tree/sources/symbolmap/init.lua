
--This file should have all functions that are in the public api and either set
--or read the state of this source.

-- local vim = vim
local renderer = require("neo-tree.ui.renderer")
local manager = require("neo-tree.sources.manager")
local events = require("neo-tree.events")

local M = { name = "symbolmap" }

---Navigate to the given path.
---@param path string Path to navigate to. If empty, will navigate to the cwd.
M.navigate = function(state, path)
	if path == nil then
		path = vim.fn.getcwd()
	end
	state.path = path

	if state.symboltree == nil then
		state.symboltree = { {
			id = "root",
			name = "use 'a' to query symbols",
			type = "directory",
			children = {}
		} }
	end

	renderer.show_nodes(state.symboltree, state)
end

---Configures the plugin, should be called before the plugin is used.
---@param config table Configuration table containing any keys that the user
--wants to change from the defaults. May be empty to accept default values.
M.setup = function(config, global_config)
	-- You most likely want to use this function to subscribe to events
	if config.use_libuv_file_watcher then
		-- manager.subscribe(M.name, {
		-- 	event = events.FS_EVENT,
		-- 	handler = function(args)
		-- 		manager.refresh(M.name)
		-- 	end,
		-- })
	end
end

return M
