platform = node['platform']
install_base_list = node['core_base']['linux']['packages']['install_base_list']
install_epel_list = node['core_base']['linux']['packages']['install_epel_list']
package_action = node['core_base']['linux']['packages']['action'].to_sym
deb_package_list = node['core_base']['linux']['packages']['deb_package_list']
rh_package_list = node['core_base']['linux']['packages']['rh_package_list']
rh_epel_package_list = node['core_base']['linux']['packages']['rh_epel_package_list']
suse_package_list = node['core_base']['linux']['packages']['suse_package_list']

# Install Base Packages
ChefCore::Output.report "OS Platform (#{platform})"
case platform
when 'debian', 'ubuntu'
  include_recipe 'apt'
  package deb_package_list do
    action package_action
    only_if { install_base_list }
  end
when 'redhat', 'centos', 'amazon'
  if node['core_base']['linux']['repos']['setup_epel']
    include_recipe 'yum-epel'
    package rh_epel_package_list do
      action package_action
      only_if { install_epel_list }
    end
  end
  package rh_package_list do
    action package_action
    only_if { install_base_list }
  end
when 'suse', 'opensuse'
  package suse_package_list do
    action package_action
    only_if { install_base_list }
  end
else
  ChefCore::Output.break "OS Platform Unknown (#{platform})"
end

# Deploy Node Info Script
template '/usr/bin/nodeinfo' do
  source 'nodeinfo.sh.erb'
  owner 'root'
  group 'root'
  mode 00755
  only_if { node['core_base']['linux']['nodeinfo_script']['deploy'] }
end
