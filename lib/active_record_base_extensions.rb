require 'error'

module MeWantRandom
  module ActiveRecordBaseExtentions
    def randomly_select(options, ar_options={})
      options.symbolize_keys!
      factor = options.delete(:factor) || 10
      quantity = options.delete(:limit) || 1
      raise MeWantRandom::ArgumentError.new("can't use additional 'limit' with randomly_select") if ar_options[:limit]
      self.all({:limit => quantity*factor}.merge(options)).randomize.first(quantity)
    end
  end
end

ActiveRecord::Base.send :extend, MeWantRandom::ActiveRecordBaseExtentions