require "json"
require "date"
require "net/http"
require "uri"

# Domain
require_relative "../../../domain/repositories/transactions_repository"

module SimplyWompi
  module Transactions
    module Infrastructure
      module Repositories
        module Production
          # Transactions Production Repository
          class TransactionsProductionRepository < ::SimplyWompi::Transactions::Domain::Repositories::TransactionsRepository
            def initialize(api_key:)
              unless api_key.is_a?(String)
                raise ArgumentError("ArgumentError api_key: #{api_key.class}, is not instance of #{String}")
              end

              @api_key = api_key
            end

            def create(create_transaction_dto:)
              unless create_transaction_dto.is_a?(::SimplyWompi::Transactions::Domain::Dtos::CreateTransactionDto)
                raise ArgumentError("ArgumentError create_transaction_dto: #{create_transaction_dto.class}, is not instance of #{Domain::Dtos::CreateTransactionDto}")
              end

              response = ::Net::HTTP.post(URI('https://production.wompi.co/v1/transactions'), {
                acceptance_token: create_transaction_dto.acceptance_token,
                amount_in_cents: create_transaction_dto.amount_in_cents,
                currency: create_transaction_dto.currency,
                customer_email: create_transaction_dto.customer_email,
                payment_method: {
                  type: create_transaction_dto.payment_method.type,
                  token: create_transaction_dto.payment_method.token,
                  installments: create_transaction_dto.payment_method.installments
                },
                reference: create_transaction_dto.reference
              }.to_json, {
               "Content-Type": "application/json",
                Authorization: @api_key
              })
              parsed_response = JSON.parse(response.body, { symbolize_names: true })

              unless response.code == "201"
                raise "StandardError error: #{parsed_response[:error]}"
              end

              ::SimplyWompi::Transactions::Domain::Entities::Transaction.new(
                id: parsed_response[:data][:id],
                created_at: Date.parse(parsed_response[:data][:created_at]),
                amount_in_cents: parsed_response[:data][:amount_in_cents],
                status: parsed_response[:data][:status],
                reference: parsed_response[:data][:reference],
                customer_email: parsed_response[:data][:customer_email],
                currency: parsed_response[:data][:currency],
                payment_method_type: parsed_response[:data][:payment_method_type],
                payment_method: ::SimplyWompi::Transactions::Domain::Dtos::CreatePaymentPaymentMethodDto.new(
                  type: parsed_response[:data][:payment_method][:type],
                  token: parsed_response[:data][:payment_method][:token],
                  installments: parsed_response[:data][:payment_method][:installments]
                ),
                redirect_url: parsed_response[:data][:redirect_url],
                payment_link_id: parsed_response[:data][:payment_link_id]
              )
            end
          end
        end
      end
    end
  end
end
