class CreateImportedFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :imported_files do |t|
      t.column :filename, :string
      t.column :content_type, :string
      t.column :data, :binary
      t.references :spree_user, foreign_key: true
      t.timestamps
    end
  end
end
