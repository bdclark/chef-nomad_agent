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

property :job_name, String, name_property: true
property :job_dir, String, default: lazy { node['nomad_agent']['job_dir'] }
property :user, String, default: 'root'
property :group, String, default: node['root_group']
property :mode, String, default: '0755'
property :cookbook, String
property :source, String, required: true
property :vars, Hash, default: {}

default_action :create

action :create do
  directory new_resource.job_dir do
    owner 'root'
    group node['root_group']
    mode '0755'
    recursive true
  end

  template job_path do
    cookbook new_resource.cookbook || new_resource.cookbook_name
    source new_resource.source
    variables new_resource.vars
    user new_resource.user
    group new_resource.group
    mode new_resource.mode
    verify { |path| "nomad validate #{path}" } if respond_to?(:verify)
  end
end

action :delete do
  file job_path do
    action :delete
  end
end

action :run do
  execute "nomad run #{job_path}"
end

action :stop do
  execute "nomad stop #{new_resource.job_name}"
end

action_class do
  def whyrun_supported?
    true
  end

  def job_path
    ::File.join(new_resource.job_dir, "#{new_resource.job_name}.hcl")
  end
end
