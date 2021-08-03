class AddAttributesToImportLines < ActiveRecord::Migration[6.1]
  def change
    add_column :import_lines, :first_name, :string
    add_column :import_lines, :last_name, :string
    add_column :import_lines, :email, :string
    add_column :import_lines, :phone, :string
  end
end
