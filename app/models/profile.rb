# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  username   :string
#  phone      :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
end
