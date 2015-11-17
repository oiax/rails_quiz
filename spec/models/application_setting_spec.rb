require 'rails_helper'

RSpec.describe ApplicationSetting do
  describe '値の取得、格納、保存' do
    example '「application_name」の初期値は「Baukis」' do
      setting = ApplicationSetting.first
      expect(setting.get(:application_name)).to eq('Baukis')
    end

    example '「application_name」の値を変更する' do
      setting = ApplicationSetting.first
      setting.set(:application_name, 'Test')
      setting.save

      setting.reload
      expect(setting.get(:application_name)).to eq('Test')
    end
  end
end
