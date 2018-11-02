class User < ApplicationRecord
  serialize :jobtype, Array
  has_many :jobs
end
