class DeleteColumsFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_columns(:users, :name, :birthdate, :city, :country, :gender, :role)
  end
end
