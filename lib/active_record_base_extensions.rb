ActiveRecord::Base.class_eval do
  def self.randomly_select(quantity, options={}, factor=50)
    raise "can't use 'limit' with randomly_select"if options[:limit]
    self.all({:limit => quantity*factor}.merge(options)).randomize.first(quantity)
  end
end