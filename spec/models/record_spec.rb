require 'rails_helper'

RSpec.describe Record, type: :model do
  it {should validate_presence_of :title}
  it {should validate_presence_of :date}
  it {should validate_presence_of :amount}
  it {should validate_length_of(:title).is_at_least(4)}
end
