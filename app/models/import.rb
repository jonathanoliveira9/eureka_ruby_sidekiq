class Import < ApplicationRecord
  enum status: [:fail, :in_progress, :success]
end
