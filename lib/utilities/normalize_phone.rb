module Utilities
  class NormalizePhone
    def self.internationalize_phone(phone_number, country_code, sign = true)
      country = country_code.upcase
      number = phone_number.phony_formatted(normalize: country,
                                            format: :international,
                                            spaces: '')
      if sign
        number
      else
        number.gsub!('+', '')
      end
    end
  end
end