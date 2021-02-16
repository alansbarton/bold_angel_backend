class CreatePhotoTwos < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_twos do |t|
      t.string :image

      t.timestamps
    end
  end
end
