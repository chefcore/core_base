# Determine Environment
run_state['detected_environment'] =
    if /dev|qa|stg|prd/.match(node.environment)
      /dev|qa|stg|prd/.match(node.environment).to_s.downcase
    else
      'dev' # For when environment is default Chef-Zero/Chef-Solo just consider it Dev
    end

# Defaults
default['core_base']['setup_policies'] = true
default['core_base']['setup_firewall'] = true
default['core_base']['setup_antivirus'] = false
default['core_base']['setup_monitoring'] = false
default['core_base']['setup_users'] = false
