ActiveAdmin.register Task do
  filter :due_date, as: :check_boxes, collection: proc { Task.due_this_week }

  index do
    column :title
    column :project
    column :is_done
    column :due_date
  end


  show do
    panel "Task Details" do
      attributes_table_for task do
        row("Status") { status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
        row("Title") { task.title }
        row("Project") { link_to task.project.title, admin_project_path(task.project) }
        row("Due Date") { task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
    active_admin_comments
  end

  controller do
    def index
    end
  end
end
