suburbs = ["Melbourne", "Richmond", "Cheltenham", "South Yarra", "Malvern", "Hawthorn", "Kew", "Balwyn", "Footscray", "Coburg", "Dandenong", "Lilydale", "Ringwood", "Hurstbridge", "Northcote", "Glen Waverly", "Tarneit", "Glenroy", "South Melbourne", "East Melbourne", "Collingwood", "Thornbury", "Seddon", "Sunshine", "St Albans", "West Melbourne", "North Melbourne"]

median_price_house = (300000..1000000).to_a
median_price_unit = (150000..600000).to_a

suburbs.each do |name|
  suburb = Suburb.new
  suburb.suburb_name = name
  suburb.median_price_unit = median_price_unit.sample
  suburb.median_price_house = median_price_house.sample
  suburb.save
end
