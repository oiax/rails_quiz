class Admin::ApplicationSettingsController < Admin::Base
  def show
    @setting = ApplicationSetting.first
    @form = ApplicationSettingForm.new(@setting)
  end
end
