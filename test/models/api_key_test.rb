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

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
