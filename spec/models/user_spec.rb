require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of username' do
      user = User.new(email: 'test@example.com')
      expect(user).not_to be_valid
    end

    it 'validates presence of email' do
      user = User.new(username: 'testuser')
      expect(user).not_to be_valid
    end
  end
end
