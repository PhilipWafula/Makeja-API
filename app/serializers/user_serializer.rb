# frozen_string_literal: true
class UserSerializer < JSONAPI::Serializable::Resource
  type 'users'
  has_many :assignments
  attributes :id,
             :email,
             :full_name,
             :phone,
             :phone_confirmed,
             :phone_confirmed_at,
             :created_at,
             :updated_at
end