class Import < ApplicationRecord
  enum status: [:failed, :in_progress, :success]
end
