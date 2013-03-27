require 'open-uri'
require 'json'

module TmuxStatus
  module Wrappers
    class Bitcurex
      class << self
        def ticker
          p 'tick'
          get_json('ticker')
        end

        def orderbook
          get_json('orderbook')
        end

        def bids
          floatize orderbook['bids']
        end

        def asks
          floatize orderbook['asks']
        end

        def trades
          get_json(:trades)
        end

        private
          def get_json(method)
            response = Kernel.open "https://pln.bitcurex.com/data/#{method}.json"
            json = response.read
            response.close
            JSON.parse(json)
          end

          def floatize(array)
            array.map do |values|
              values.map { |value| Float(value) }
            end
          end
      end
    end
  end
end
