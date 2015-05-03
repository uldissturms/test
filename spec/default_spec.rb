require 'chefspec'
require 'chefspec/berkshelf'

describe 'test::default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'installs nodejs recipe' do
        expect(chef_run).to include_recipe('nodejs')
    end
end
