namespace :redmine do
    desc "Send reminders for unresponded issues"
    task send_unresponded_issues_reminder: :environment do
      days = ENV['days'] || 2
      threshold_date = days.to_i.days.ago
  
      issues = Issue.joins("LEFT JOIN journals ON journals.journalized_id = issues.id")
                    .where("issues.updated_on < ?", threshold_date)
                    .where("journals.id IS NULL")
                    .where(status_id: IssueStatus.where(is_closed: false))
                    .where.not(assigned_to_id: nil)
  
      issues.each do |issue|
        Mailer.deliver_issue_reminder(issue)
        puts "Reminder sent for issue ##{issue.id} - #{issue.subject}"
      end
    end
  end
  