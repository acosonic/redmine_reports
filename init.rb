Redmine::Plugin.register :redmine_reports do
  name 'Redmine Reports plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu,
    :redmine_reports_link,
    { :controller => 'redmine_reports', :action => 'index'},
    :caption => 'Custom SQL reports',
    :last => true
  menu :top_menu,
    :redmine_new_reports_link,
    { :controller => 'redmine_reports', :action => 'new'},
    :caption => 'New SQL Report',
    :last => true
end
