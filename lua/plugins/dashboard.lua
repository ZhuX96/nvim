local dashboard_status, dashboard = pcall(require, 'dashboard')
if not dashboard_status then
  print('Failed to require dashboard')
  return
end

dashboard.setup({
  theme = 'doom',
  config = {
    header = {
[[                                                                            ]],
[[                                                                            ]],
[[                                                                            ]],
[[ ███╗   ██╗███████╗██╗    ██╗         ██╗███████╗ █████╗ ███╗   ██╗███████╗ ]],
[[ ████╗  ██║██╔════╝██║    ██║         ██║██╔════╝██╔══██╗████╗  ██║██╔════╝ ]],
[[ ██╔██╗ ██║█████╗  ██║ █╗ ██║         ██║█████╗  ███████║██╔██╗ ██║███████╗ ]],
[[ ██║╚██╗██║██╔══╝  ██║███╗██║    ██   ██║██╔══╝  ██╔══██║██║╚██╗██║╚════██║ ]],
[[ ██║ ╚████║███████╗╚███╔███╔╝    ╚█████╔╝███████╗██║  ██║██║ ╚████║███████║ ]],
[[ ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝      ╚════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ]],
[[                                                                            ]],
[[                                                                            ]],
[[                                                                            ]],
    },
    center = {
      { icon = ' ', desc = 'Save',                key = '<Leader>  w', key_format = '%s' },
      { icon = ' ', desc = 'Quit',                key = '<Leader>  q', key_format = '%s' },
      { icon = ' ', desc = 'Find File',           key = '<Leader> ff', key_format = '%s' },
      { icon = ' ', desc = 'Horizontal Terminal', key = '      \\\\t', key_format = '%s' },
      { icon = ' ', desc = 'Float Terminal',      key = '      \\\\f', key_format = '%s' },
    },
    footer = { 'Duties we each bear, but one\' duty is a solitary affair' }
  }
})

