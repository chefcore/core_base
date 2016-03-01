# rubocop:disable Style/SingleSpaceBeforeFirstArg

name             'core_base'
maintainer       'Chef Core Team'
maintainer_email 'levon.becker@chefcore.com'
license          'MIT'
description      'Foundation Wrapper Cookbook for all Nodes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

recipe 'core_base', 'Every node lands here and is ran through conditions for basic configurations'

depends 'core_library'
depends 'core_users'
depends 'core_security'
depends 'core_monitoring'
depends 'yum-epel'
depends 'apt'

%w(
  amazon
  debian
  ubuntu
  centos
  redhat
  windows
).each do |os|
  supports os
end
