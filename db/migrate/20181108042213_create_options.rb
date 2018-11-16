class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :votes
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
