class AddTaglineToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tagline, :string
  end
end
