module SimplyWompi
  module Transactions
    module Domain
      module Dtos
        # Create Transaction Payment Method Data Transfer Object
        class CreateTransactionPaymentMethodDto
          attr_reader :type,
                      :token,
                      :installments

          def initialize(
            type:,
            token:,
            installments:
          )
            unless type.is_a?(String)
              raise ArgumentError("ArgumentError type: #{type.class}, is not instance of #{String}")
            end

            unless token.is_a?(String)
              raise ArgumentError("ArgumentError token: #{token.class}, is not instance of #{String}")
            end

            unless installments.is_a?(Integer)
              raise ArgumentError("ArgumentError installments: #{installments.class}, is not instance of #{Integer}")
            end

            @type = type
            @token = token
            @installments = installments
          end
        end
      end
    end
  end
end
