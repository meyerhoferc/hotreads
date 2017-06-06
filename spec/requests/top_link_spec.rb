require 'rails_helper'

describe 'Links API' do
  describe 'GET api/v1/top-link' do
    it 'is the link with the most amount of reads in the last day' do
      Link.create!(url: 'http://reddit.com', count: 15)
      Link.create!(url: 'http://twitter.com', count: 14)
      Link.create!(url: 'http://mail.ggogle.com', count: 13)
      Link.create!(url: 'http://github.com', count: 12)
      Link.create!(url: 'http://turing.io', count: 11)
      Link.create!(url: 'http://google.com', count: 10)
      Link.create!(url: 'http://heroku.com', count: 9)
      Link.create!(url: 'http://travisci.com', count: 8)
      Link.create!(url: 'http://digitalocean.com', count: 4)
      Link.create!(url: 'http://memcached.com', count: 2)
      Link.create!(url: 'http://amazon.com', count: 1)

      get '/api/v1/top-link'

      expect(response).to be_success
      link_json = JSON.parse(response.body)

      expect(link_json[0]['url']).to eq('http://reddit.com')
    end
  end
end
