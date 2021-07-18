class CreateImportLines < ActiveRecord::Migration[6.1]
  def change
    create_table :import_lines do |t|
      t.integer :import_id
      t.string :error_message
      t.string :string

      t.timestamps
    end
  end
end
