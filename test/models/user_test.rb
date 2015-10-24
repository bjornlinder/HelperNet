require 'test_helper'

class UserTest < ActiveSupport::TestCase
  before do
    User.create(
      full_name: 'Alfred Pennyworth',
      user_type: 'admin',
      phone: '5073173104',
      email: 'bjorn@eventmy.com'
    )
  end
end
