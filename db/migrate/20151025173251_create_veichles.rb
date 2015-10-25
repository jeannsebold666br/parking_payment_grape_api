class CreateVeichles < ActiveRecord::Migration
  def change
    create_table :veichles do |t|
      t.string :identifier
      t.string :type
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
