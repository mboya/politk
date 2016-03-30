class CreatePoliticalParties < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string   :name
      t.string   :code
      t.string   :symbol
      t.string   :abr
      
      t.timestamps null: false
    end
  end
end
