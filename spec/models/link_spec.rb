require 'rails_helper'

describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
end
