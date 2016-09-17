
node.default['nomad_agent']['config']['server']['enabled'] = true
node.default['nomad_agent']['config']['server']['bootstrap_expect'] = 1
node.default['nomad_agent']['config']['client']['enabled'] = true

include_recipe 'apt'

package 'curl'

docker_service 'default' do
  action [:create, :start]
end

# use client recipe to run as root
include_recipe 'nomad_agent::client'

ruby_block 'nomad-stabilize' do
  block do
    sleep 10
  end
end

nomad_agent_job 'cadvisor' do
  source 'cadvisor.hcl.erb'
  notifies :run, 'nomad_agent_job[cadvisor]', :delayed
end
