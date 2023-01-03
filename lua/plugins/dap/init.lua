
local dap = require('dap')
local dapUi = require('dapui')

local Hydra = require('hydra')

local hint = [[
 _n_: step over 
 _s_: Continue/Start
 _b_: Breakpoint
 _K_: Eval
 _i_: step into
 _o_: step out
 _c_: to cursor
 ^ ^
 _C_: Close UI
 _O_: Open UI
 ^ ^
 _q_: exit
]]    

local dap_hydra = Hydra({
   hint = hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'middle-right',
         border = 'rounded',
         show_name = false,
      },
      on_enter = function ()
        dapUi.open()
      end,
   },
   name = 'DEBUG',
   mode = {'n','x'},
   body = '<F4>',
   heads = {
      { 'n', dap.step_over, { silent = true } },
      { 'i', dap.step_into, { silent = true } },
      { 'o', dap.step_out, { silent = true } },
      { 'c', dap.run_to_cursor, { silent = true } },
      { 's', dap.continue, { silent = true } },
      { 'C', ":lua require('dapui').close()<cr>", { silent = true } },
      { 'O', ":lua require('dapui').open()<cr>", { silent = true } },
      { 'b', dap.toggle_breakpoint, { silent = true } },
      { 'K', ":lua require('dap.ui.widgets').hover()<CR>", { silent = true } },
      {
          'q',
          function ()
            dapUi.close()
            dap.close()
          end,
          { exit = true, nowait = true }
      },
   }
})

Hydra.spawn = function(head)
	if head == 'dap-hydra' then
		dap_hydra:activate()
	end
end


require 'plugins.dap.ui'
require 'plugins.dap.php'
require 'plugins.dap.js'

require('dap.ext.vscode').load_launchjs()
