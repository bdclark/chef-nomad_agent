require 'spec_helper'

describe 'nomad_agent::default' do
  let(:platform) { 'ubuntu' }
  let(:version) { '14.04' }

  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: platform, version: version) do |_node|
      # Node attribute settings here
    end.converge(described_recipe)
  end

  context 'with ubuntu' do
    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
