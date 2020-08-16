require 'securerandom'

p SecureRandom.hex(2)

def uuid_gen
  uuid = SecureRandom.hex(4) + "-" + SecureRandom.hex(2) + "-" + SecureRandom.hex(2) + 
  "-" + SecureRandom.hex(2) + "-" + SecureRandom.hex(4) + SecureRandom.hex(2)
end

p uuid_gen

def uuid_gen2
  uuid = ""
  sections = [8,4,4,4,12]
  sections.each do |section|
    uuid += SecureRandom.hex(section/2)
    uuid += "-"
  end
  uuid.chop!
end

p uuid_gen2