class AddsCounterCacheToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer
    Post.reset_column_information
    Post.all.each do |p|
      Post.update_counters p.id, :comments_count => p.comments.count
    end
  end
end
