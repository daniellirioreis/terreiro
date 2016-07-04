class CreateMemberScales < ActiveRecord::Migration
  def change
    create_table :member_scales do |t|
      t.references :member, index: true, foreign_key: true
      t.references :scale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
