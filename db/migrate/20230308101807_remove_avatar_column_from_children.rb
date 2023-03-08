class RemoveAvatarColumnFromChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :avatar, :string
  end
end
