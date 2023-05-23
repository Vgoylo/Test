class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.string :company_name, null: false
      t.string :address
      t.boolean :crew_on_site

      t.timestamps
    end
  end
end
