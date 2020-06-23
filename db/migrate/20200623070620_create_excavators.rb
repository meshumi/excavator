class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.text :company_name
      t.string :address
      t.boolean :crew_on_site, default: false
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
