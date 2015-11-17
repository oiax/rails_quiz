require 'rails_helper'

RSpec.describe ApplicationSetting do
  describe 'バリデーション' do
    example 'すでに1個のレコードが存在すれば invalid' do
      ApplicationSetting.create(data: '')
      setting = ApplicationSetting.new(data: '')

      expect(setting).to be_invalid
    end
  end
end
