class CreatePhotoOnes < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_ones do |t|
      t.string :image

      t.timestamps
    end
  end
end
