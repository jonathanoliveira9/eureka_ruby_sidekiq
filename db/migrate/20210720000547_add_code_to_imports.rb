class AddCodeToImports < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :code, :string
  end
end
