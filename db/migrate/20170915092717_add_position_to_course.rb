class AddPositionToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :position, :integer
  end
end
