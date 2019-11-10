# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  subject { @user }

  # full name attribute tests
  it { should allow_value('', nil).for(:full_name) }

  # phone number attribute tests
  it { should validate_presence_of(:phone) }

  # password attribute tests
  it { should validate_confirmation_of(:password) }

  # email attribute format tests
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('example@domain.com').for(:email) }

  describe 'when email format is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

end
