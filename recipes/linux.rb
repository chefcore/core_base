# Linux Distro Specific
case node['platform']
  when 'debian', 'ubuntu'
    ChefCore::Output.report 'OS = Ubuntu or Debian'
    include_recipe 'apt'
    # Install Base Packages
    package_list = %w(vim htop)
    package_list.each do |package|
      apt_package package do
        action :install
      end
    end
  when 'redhat', 'centos', 'fedora'
    ChefCore::Output.report 'OS = redhat, centos or fedora'
    include_recipe 'yum-epel'
    # Install Base Packages
    package_list = %w(vim htop mlocate)
    package_list.each do |package|
      yum_package package do
        action :install
        flush_cache [:before]
      end
    end
  else
    ChefCore::Output.report "OS = Unknown (#{node['platform']})"
end

# core_library_filesystem 'Mount Linux Shares' do
#   action :linux_mounts
#   only_if { node['core_base']['linux']['setup_mounts'] }
# end
