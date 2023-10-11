class CreateShoguns < ActiveRecord::Migration[7.0]
  def change
    create_table :shoguns do |t|
      t.integer :score, null: false
      t.timestamps
    end
  end
end
