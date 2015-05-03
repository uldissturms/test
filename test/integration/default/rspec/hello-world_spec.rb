require 'net/http'

describe 'website' do
    it 'should send greatings' do
        endpoint = Net::HTTP.new('localhost', 80)
        response = endpoint.get('/')
        expect(response.body).to match 'Hello World'
    end
end
