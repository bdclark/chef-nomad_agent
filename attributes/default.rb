
default['nomad_agent']['version'] = '0.4.1'

default['nomad_agent']['manage_service_user'] = true
default['nomad_agent']['service_user'] = 'nomad'
default['nomad_agent']['service_group'] = 'nomad'

default['nomad_agent']['service_uid'] = nil
default['nomad_agent']['service_gid'] = nil

default['nomad_agent']['bin_dir'] = '/usr/local/bin'
default['nomad_agent']['config_dir'] = '/etc/nomad'
default['nomad_agent']['log_dir'] = '/var/log/nomad' # sysvinit only
default['nomad_agent']['restart_on_update'] = true

default['nomad_agent']['job_dir'] = '/etc/nomad/jobs'

default['nomad_agent']['config']['data_dir'] = '/var/lib/nomad'
# default['nomad_agent']['config']['client_addr'] = '0.0.0.0'
# default['nomad_agent']['config'] = Mash.new
