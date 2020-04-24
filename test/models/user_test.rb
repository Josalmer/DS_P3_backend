# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'users have to_s method' do
    @user.to_s
    assert :success
  end
end
