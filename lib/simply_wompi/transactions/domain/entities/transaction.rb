require "date"

module SimplyWompi
  module Transactions
    module Domain
      module Entities
        # Transaction Entity
        class Transaction
          attr_accessor :id,
                        :created_at,
                        :amount_in_cents,
                        :status,
                        :reference,
                        :customer_email,
                        :currency,
                        :payment_method_type,
                        :payment_method,
                        :redirect_url,
                        :payment_link_id

          def initialize(
            id:,
            created_at:,
            amount_in_cents:,
            status:,
            reference:,
            customer_email:,
            currency:,
            payment_method_type:,
            payment_method:,
            redirect_url:,
            payment_link_id:
          )
            unless id.is_a?(String)
              raise ArgumentError("ArgumentError id: #{id.class}, is not instance of #{String}")
            end

            unless created_at.is_a?(Date)
              raise ArgumentError("ArgumentError created_at: #{created_at.class}, is not instance of #{Date}")
            end

            unless amount_in_cents.is_a?(Integer)
              raise ArgumentError("ArgumentError amount_in_cents: #{amount_in_cents.class}, is not instance of #{Integer}")
            end

            unless status.is_a?(String)
              raise ArgumentError("ArgumentError status: #{status.class}, is not instance of #{String}")
            end

            unless reference.is_a?(String)
              raise ArgumentError("ArgumentError reference: #{reference.class}, is not instance of #{String}")
            end

            unless customer_email.is_a?(String)
              raise ArgumentError("ArgumentError customer_email: #{customer_email.class}, is not instance of #{String}")
            end

            unless currency.is_a?(String)
              raise ArgumentError("ArgumentError currency: #{currency.class}, is not instance of #{String}")
            end

            unless payment_method_type.is_a?(String)
              raise ArgumentError("ArgumentError payment_method_type: #{payment_method_type.class}, is not instance of #{String}")
            end

            unless payment_method.is_a?(Dtos::CreatePaymentPaymentMethodDto)
              raise ArgumentError("ArgumentError payment_method: #{payment_method.class}, is not instance of #{CreatePaymentPaymentMethodDto}")
            end

            unless redirect_url.is_a?(String)
              raise ArgumentError("ArgumentError redirect_url: #{redirect_url.class}, is not instance of #{String}")
            end

            unless payment_link_id.is_a?(String)
              raise ArgumentError("ArgumentError payment_link_id: #{payment_link_id.class}, is not instance of #{String}")
            end

            self.id = id
            self.created_at = created_at
            self.amount_in_cents = amount_in_cents
            self.status = status
            self.reference = reference
            self.customer_email = customer_email
            self.currency = currency
            self.payment_method_type = payment_method_type
            self.payment_method = payment_method
            self.redirect_url = redirect_url
            self.payment_link_id = payment_link_id
          end
        end
      end
    end
  end
end
