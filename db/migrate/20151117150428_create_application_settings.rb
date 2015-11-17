class CreateApplicationSettings < ActiveRecord::Migration
  def change
    create_table :application_settings do |t|
      t.text :data

      t.timestamps null: false
    end
  end
end
