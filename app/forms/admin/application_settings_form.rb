class Admin::ApplicationSettingsForm
  include ActiveModel::Model

  attr_accessor :application_title

  def initialize(setting)
    @setting = setting
  end
end
