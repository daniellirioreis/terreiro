class CreateMemberSaints < ActiveRecord::Migration
  def change
    create_table :member_saints do |t|
      t.references :member, index: true, foreign_key: true
      t.integer :line
      t.string :name

      t.timestamps null: false
    end
  end
end
