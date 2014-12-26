require 'serverspec'

# include Serverspec::Helper::Exec
# include SpecInfra::Helper::Ssh
# include Serverspec::Helper::DetectOS

set :backend, :exec

# RSpec.configure do |c|
#   c.before :all do
#     c.path = '/sbin:/usr/sbin'
#   end
# end

describe user('influxdb') do
  it { should exist }
end

describe service('influxdb') do
  it { should be_running }
end

describe port(8083) do
  it { should be_listening }
end

describe port(8086) do
  it { should be_listening }
end
