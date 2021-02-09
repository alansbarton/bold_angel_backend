class CreatePhotos2s < ActiveRecord::Migration[6.0]
  def change
    create_table :photos_2s do |t|
      t.string :image

      t.timestamps
    end
  end
end
