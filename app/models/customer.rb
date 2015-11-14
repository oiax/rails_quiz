class Customer < ActiveRecord::Base
  include PersonalNameHolder
  include PasswordHolder

  has_many :emails, dependent: :destroy, autosave: true
  has_many :addresses, dependent: :destroy
  has_one :home_address, autosave: true
  has_one :work_address, autosave: true
  has_many :phones, dependent: :destroy
  has_many :personal_phones, -> { where(address_id: nil).order(:id) },
    class_name: 'Phone', autosave: true

  attr_writer :email_addresses

  before_validation do
    if @email_addresses
      @email_addresses.each_with_index do |a, i|
        @email_addresses.each_with_index do |b, j|
          if i != j && a.present? && a.downcase == b.downcase
            emails[i].duplicated = true
          end
        end
      end

      if persisted?
        @email_addresses.each_with_index do |a, i|
          emails.each_with_index do |e, j|
            address = e.address_was
            if i != j && address.present? && address.downcase == a.downcase
              emails[i].exchanging = true
            end
          end
        end
      end
    end
  end

  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, date: {
    after: Date.new(1900, 1, 1),
    before: ->(obj) { Date.today },
    allow_blank: true
  }

  before_save do
    if birthday
      self.birth_year = birthday.year
      self.birth_month = birthday.month
      self.birth_mday = birthday.mday
    end
  end

  after_save do
    emails.map(&:resave!)
  end

  def email
    emails[0].try(:address)
  end

  def email=(email)
    if emails.first
      self.emails[0].address = email
    else
      emails.build(address: email)
    end
  end
end
