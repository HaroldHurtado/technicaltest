class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :email
      t.string :key
      t.integer :total_use

      t.timestamps
    end
  end
end
