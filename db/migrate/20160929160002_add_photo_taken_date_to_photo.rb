class AddPhotoTakenDateToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :photo_taken_date, :datetime
  end
end
