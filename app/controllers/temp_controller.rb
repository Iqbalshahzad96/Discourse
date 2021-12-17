class TempController < ApplicationController

    def index
      render json: { name: "Email", description: "Username" }
    end
  end