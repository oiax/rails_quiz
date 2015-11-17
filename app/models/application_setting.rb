class ApplicationSetting < ActiveRecord::Base
  before_save do
    self.data = ActiveSupport::JSON.encode(dictionary)
  end

  def get(key)
    dictionary[key.to_s]
  end

  def set(key, value)
    dictionary[key.to_s] = value
  end

  private
  def dictionary
    @dictionary ||= ActiveSupport::JSON.decode(data) if data
    @dictionary ||= {}
    @dictionary
  end
end
