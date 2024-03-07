-- Ignore errors when trying to import the setup file
function includeSetup ()
    require 'lifecycle.setup'
end
pcall(includeSetup)

require 'general'
require 'lazy-init'

-- Ignore errors when trying to import the override file
function includeOverride ()
    require 'lifecycle.override'
end
pcall(includeOverride)
