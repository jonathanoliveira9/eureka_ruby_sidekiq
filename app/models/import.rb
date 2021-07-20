class Import < ApplicationRecord
  has_many :import_lines
  enum status: [:fail, :in_progress, :success]
  validates :status, presence: true
  after_create :generate_code

  def generate_code
    self.code = Date.today.strftime("%Y%m%d") + id.to_s
    self.save
  end
end
