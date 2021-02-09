class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :about_me
      t.string :profile_pic

      t.timestamps
    end
  end
end
