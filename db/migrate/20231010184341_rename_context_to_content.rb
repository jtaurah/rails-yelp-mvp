class RenameContextToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :context, :content
  end
end
