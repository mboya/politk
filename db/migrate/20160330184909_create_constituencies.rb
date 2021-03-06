class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string   :name
      t.integer  :county_id
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.string   :code
      t.string   :polygon
      t.string   :center
      t.string   :latitude
      t.string   :longitude

      t.timestamps null: false
    end
  end
end
