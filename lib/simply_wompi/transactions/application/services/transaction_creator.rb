module SimplyWompi
  module Transactions
    module Application
      module Services
        # Transaction Creator
        class TransactionCreator
          attr_reader :transactions_repository

          def initialize(transactions_repository:)
            unless transactions_repository.is_a?(Domain::Repositories::TransactionsRepository)
              raise ArgumentError("ArgumentError transactions_repository: #{transactions_repository.class}, is not instance of #{Domain::Repositories::TransactionsRepository}")
            end

            @transactions_repository = transactions_repository
          end

          def call(create_transaction_dto:)
            unless create_transaction_dto.is_a?(Domain::Dtos::CreateTransactionDto)
              raise ArgumentError("ArgumentError create_transaction_dto: #{create_transaction_dto.class}, is not instance of #{Domain::Dtos::CreateTransactionDto}")
            end

            @transactions_repository.create(create_transaction_dto: create_transaction_dto)
          end
        end
      end
    end
  end
end
