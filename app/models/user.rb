# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  default_password       :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, validate: true

  has_many :missions, foreign_key: "client_id", inverse_of: :user
  # has_many :missions, foreign_key: "agent_id"


  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :missions
  # validates_associated :missions

  def set_default_password_and_token
    random_default_password = Devise.friendly_token.first(6)
    self.password = random_default_password
    self.default_password = random_default_password
    self.token = Devise.friendly_token.first(16)
    true if save
  end
end
