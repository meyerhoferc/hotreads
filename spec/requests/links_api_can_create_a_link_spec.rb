require 'rails_helper'

describe 'Links API' do
  describe 'POST /api/v1/links' do
    it 'creates and validates a new link' do
      post '/api/v1/links', params: {url: 'http://turing.io'}

      expect(Link.count).to eq(1)

      expect(response).to be_success
      link_json = JSON.parse(response.body)
      expect(link_json['url']).to eq('http://turing.io')
      expect(link_json['count']).to eq(1)
    end

    it 'increases the count for an existing link' do
      Link.create!(url: 'http://github.com', count: 1)
      post '/api/v1/links', params: {url: 'http://github.com'}

      expect(Link.count).to eq(1)

      expect(response).to be_success
      link_json = JSON.parse(response.body)
      expect(link_json['url']).to eq('http://github.com')
      expect(link_json['count']).to eq(2)
    end
  end
end
