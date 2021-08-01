class ImportLine < User
  belongs_to :import

  scope :by_import, ->(import_id) { where(import_id: import_id)}
end
