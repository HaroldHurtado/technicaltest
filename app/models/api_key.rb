# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  email      :string
#  key        :string
#  total_use  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'digest'

class ApiKey < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :key, uniqueness: true
    before_create :init
    after_create :generate_key

    private
        def init
            self.total_use  ||= 0
        end

        def generate_key
            key = Digest::MD5.hexdigest(self.email)
            self.update_attribute(:key, key)
        end
end
