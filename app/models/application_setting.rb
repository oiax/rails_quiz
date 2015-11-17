class ApplicationSetting < ActiveRecord::Base
  validate do
    if new_record? && self.class.count > 0
      errors.add(:base, 'ApplicationSetting must be a singleton object.')
    end
  end
end
