class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def youngest
    @director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).at(0)
    render({ :template => "director_templates/youngest" })
  end

  def eldest
    @director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0)
    render({ :template => "director_templates/eldest" })
  end

  def show
    the_id = params.fetch("the_id")
    @director = Director.where({ :id => the_id }).at(0)
    render({ :template => "director_templates/details" })
  end
end

