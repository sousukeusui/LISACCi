class TentativeUsersController < ApplicationController
    def new
        @tentative_user = TentativeUser.new
    end
end
