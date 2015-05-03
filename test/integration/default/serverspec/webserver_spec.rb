require 'serverspec'
set :backend, :exec

describe command('node -v') do
    its(:exit_status) { should eq 0 }
end

describe port(3000) do
    it { should be_listening }
end

describe port(80) do
    it { should be_listening }
end
