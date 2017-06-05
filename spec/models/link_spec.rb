require 'rails_helper'

describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }

  describe '#top_ten' do
    it 'returns the top ten views ordered by count' do
      described_class.create!(url: 'http://reddit.com', count: 15)
      described_class.create!(url: 'http://twitter.com', count: 14)
      described_class.create!(url: 'http://mail.ggogle.com', count: 13)
      described_class.create!(url: 'http://github.com', count: 12)
      described_class.create!(url: 'http://turing.io', count: 11)
      described_class.create!(url: 'http://google.com', count: 10)
      described_class.create!(url: 'http://heroku.com', count: 9)
      described_class.create!(url: 'http://travisci.com', count: 8)
      described_class.create!(url: 'http://digitalocean.com', count: 4)
      described_class.create!(url: 'http://memcached.com', count: 2)
      described_class.create!(url: 'http://amazon.com', count: 1)

      top_ten_links = described_class.top_ten
      expect(top_ten_links.count).to eq(10)
      expect(top_ten_links[0].url).to eq('http://reddit.com')
      expect(top_ten_links[-1].url).to eq('http://memcached.com')
      expect(top_ten_links[0].count).to eq(15)
      expect(top_ten_links[-1].count).to eq(2)
    end
  end
end
