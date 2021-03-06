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

property :path, String, name_property: true
property :user, String, default: 'root'
property :group, String, default: lazy { node['root_group'] }
property :general_config, Hash, required: true
property :server_config, Hash
property :client_config, Hash
property :consul_config, Hash
property :atlas_config, Hash

default_action :create

action :create do
  nomad_agent_config_file new_resource.path do
    config the_config
    user new_resource.user
    group new_resource.group
  end
end

action :delete do
  file new_resource.path do
    action :delete
  end
end

action_class do
  def whyrun_supported?
    true
  end

  def the_config
    config = general_config.to_h
    config['server'] = server_config if server_config && !server_config.empty?
    config['client'] = client_config if client_config && !client_config.empty?
    config['consul'] = consul_config if consul_config && !consul_config.empty?
    config['atlas'] = atlas_config if atlas_config && !atlas_config.empty?
    config
  end
end
