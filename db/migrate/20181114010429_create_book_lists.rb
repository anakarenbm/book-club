class CreateBookLists < ActiveRecord::Migration[5.2]
  def change
    create_table :book_lists do |t|
      t.references :book, foreign_key: true
      t.integer :status
      t.integer :pages_read

      t.timestamps
    end
  end
end
