if defined?(ChefSpec)
  def create_nomad_agent_install(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_install, :create, res_name)
  end

  def remove_nomad_agent_install(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_install, :remove, res_name)
  end

  def create_nomad_agent_config(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_config, :create, res_name)
  end

  def delete_nomad_agent_config(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_config, :delete, res_name)
  end

  def create_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :create, res_name)
  end

  def enable_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :enable, res_name)
  end

  def disable_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :disable, res_name)
  end

  def start_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :start, res_name)
  end

  def stop_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :stop, res_name)
  end

  def restart_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :restart, res_name)
  end

  def reload_nomad_agent_service(res_name)
    ChefSpec::Matchers::ResourceMatcher.new(:nomad_agent_service, :reload, res_name)
  end
end
