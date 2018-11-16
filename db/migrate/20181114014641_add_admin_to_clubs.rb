class AddAdminToClubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :admin, foreign_key: { to_table: :users }
  end
end
