class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :nullify
end
