class SittersController < ApplicationController

def index
  @sitter = Sitter.find(params[:format])
end

def show
end

end
