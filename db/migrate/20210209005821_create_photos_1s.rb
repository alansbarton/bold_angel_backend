class CreatePhotos1s < ActiveRecord::Migration[6.0]
  def change
    create_table :photos_1s do |t|
      t.string :image

      t.timestamps
    end
  end
end
