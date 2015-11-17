class Admin::ApplicationSettingsController < Admin::Base
  def show
    @setting = ApplicationSetting.first!
  end

  def update
    @setting = ApplicationSetting.first!
    @setting.assign_attributes(setting_params)
    if @setting.save
      flash.notice = 'アプリケーション設定を変更しました。'
      redirect_to :admin_root
    else
      flash.now.alert = 'アプリケーション設定に誤りがあります。'
      render action: 'show'
    end
  end

  private
  def setting_params
    params.require(:application_setting).permit(
      :application_name, :session_timeout
    )
  end
end
