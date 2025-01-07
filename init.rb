Redmine::Plugin.register :redmine_heigh10_custom do
  name 'Heigh10 Custom Plugins'
  author 'Deepak Kumar'
  description 'Sends email reminders for issues that have not been responded to for 48hr'
  version '1.0.0'
  requires_redmine version_or_higher: '5.0.0'
end
