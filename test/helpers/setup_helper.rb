# frozen_string_literal: true

module SetupHelper
  def setup_user_one
    @user = users(:one)
    sign_up(@user)
    @json_headers = { "Accept": 'application/json', "Content-Type": 'application/json' }
  end
end
