class Job < ApplicationRecord
  validates :company_id, :presence => true
end
