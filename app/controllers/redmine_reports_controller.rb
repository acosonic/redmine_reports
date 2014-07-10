class RedmineReportsController < ApplicationController
  unloadable


  def index
    user_id = User.current.id
    @reports = RedmineReport.where(["user_id = ? or public_flg = 1 " ,user_id])
  end

  def show
    report_id = params[:id] || 1

    RedmineReport.report_times_count_up(report_id)

    @query   = RedmineReport.where(id: report_id).first.sql
    @results = []
    @results = MultiQuery.new.exec_query(@query)
  end

  def edit
    report_id = params[:id]
    @report = RedmineReport.where(id: report_id).first
  end

  def new
    @report = RedmineReport.new
    @report.user_id = User.current.id
    @report.times = 0
  end

  def create
    @report = RedmineReport.new(params["redmine_report"])

    respond_to do |format|
      if @report.save
        format.html { redirect_to action: 'index'}
        format.json
      else
        format.html { render action: 'new'}
        format.json
      end
    end
  end

  def update
    @report = RedmineReport.where(id: params[:id]).first
    respond_to do |format|
      if @report.update_attributes(params["redmine_report"])
        format.html { redirect_to action: 'index'}
        format.json
      else
        format.html { render action: 'edit'}
        format.json
      end
    end
  end

  def destroy
    record = RedmineReport.where(id: params[:id]).first
    record.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'hogehoge'}
      format.json
    end
  end

  private
  def set_redmine_report
    @report = RedmineReport.find(params[:id])
  end

  def redmine_reports_params
    params.require(:redmine_report).permit(
                                           :id,
                                           :user_id,
                                           :public_flg,
                                           :title,
                                           :sql,
                                           :times)
  end
end
