class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:home]
end
