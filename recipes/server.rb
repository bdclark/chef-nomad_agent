#
# Cookbook Name:: nomad_agent
#
# Copyright 2016 Brian Clark
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

node.default['nomad_agent']['config']['server']['enabled'] = true
node.default['nomad_agent']['config']['client']['enabled'] = false

include_recipe 'nomad_agent::service_user' if node['nomad_agent']['manage_service_user']

nomad_agent_install node['nomad_agent']['version']

nomad_agent_config ::File.join(node['nomad_agent']['config_dir'], 'nomad.json') do
  config node['nomad_agent']['config']
  user node['nomad_agent']['service_user']
  group node['nomad_agent']['service_group']
  notifies :restart, 'nomad_agent_service[nomad]', :delayed
end

nomad_agent_service 'nomad' do
  config_dir node['nomad_agent']['config_dir']
  data_dir node['nomad_agent']['config']['data_dir']
  restart_on_update node['nomad_agent']['restart_on_update']
  user node['nomad_agent']['service_user']
  group node['nomad_agent']['service_group']
  action [:enable, :start]
end
