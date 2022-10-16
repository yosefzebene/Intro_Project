class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :service, null: false, foreign_key: true
      t.references :neighbourhood, null: false, foreign_key: true
      t.string :latitude
      t.string :longitude
      t.datetime :date

      t.timestamps
    end
  end
end
