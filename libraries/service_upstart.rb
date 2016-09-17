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
  class NomadAgentServiceUpstart < NomadAgentService
    use_automatic_resource_name

    provides :nomad_agent_service, platform: 'ubuntu' do |node|
      node['platform_version'].to_f < 15.10
    end

    action_class.class_eval do
      def service_file
        "/etc/init/#{nomad_service_name}.conf"
      end

      def create_init
        create_directories

        template "/etc/init/#{nomad_service_name}.conf" do
          source 'upstart.service.erb'
          cookbook 'nomad_agent'
          owner 'root'
          group 'root'
          mode '0755'
          variables(
            name: nomad_service_name,
            command: "#{new_resource.program} #{daemon_options}",
            environment: new_resource.environment || default_environment,
            service_user: new_resource.user
          )
          if new_resource.restart_on_update && ::File.exist?(service_file)
            notifies :restart, "nomad_agent_service[#{nomad_service_name}]", :delayed
          end
        end
      end
    end
  end
end
