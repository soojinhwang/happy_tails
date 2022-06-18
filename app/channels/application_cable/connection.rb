module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identify_by :current_user

    # def connect
    #   self.current_user = find_by_verified_user
    # end

    # private

    # def find_by_verified_user
    #   if verified_user = User.find_by(id: cookies.encrypted[:user_id])
    #     verified_user
    #   else
    #     reject_unauthorized_connection
    #   end
    # end
  end
end
