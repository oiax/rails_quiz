if ApplicationSetting.count == 0
  ApplicationSetting.create!(
    application_name: 'Baukis',
    session_timeout: 60
  )
end
