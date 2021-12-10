class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :title
      t.references :country, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.float :tax

      t.timestamps
    end
  end
end
