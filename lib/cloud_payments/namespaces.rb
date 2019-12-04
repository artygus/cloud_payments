# frozen_string_literal: true
require 'cloud_payments/namespaces/base'
require 'cloud_payments/namespaces/cards'
require 'cloud_payments/namespaces/tokens'
require 'cloud_payments/namespaces/payments'
require 'cloud_payments/namespaces/subscriptions'
require 'cloud_payments/namespaces/orders'

module CloudPayments
  module Namespaces
    def payments
      Payments.new(self)
    end

    def subscriptions
      Subscriptions.new(self)
    end

    def orders
      Orders.new(self)
    end

    def ping
      !!(perform_request('/test').body || {})[:success]
    rescue ::Faraday::ConnectionFailed, ::Faraday::TimeoutError, CloudPayments::Client::ServerError => e
      false
    end
  end
end
