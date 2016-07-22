class StudyPagesController < ApplicationController
  before_action :set_study, only: [:index]
  def index
    @pages = StudyPage.where(:study_id => @study.id).paginate(:page => params[:page],:per_page => 1).order('id')
    #raise @pages.inspect
  end

  def set_study
    @study = Study.find(params[:study_id])
  end
end