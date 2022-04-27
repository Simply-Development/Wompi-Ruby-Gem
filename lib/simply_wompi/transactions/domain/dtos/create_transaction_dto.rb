module SimplyWompi
  module Transactions
    module Domain
      module Dtos
        # Create Transaction Data Transfer Object
        class CreateTransactionDto
          attr_reader :acceptance_token,
                      :amount_in_cents,
                      :currency,
                      :customer_email,
                      :payment_method,
                      :reference

          def initialize(
            acceptance_token:,
            amount_in_cents:,
            currency:,
            customer_email:,
            payment_method:,
            reference:
          )
            unless acceptance_token.is_a?(String)
              raise ArgumentError("ArgumentError acceptance_token: #{acceptance_token.class}, is not instance of #{String}")
            end

            unless amount_in_cents.is_a?(Integer)
              raise ArgumentError("ArgumentError amount_in_cents: #{amount_in_cents.class}, is not instance of #{Integer}")
            end

            unless currency.is_a?(String)
              raise ArgumentError("ArgumentError currency: #{currency.class}, is not instance of #{String}")
            end

            unless customer_email.is_a?(String)
              raise ArgumentError("ArgumentError customer_email: #{customer_email.class}, is not instance of #{String}")
            end

            unless payment_method.is_a?(CreateTransactionPaymentMethodDto)
              raise ArgumentError("ArgumentError payment_method: #{payment_method.class}, is not instance of #{CreateTransactionPaymentMethodDto}")
            end

            unless reference.is_a?(String)
              raise ArgumentError("ArgumentError reference: #{reference.class}, is not instance of #{String}")
            end

            @acceptance_token = acceptance_token
            @amount_in_cents = amount_in_cents
            @currency = currency
            @customer_email = customer_email
            @payment_method = payment_method
            @reference = reference
          end
        end
      end
    end
  end
end
