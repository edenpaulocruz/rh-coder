class RecruitersController < ApplicationController
  def index
  end

  def new
    @recruiter = Recruiter.new
  end

  def create
    @recruiter = Recruiter.new(recruiter_params)
    @recruiter.save
    redirect_to @recruiter
  end

  def show
    id = params[:id]
    @recruiter = Recruiter.find(id)
  end

  private

  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password)
  end

end