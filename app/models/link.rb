class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def self.top_ten
    Link.where('updated_at >= ?', 1.day.ago).order('count desc').limit(10)
  end

  def self.top_link
    Link.where('updated_at >= ?', 1.day.ago).order('count desc').limit(1)
  end
end
