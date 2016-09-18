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

include_recipe 'nomad_agent::service_user' if node['nomad_agent']['manage_service_user']

nomad_agent_install node['nomad_agent']['version']

nomad_agent_config ::File.join(node['nomad_agent']['config_dir'], 'nomad.json') do
  general_config node['nomad_agent']['general_config']
  server_config node['nomad_agent']['server_config'] if node['nomad_agent']['server_config']['enabled']
  client_config node['nomad_agent']['client_config'] if node['nomad_agent']['client_config']['enabled']
  consul_config node['nomad_agent']['consul_config'] if node['nomad_agent']['consul_config']
  atlas_config node['nomad_agent']['atlas_config'] if node['nomad_agent']['atlas_config']
  user node['nomad_agent']['service_user'] if node['nomad_agent']['service_user']
  group node['nomad_agent']['service_group'] if node['nomad_agent']['service_group']
  notifies :restart, 'nomad_agent_service[nomad]', :delayed
end

nomad_agent_service 'nomad' do
  config_dir node['nomad_agent']['config_dir']
  data_dir node['nomad_agent']['general_config']['data_dir']
  restart_on_update node['nomad_agent']['restart_on_update']
  user node['nomad_agent']['service_user'] if node['nomad_agent']['service_user']
  group node['nomad_agent']['service_group'] if node['nomad_agent']['service_group']
  action [:enable, :start]
end
