# rubocop:disable Style/SingleSpaceBeforeFirstArg

name             'core_base'
maintainer       'Bonus Bits'
maintainer_email 'devops@bonusbits.com'
license          'MIT'
description      'Foundation Wrapper Cookbook for all Nodes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

recipe 'core_base', 'Every node lands here and is ran through conditions for basic configurations'

depends 'core_library'
depends 'core_users'
depends 'core_security'
depends 'core_monitoring'
depends 'yum-epel'
depends 'apt'

%w{ debian ubuntu centos redhat windows }.each do |os|
  supports os
end
