ActiveAdmin.register Task do
  permit_params :course_id, :title, :description, :video_url, :image, :preview, :position


  member_action :sort, method: :post do
   resource.set_list_position(params[:position])
  end
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  member_action :sort, method: :post do
    resource.set_list_position(params[:position])
  end
  member_action :move_to_top, method: :post do
    resource.move_to_top
    redirect_to admin_course_path(resource.course), notice: "Task #{resource.title} move to top."
  end
  form do |f|
		f.inputs do
			f.input :title
			f.input :description, as: :html_editor
		end
		f.actions
	end

end
