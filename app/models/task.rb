class Task < ApplicationRecord
  belongs_to :user
  validates :status, presence: true, inclusion: { in: %w[ToDo InProgress Done] }
  validates :title, :due_date, :priority, presence: true

  def self.search(params, tasks_scope)
    tasks = tasks_scope
    tasks = tasks.where("title ILIKE ?", "%#{params[:title]}%") if params[:title].present?
    tasks = tasks.where("status = ?", params[:status]) if params[:status].present?
    tasks = tasks.where("due_date = ?", params[:due_date]) if params[:due_date].present?
    tasks
  end

  def self.check_due_dates
    Task.where('due_date <= ?', Date.today).find_each do |task|
      TaskMailer.due_date_reminder(task.user, task).deliver_now
    end
  end
end
