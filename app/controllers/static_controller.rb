class StaticController < ApplicationController

  def index
  
    @text1 = Text.first
    #@text1 = Text.first
    @text2 = Text.where(id: '2').first
    @text3 = Text.where(id: '3').first 
    @text4 = Text.where(id: '4').first 
    @text5 = Text.where(id: '5').first 
    @text6 = Text.where(id: '6').first 

  end

end
