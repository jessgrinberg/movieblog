class AddPaperclipToPost < ActiveRecord::Migration
  def change
  	add_attachment :movies, :image
  end
end
