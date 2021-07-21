class ApplicationController < ActionController::API

include AuthorisationHelper
include ScoreCalculator
include ExceptionHandler
end
