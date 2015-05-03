require 'chefspec'
require 'chefspec/berkshelf'

describe 'test::default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    before do
        stub_command("netstat -l | grep :3000").and_return(false)
    end

    it 'installs nodejs recipe' do
        expect(chef_run).to include_recipe('nodejs')
    end

    it 'installs nginx package' do
        expect(chef_run).to install_package('nginx')
    end
    
    it 'enables nginx' do
        expect(chef_run).to start_service('nginx')
    end
end
