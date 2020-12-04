input = File.read('./input.txt')
REQUIRED_KEYWORDS = %w[byr iyr eyr hgt hcl ecl pid].freeze

def contains_required_fields?(passport)
  REQUIRED_KEYWORDS.all? { |key| passport.include?(key) }
end

# Part a
passports = input.split("\n\n")
valid_passports = passports.filter { |passport| contains_required_fields?(passport) }
puts "Solution for day 4 part a: #{valid_passports.count}"

# Part b
RULES = {
  'byr' => ->(val) { val.to_i.then { |num| num.between?(1920, 2020) } },
  'iyr' => ->(val) { val.to_i.then { |num| num.between?(2010, 2020) } },
  'eyr' => ->(val) { val.to_i.then { |num| num.between?(2020, 2030) } },
  'hgt' => lambda do |val|
    _, height, unit = val.partition(/\d*/)
    case unit
    when 'cm' then height.to_i.between?(150, 193)
    when 'in' then height.to_i.between?(59, 76)
    else false
    end
  end,
  'hcl' => ->(val) { val.match(/^#[a-f|0-9]{6}$/) },
  'ecl' => ->(val) { %w[amb blu brn gry grn hzl oth].any? { |str| str.eql?(val) } },
  'pid' => ->(val) { val.match(/^\d{9}$/) },
  'cid' => ->(_val) { true }
}.freeze

passports = input.split("\n\n")
valid_passports = passports.filter { |passport| contains_required_fields?(passport) }
valid_passports.keep_if do |passport|
  parts = passport.gsub(/\s+/m, ' ').strip.split(' ').map { |str| str.split(':') }.to_h
  parts.all? { |key, value| RULES.fetch(key).call(value) }
end

puts "Solution for day 4 part b: #{valid_passports.count}"
