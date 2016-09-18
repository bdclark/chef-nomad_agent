
default['nomad_agent']['version'] = '0.4.1'

default['nomad_agent']['manage_service_user'] = false
default['nomad_agent']['service_user'] = nil
default['nomad_agent']['service_group'] = nil

default['nomad_agent']['service_uid'] = nil
default['nomad_agent']['service_gid'] = nil

default['nomad_agent']['bin_dir'] = '/usr/local/bin'
default['nomad_agent']['config_dir'] = '/etc/nomad'
default['nomad_agent']['log_dir'] = '/var/log/nomad' # sysvinit only
default['nomad_agent']['restart_on_update'] = true

default['nomad_agent']['job_dir'] = '/etc/nomad/jobs'

default['nomad_agent']['general_config']['data_dir'] = '/var/lib/nomad'
default['nomad_agent']['server_config'] = Mash.new
default['nomad_agent']['client_config'] = Mash.new
default['nomad_agent']['consul_config'] = Mash.new
default['nomad_agent']['atlas_config'] = Mash.new
