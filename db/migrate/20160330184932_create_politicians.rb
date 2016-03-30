class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string   :code
	  t.string   :other_name
	  t.integer  :contest_type
	  t.string   :running_mate
	  t.integer  :political_party_id
	  t.string   :political_party_code
	  t.integer  :contest_id
	  t.string   :contest_code
	  t.string   :surname
	  t.string   :picture
	    
	  t.text     :primary_secondary_school
	  t.text     :undergraduate_school
	  t.text     :graduate_school
	  t.date     :date_of_birth
	  t.string   :email
	  t.text     :hobbies
	  t.string   :website
	  t.text     :previous_position
	  t.string   :home_county
	  t.boolean  :is_verified
	  t.string   :profession

      t.timestamps null: false
    end
  end
end
