class CreateChildPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :child_posts do |t|
      t.references :child, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
