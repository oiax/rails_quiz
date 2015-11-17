class ApplicationSetting < ActiveRecord::Base
  validates :application_name, presence: true
  validates :session_timeout,
    numericality: { only_integer: true, greater_than: 0, allow_nil: true }
end
