class StaticPagesController < ApplicationController
  def about
    @info = Info.about
  end

  def contacts
    @info = Info.contacts
  end
end
