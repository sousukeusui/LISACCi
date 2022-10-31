class TentativeUsersController < ApplicationController
    def new
        @tentative_user = TentativeUser.new
    end

    def create
        p '成功'
    end
end
