ActiveAdmin.register Task do
  permit_params :task_id, :title, :description, :video_url, :price, :status, :image, :preview

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
