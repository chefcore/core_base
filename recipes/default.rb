ChefCore::Output.report "platform (#{node['platform']})"
ChefCore::Output.report "platform_family (#{node['platform_family']})"
ChefCore::Output.report "os (#{node['os']})"
ChefCore::Output.report "os_version (#{node['os_version']})"

# Linux vs Windows
case node['os']
when 'linux'
  ChefCore::Output.report 'OS Family = Linux'
  include_recipe 'core_base::linux'
when 'windows'
  ChefCore::Output.report 'OS Family = Windows'
  include_recipe 'core_base::windows'
else
  ChefCore::Output.break 'OS Family = Unknown'
end

include_recipe 'core_security::policies' if node['core_base']['setup_policies']
include_recipe 'core_security::firewall' if node['core_base']['setup_firewall']
include_recipe 'core_security::antivirus' if node['core_base']['setup_antivirus']
include_recipe 'core_monitoring::install_clients' if node['core_base']['setup_monitoring']
include_recipe 'core_users::default' if node['core_base']['setup_users']
