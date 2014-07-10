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
    :caption => 'report',
    :last => true

end
