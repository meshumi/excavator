# frozen_string_literal: true

class SplitExcavatorAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :excavators, :city, :string
    add_column :excavators, :state, :string
    add_column :excavators, :zip, :string
  end
end
