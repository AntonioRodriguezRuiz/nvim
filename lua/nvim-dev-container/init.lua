require("devcontainer").setup {
    -- Can be set to false to prevent generating default commands
    -- Default commands are listed below
    generate_commands = true,
    -- By default no autocommands are generated
    -- This option can be used to configure automatic starting and cleaning of containers
    autocommands = {
        -- can be set to true to automatically start containers when devcontainer.json is available
        init = false,
        -- can be set to true to automatically remove any started containers and any built images when exiting vim
        clean = false,
        -- can be set to true to automatically restart containers when devcontainer.json file is updated
        update = false,
    },
    -- can be changed to increase or decrease logging from library
    log_level = "info",
    -- can be set to true to disable recursive search
    -- in that case only .devcontainer.json and .devcontainer/devcontainer.json files will be checked relative
    -- to the directory provided by config_search_start
    disable_recursive_config_search = false,
    -- can be set to false to disable image caching when adding neovim
    -- by default it is set to true to make attaching to containers faster after first time
    cache_images = true,
    -- By default all mounts are added (config, data and state)
    -- This can be changed to disable mounts or change their options
    -- This can be useful to mount local configuration
    -- And any other mounts when attaching to containers with this plugin
    attach_mounts = {
        neovim_config = {
            -- enables mounting local config to /root/.config/nvim in container
            enabled = true,
            -- makes mount readonly in container
            -- options = { "readonly" }
        },
        neovim_data = {
            -- enables mounting local data to /root/.local/share/nvim in container
            enabled = true,
            -- no options by default
            options = {}
        },
        -- Only useful if using neovim 0.8.0+
        neovim_state = {
            -- enables mounting local state to /root/.local/state/nvim in container
            enabled = true,
            -- no options by default
            options = {}
        },
    },
    -- This takes a string (usually either "podman" or "docker") representing container runtime - "devcontainer-cli" is also partially supported
    -- That is the command that will be invoked for container operations
    -- If it is nil, plugin will use whatever is available (trying "podman" first)
    container_runtime = 'docker',
    -- Similar to container runtime, but will be used if main runtime does not support an action - useful for "devcontainer-cli"
    backup_runtime = 'docker',
    -- This takes a string (usually either "podman-compose" or "docker-compose") representing compose command - "devcontainer-cli" is also partially supported
    -- That is the command that will be invoked for compose operations
    -- If it is nil, plugin will use whatever is available (trying "podman-compose" first)
    compose_command = 'docker-compose',
    -- Similar to compose command, but will be used if main command does not support an action - useful for "devcontainer-cli"
    backup_compose_command = 'docker-compose',
}
