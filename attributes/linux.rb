# Linux Defaults
default['core_base']['linux']['setup_mounts'] = true
default['core_base']['linux']['setup_repos'] = true
default['core_base']['linux']['linux_mounts'] = Array.new

# Linux Distro Family Defaults
default['core_base']['linux']['rhel']['blah'] = true

default['core_security']['firewall']['rules'] = {
  'ssh' => {
    'port' => 22,
    'protocol' => 'tcp',
    'action' => 'allow'
  }
}
