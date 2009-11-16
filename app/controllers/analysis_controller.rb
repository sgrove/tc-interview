class AnalysisController < ApplicationController
  def index
    # Tiny bit of usability sugar
    if Actor.count == 0 or Movie.count == 0
      flash[:message] = "Please upload a well-formatted xml file to begin"
      redirect_to :action => 'new'
    end

    # Bit dirty to have presentation here. Should be moved to presentation layer.
    @actors = Actor.all.collect { |a| "<option>#{a}</option>" }
  end

  def new
  end

  def show
    @actor_1 = Actor.find_by_name params[:actor_1_title]
    @actor_2 = Actor.find_by_name params[:actor_2_title]
    @steps   = @actor_1.steps_to @actor_2
  end

  def upload
    results = Movie.parse_xml params[:upload][:data_file] # TODO: Add error checking on xml presence/validity
    flash[:message] = "Parsed file to database"
    redirect_to :action => 'index'
  end

  def destroy
    flash[:message] = "Destroyed all database entries"    
    Movie.destroy_all
    Actor.destroy_all
    redirect_to :action => 'new'
  end
end
