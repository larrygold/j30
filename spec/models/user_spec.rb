require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do

      it 'can create a user' do
        user = User.new(first_name:'Lala', last_name: 'Gogo', email: 'larry@goldstein.fr', password:'lalala', password_confirmation: 'lalala').save
        expect(user).to eq(true)
      end

    it 'has a first name' do
      user = User.new(first_name:'', last_name: 'Gogo', email: 'larry@goldstein.fr', password:'lalala', password_confirmation: 'lalala').save
      expect(user).to eq(false)
    end

    it 'does not have a first name with spaces' do
      user = User.new(first_name:'  ', last_name: 'Gogo', email: 'larry@goldstein.fr', password:'lalala', password_confirmation: 'lalala').save
      expect(user).to eq(false)
    end

    it 'does not have the same email as another user' do
      user1 = User.new(first_name:'Lala', last_name: 'Gogo', email: 'larry@goldstein.fr', password:'lalala', password_confirmation: 'lalala').save
      user2 = User.new(first_name:'Jean', last_name: 'Valjean', email: 'larry@goldstein.fr', password:'jvjvjv', password_confirmation: 'jvjvjv').save
      expect(user2).to eq(false)
    end
  end

end
