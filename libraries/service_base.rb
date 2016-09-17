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

module NomadAgentCookbook
  class NomadAgentService < ChefCompat::Resource
    Boolean = property_type(
      is: [true, false],
      default: false
    ) unless defined?(Boolean)

    property :service_name, String, name_property: true
    property :program, String, default: lazy { ::File.join(node['nomad_agent']['bin_dir'], 'nomad') }
    property :data_dir, String, required: true
    property :config_dir, String, required: true
    property :log_dir, String, default: lazy { node['nomad_agent']['log_dir'] }
    property :user, String, default: 'root'
    property :group, String, default: lazy { node['root_group'] }
    property :environment, Hash
    property :restart_on_update, Boolean, default: true

    default_action :create

    action :create do
      ensure_config
      create_init
    end

    action :start do
      ensure_config
      create_init
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :start
      end
    end

    action :restart do
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :restart
      end
    end

    action :reload do
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :reload
      end
    end

    action :enable do
      ensure_config
      create_init
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :enable
      end
    end

    action :stop do
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :stop
        only_if { ::File.exist?(service_file) }
      end
    end

    action :disable do
      service nomad_service_name do
        supports restart: true, reload: true, status: true
        action :disable
        only_if { ::File.exist?(service_file) }
      end
    end

    declare_action_class.class_eval do
      def whyrun_supported?
        true
      end

      def ensure_config
        raise 'config_dir is required' if new_resource.config_dir.nil?
      end

      def create_directories
        directory data_dir do
          owner new_resource.user
          group new_resource.group
          mode '0755'
          recursive true
          action :create
        end
        directory config_dir do
          owner 'root'
          group 'root'
          mode '0755'
          recursive true
          action :create
        end
      end

      def nomad_service_name
        service_name == 'nomad' ? 'nomad' : "nomad-#{service_name}"
      end

      def daemon_options
        "agent --config #{config_dir}"
      end

      def default_environment
        {
          'GOMAXPROCS' => [node['cpu']['total'], 2].max.to_s,
          'PATH' => '/usr/local/bin:/usr/bin:/bin'
        }
      end
    end
  end
end
