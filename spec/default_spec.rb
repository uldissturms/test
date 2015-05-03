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
end
