def load_config
  YAML.load_file "#{PATH}/config/config.yml"
end

CONFIG = load_config

VM_IP = CONFIG.fetch "vm_ip"
VM_USERNAME = CONFIG.fetch "vm_username"
