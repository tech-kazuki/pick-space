class ContentsController < ApplicationController
  def index
    @contents = Content.order('up_time DESC')
  end
end
