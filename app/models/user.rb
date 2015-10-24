class User < ActiveRecord::Base
  has_many :help_requests
end
