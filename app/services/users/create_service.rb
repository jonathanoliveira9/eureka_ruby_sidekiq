module Users
  class CreateService
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def run
      process
    end

    private

    def process
      User.create(user_params)
    rescue ActiveModel::ValidationError => e
      raise e
    end

    def user_params
      params.permit(:first_name, :last_name, :email, :phone)
    end
  end
end
