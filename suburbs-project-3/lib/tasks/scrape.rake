require 'open-uri'
require 'Nokogiri'
require 'csv'
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

  suburb_array = CSV.read('suburbs.csv')
  url_array = Array.new
  suburb_array.each do |row|

     url =  "http://house.ksou.cn/profile.php?q=" + row[1].to_s + "%2C+" + row[0]
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
