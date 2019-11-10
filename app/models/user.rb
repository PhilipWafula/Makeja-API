# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  ROLES = %w[admin
             owner
             property_admin
             caretaker
             guest].freeze

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  before_validation :format_phone_number
  validates :full_name,
            allow_blank: true,
            length: { maximum: 50 }

  validates :phone,
            presence: true

  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  scope :with_role, lambda { |role|
    { conditions: "roles_mask & #{2**ROLES.index(role.to_s)} > 0 " }
  }

  def is_whitelisted_email(email)

  end

  protected

  def format_phone_number
    self.phone = Utilities::NormalizePhone.internationalize_phone(phone, 'KE') if attribute_present?('phone')
  end

  def role_symbols
    roles.map(&:to_sym)
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
end
