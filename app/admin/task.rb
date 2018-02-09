ActiveAdmin.register Task do
  permit_params :course_id, :title, :description, :video_url, :position


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
      f.input :course_id,  as: :select, :collection => Course.all.pluck(:title, :id), :required => true
			f.input :title, :required => true
			f.input :description, as: :html_editor, :required => true
      f.input :video_url, :required => true, :label => "Video", :placeholder => "Use /embed/fgsagfsa For Youtube"
		end
		f.actions
	end

end
