# Determine Environment
# node.run_state['environment'] = ChefCore::EnvDetector.get_current(node)

# Defaults
default['core_base']['setup_policies'] = true
default['core_base']['setup_firewall'] = true
default['core_base']['setup_antivirus'] = false
default['core_base']['setup_monitoring'] = false
default['core_base']['setup_users'] = false
