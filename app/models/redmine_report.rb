class RedmineReport < ActiveRecord::Base
  unloadable

  def self.report_times_count_up(id)
    this = self.where(id: id).first
    this.times += 1
    this.save
  end
end
