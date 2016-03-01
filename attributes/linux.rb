# Package Repos
default['core_base']['linux']['repos']['setup_epel'] = true

# Packages
default['core_base']['linux']['packages']['install_base_list'] = true
default['core_base']['linux']['packages']['install_epel_list'] = true
default['core_base']['linux']['packages']['action'] = 'install'
default['core_base']['linux']['packages']['rh_package_list'] = %w(vim-enhanced mlocate wget)
default['core_base']['linux']['packages']['rh_epel_package_list'] = %w(htop)
default['core_base']['linux']['packages']['deb_package_list'] = %w(vim htop mlocate)

# Filesystem
default['core_base']['linux']['setup_mounts'] = true
default['core_base']['linux']['linux_mounts'] = Array.new

# NodeInfo Script
default['core_base']['linux']['nodeinfo_script']['deploy'] = true
default['core_base']['linux']['nodeinfo_script']['content'] = [
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
