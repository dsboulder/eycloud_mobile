class EnvironmentsController < ApplicationController
  def index
    @environments = @mechanized_session.environments
  end

  def show
    environments = @mechanized_session.environments
    @environment = environments.detect{|e| e[:title] == params[:id]}
  end

end
