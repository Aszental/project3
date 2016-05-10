require 'open-uri'
require 'Nokogiri'
require 'csv'
require 'geocoder'


desc 'Scrapes website for data'

task :scrape_data => :environment do

Suburb.destroy_all

def number(number)
  stripped_num = []
  phone_num_arr = number.split('')
  the_numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
  discard = []
  phone_num_arr.each do |c|
    if the_numbers.include? c
      stripped_num.push(c)
    else
      discard.push(c)
    end
  end

 stripped_num = stripped_num.join().to_i

end



  suburb_array = CSV.read('suburbs_lat.csv')
  url_array = Array.new
  act = Geocoder.coordinates("canberra city")
  vic = Geocoder.coordinates("Melbourne CBD")
  wa = Geocoder.coordinates("Perth CBD")
  sa = Geocoder.coordinates("Adelaide CBD")
  nt = Geocoder.coordinates("Darwin CBD")
  qld = Geocoder.coordinates("Brisbane CBD")
  nsw = Geocoder.coordinates("Sydney CBD")



  suburb_array.each do |row|
    if row[2] == "NSW"
      if (Geocoder::Calculations.distance_between(nsw, [row[5].to_i, row[6].to_i])) < 20
           url =  "http://house.ksou.cn/profile.php?q=" + row[1].to_s + "%2C+" + row[2]
           @doc = Nokogiri::HTML(open(url))
           # House Price
           @housePrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[0]).to_s
           # Unit Price
           @unitPrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[1]).to_s
           puts url
           puts row[1]
           puts row[0]
           puts @housePrice
           puts @unitPrice
            suburb = Suburb.new
           suburb.suburb_name = row[1]
           suburb.median_price_house = number(@housePrice)
           suburb.median_price_unit = number(@unitPrice)
           suburb.save
           sleep 7
         end
      elsif row[2] == "VIC"
        if (Geocoder::Calculations.distance_between(vic, [row[5].to_i, row[6].to_i])) < 20
           url =  "http://house.ksou.cn/profile.php?q=" + row[1].to_s + "%2C+" + row[2]
           @doc = Nokogiri::HTML(open(url))
           # House Price
           @housePrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[0]).to_s
           # Unit Price
           @unitPrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[1]).to_s
           puts url
           puts row[1]
           puts row[0]
           puts @housePrice
           puts @unitPrice
           suburb = Suburb.new
           suburb.suburb_name = row[1]
           suburb.median_price_house = number(@housePrice)
           suburb.median_price_unit = number(@unitPrice)
           suburb.save
           sleep 7
         end
    elsif row[2] == "SA"
      if (Geocoder::Calculations.distance_between(sa, [row[5].to_i, row[6].to_i])) < 20
         url =  "http://house.ksou.cn/profile.php?q=" + row[1].to_s + "%2C+" + row[2]
         @doc = Nokogiri::HTML(open(url))
         # House Price
         @housePrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[0]).to_s
         # Unit Price
         @unitPrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[1]).to_s
         puts url
         puts row[1]
         puts row[0]
         puts @housePrice
         puts @unitPrice
          suburb = Suburb.new
         suburb.suburb_name = row[1]
         suburb.median_price_house = number(@housePrice)
         suburb.median_price_unit = number(@unitPrice)
         suburb.save
         sleep 7
       end
    elsif row[2] == "WA"
      if (Geocoder::Calculations.distance_between(wa, [row[5].to_i, row[6].to_i])) < 20
     url =  "http://house.ksou.cn/profile.php?q=" + row[1].to_s + "%2C+" + row[2]
     @doc = Nokogiri::HTML(open(url))
     # House Price
     @housePrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[0]).to_s
     # Unit Price
     @unitPrice = (@doc.xpath("//a[contains(@title, 'than last year')]/text()")[1]).to_s
     puts url
     puts row[1]
     puts row[0]
     puts @housePrice
     puts @unitPrice
          suburb = Suburb.new
     suburb.suburb_name = row[1]
     suburb.median_price_house = number(@housePrice)
     suburb.median_price_unit = number(@unitPrice)
     suburb.save
     sleep 7
      end
    end
  end
end
