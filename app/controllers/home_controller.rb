class HomeController < ApplicationController
  before_action :authenticate_musician!, :except => [:index, :show]

  def index
  end

  def m
    @musician = current_musician
    @mix = Mix.new
    @mix.name = lol_name
  end

  private
  def lol_name
    case Random.new.rand(3)
    when 0
      Faker::Company.name
    when 1
      Faker::Company.catch_phrase
    when 2
      Faker::Company.bs
    end
  end
end

