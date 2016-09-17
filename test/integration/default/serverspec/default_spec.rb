require 'spec_helper'

# install

describe file('/usr/local/bin/nomad') do
  it { should be_file }
  it { should be_executable }
end

# configure

describe file('/etc/nomad/nomad.json') do
  it { should be_file }
  it { should contain '"data_dir": "/var/lib/nomad"' }
  it { should contain('"enabled": true').after(/"server": {/) }
end

# service

describe command('/usr/local/bin/nomad version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/^Nomad v/) }
end

describe service('nomad') do
  it { should be_enabled }
  it { should be_running }
end

# job

describe file('/etc/nomad/jobs/cadvisor.hcl') do
  it { should be_file }
end

describe 'nomad::default' do
  describe command('curl 127.0.0.1:4646/v1/allocations') do
    its(:stdout) { should match(/cadvisor/) }
  end

  describe port(8080) do
    it { should be_listening }
  end
end
