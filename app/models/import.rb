class Import < ApplicationRecord
  has_many :import_lines
  enum status: [:fail, :in_progress, :success]
  validates :status, presence: true
end
