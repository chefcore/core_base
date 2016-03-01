# Windows Defaults
default['core_base']['windows']['setup_powershell'] = true
default['core_base']['windows']['setup_winrm'] = true
default['core_base']['windows']['add_users'] = true

default['core_base']['windows']['nodeinfo_script']['deploy'] = true
default['core_base']['windows']['nodeinfo_script']['content'] = [
  "IP Address:           (#{node['ipaddress']})",
  "Hostname:             (#{node['hostnmae']})",
  "FQDN:                 (#{node['fqdn']})",
  "Platform:             (#{node['platform']})",
  "Platform Version:     (#{node['platform_version']})",
  "CPU Count:            (#{node['cpu']['total']})",
  "Memory:               (#{node['memory']['total']})",
  "Detected Environment: (#{node.run_state['environment']})",
  "Chef Roles:           (#{node['roles']})",
  "Chef Recipes:         (#{node['recipes']})"
]
