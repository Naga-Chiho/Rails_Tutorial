# frozen_string_literal: true

class AddImageToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :image, :binary
  end
end
