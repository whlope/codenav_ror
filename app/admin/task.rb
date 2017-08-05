ActiveAdmin.register Task do

permit_params :task_id, :title, :description, :video_url, :price, :status, :image

end
