module Services
  module Iterable
    class User
      def initialize(user:)
      	@user = user
      end

      def update
        begin
        	iterable_user = self.get_iterable_user
        	response = iterable_user.update @user.email, @user.iterable_user_update_params

        	if response.success?
        	  Rails.logger.info("\n\n User update through #{self.class.to_s} done successfully, API Response: #{response.body} \n\n")
        	  return true
        	else
            error_msg = "User update through #{self.class.to_s} failed, API Response: #{response.body}"
        	  Rails.logger.error("\n\n #{error_msg} \n\n")
        	  # raise error_msg
            return false
        	end
        rescue StandardError => e
          error_msg = "User update through #{self.class.to_s} failed. \n#{e.message}\n" + e.backtrace.join("\n")
          Rails.logger.error("\n\n #{error_msg} \n\n")
          # raise error_msg
          return false
        end
      end

      def delete_by_email
        begin
        	iterable_user = self.get_iterable_user
          response = iterable_user.delete @user.email

          if response.success?
            Rails.logger.info("\n\n User deletion by email through #{self.class.to_s} done successfully, API Response: #{response.body} \n\n")
            return true
          else
            error_msg = "User deletion through #{self.class.to_s} failed, API Response: #{response.body}"
            Rails.logger.error("\n\n #{error_msg} \n\n")
            # raise error_msg
            return false
          end
        rescue StandardError => e
          error_msg = "User deletion through #{self.class.to_s} failed. \n#{e.message}\n" + e.backtrace.join("\n")
          Rails.logger.error("\n\n #{error_msg} \n\n")
          # raise error_msg
          return false
        end
      end

      def delete_by_id
        begin
        	iterable_user = self.get_iterable_user
          response = iterable_user.delete_by_id @user.id

          if response.success?
            Rails.logger.info("\n\n User deletion by user_id through #{self.class.to_s} done successfully, API Response: #{response.body} \n\n")
            return true
          else
            error_msg = "User deletion by user_id through #{self.class.to_s} failed, API Response: #{response.body}"
            Rails.logger.error("\n\n#{error_msg}\n\n")
            # raise error_msg
            return false
          end
        rescue StandardError => e
          error_msg = "User deletion by user_id through #{self.class.to_s} failed. \n#{e.message}\n" + e.backtrace.join("\n")
          Rails.logger.error("\n\n #{error_msg} \n\n")
          # raise error_msg
          return false
        end  
      end

      private

      def get_iterable_user
      	@iterable_user ||= ::Iterable::Users.new
      end

    end
  end
end