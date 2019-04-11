class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :detail
      t.string :up_time
      t.text :image_url
      t.string :source

      t.timestamps
    end
  end
end
