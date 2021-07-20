class ApplicationController < ActionController::API

include AuthorisationHelper
include ScoreCalculator
end
