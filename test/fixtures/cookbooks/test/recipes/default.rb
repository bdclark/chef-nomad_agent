
node.default['nomad_agent']['server_config']['enabled'] = true
node.default['nomad_agent']['server_config']['bootstrap_expect'] = 1
node.override['nomad_agent']['client_config']['enabled'] = true

include_recipe 'apt'

package 'curl'

docker_service 'default' do
  action [:create, :start]
end

include_recipe 'nomad_agent'

ruby_block 'nomad-stabilize' do
  block do
    sleep 10
  end
end

nomad_agent_job 'cadvisor' do
  source 'cadvisor.hcl.erb'
  notifies :run, 'nomad_agent_job[cadvisor]', :delayed
end
