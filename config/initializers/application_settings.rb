if ApplicationSetting.count == 0
  setting = ApplicationSetting.new
  setting.set(:application_name, 'Baukis')
  setting.save
end
