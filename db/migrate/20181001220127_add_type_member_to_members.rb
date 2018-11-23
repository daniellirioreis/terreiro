class AddTypeMemberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :type_member, :integer
  end
end
