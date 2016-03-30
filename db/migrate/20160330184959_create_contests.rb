class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string   :name
	  t.integer  :constituency_id
	  t.integer  :county_id
	  t.integer  :contestType
	  t.string   :location_type
	  t.string   :code
	  t.integer  :ward_id

      t.timestamps null: false
    end
  end
end
