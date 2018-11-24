class AddOwnerableToBookLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_lists, :ownerable, polymorphic: true, index: true
  end
end
