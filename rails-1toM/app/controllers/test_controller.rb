class TestController < ApplicationController

  before_action :is_authenticated?

  def index
  end
end
