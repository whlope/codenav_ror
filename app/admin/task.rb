ActiveAdmin.register Task do
  permit_params :task_id, :title, :description, :video_url, :price, :status, :image, :preview, :position

  member_action :sort, method: :post do
   resource.set_list_position(params[:position])
  end
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
