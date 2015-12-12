class Shops::HomeController < ApplicationController
  before_filter :authenticate_shop!

  def index
  end
end
