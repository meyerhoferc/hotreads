require 'rails_helper'

describe 'an authenticated user visits /' do
  it 'sees the top 10 most marked-as-read links' do
    Link.create(url: 'http://reddit.com', count: 15)
    Link.create(url: 'http://twitter.com', count: 14)
    Link.create(url: 'http://mail.ggogle.com', count: 13)
    Link.create(url: 'http://github.com', count: 12)
    Link.create(url: 'http://turing.io', count: 11)
    Link.create(url: 'http://google.com', count: 10)
    Link.create(url: 'http://heroku.com', count: 9)
    Link.create(url: 'http://travisci.com', count: 8)
    Link.create(url: 'http://digitalocean.com', count: 4)
    Link.create(url: 'http://memcached.com', count: 2)
    Link.create(url: 'http://amazon.com', count: 1)

    visit root_path

    within('h1') do
      expect(page).to have_content('Welcome to Hot Reads')
    end

    within('.links') do
      expect(page).to have_content('Top 10 Links')
      expect(page).to have_content('1: http://reddit.com')
      expect(page).to have_content('2: http://twitter.com')
      expect(page).to have_content('3: http://mail.google.com')
      expect(page).to have_content('4: http://github.com')
      expect(page).to have_content('5: http://turing.io')
      expect(page).to have_content('6: http://google.com')
      expect(page).to have_content('7: http://heroku.com')
      expect(page).to have_content('8: http://travisci.com')
      expect(page).to have_content('9: http://digitalocean.com')
      expect(page).to have_content('10: http://memcached.com')
      expect(page).to_not have_content('http://amazon.com')
    end
  end
end
