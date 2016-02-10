require 'rails_helper'

RSpec.describe Locale, type: :model do
  it 'should fail when it has no name' do
    locale = Locale.new

    expect(locale.valid?).to be false
    expect(locale.save).to be false
  end

  it 'should succeed if valid' do
    locale = FactoryGirl.build(:locale)

    expect(locale.valid?).to be true
    expect(locale.save).to be true
  end
end
