class Import < ApplicationRecord
  has_many :import_lines, dependent: :destroy
  enum status: [:failed, :in_progress, :success]
  validates :status, presence: true
  after_create :generate_code

  has_one_attached :attachment_template

  def generate_code
    self.code = Date.today.strftime("%Y%m%d") + id.to_s
    self.save
  end
end
