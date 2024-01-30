class TaskMailer < ApplicationMailer
    def due_date_reminder(user, task)
      @user = user
      @task = task
      mail(to: @user.email, subject: 'Task Due Date Reminder')
    end
  end