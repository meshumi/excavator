# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.datetime :response_due_date_time
      t.string :primary_area_sa_code
      t.text :additional_area_sa_codes, default: [], array: true
      t.text :well_known_text
      t.timestamps
    end
  end
end
