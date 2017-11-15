class Api::V1::ApiController < ActionController::Base
    def respond_with_errors(object)
        render json: {errors: ErrorSerializer.serialize(object)}, status: :unprocessable_entity
    end
end
