require 'mechanize'
require 'pry'

mechanize = Mechanize.new

page = mechanize.get('http://www.bbc.co.uk/news')
page = mechanize.get('http://en.wikipedia.org/wiki/Main_Page')

page = mechanize.get('https://www.gov.uk/')
page = mechanize.get('http://www.kbb.com/bentley/sedans/?vehicleclass=newcar&intent=buy-new')

puts page.css('tbody').text

For pitchers
page = mechanize.get('http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=8&season=2016&month=0&season1=2016&ind=0&team=0%2cts&rost=&age=&filter=&players=0')
i = 0
total = [['id', 'name', 'star']]
lineup = Array.new(3) 
page.search('tbody td').each do |td|
  if i < 2
    lineup[i] = td.text
    if i == 1
      if lineup[0].to_i <= 30
        lineup[2] = 5
      end
      if lineup[0].to_i <= 24
  lineup[2] = 4
      end
      if lineup[0].to_i <= 18
        lineup[2] = 3
      end
      if lineup[0].to_i <= 12
        lineup[2] = 2
      end
      if lineup[0].to_i <= 6
        lineup[2] = 1
      end
      total.push lineup
      lineup = Array.new(3)
    end
  end
  i = (i + 1) % 21
end
puts total
--------------------------

page = mechanize.get('http://www.fangraphs.com/leaders.aspx?pos=all&stats=sta&lg=all&qual=50&type=8&season=2016&month=0&season1=2016&ind=0&team=0&rost=0&age=0&filter=&players=0&sort=16,a&page=1_30')
i = 0 
total = [['id', 'name', 'star']]
lineup = Array.new(4) 
indexes = [0,1,16]
indexes_json = {0 => 0, 1 => 1, 16 => 2}
page.search('tbody td').each do |td|
  if indexes.include? i
    lineup[indexes_json[i]] = td.text
  end
  if i == 19 
    if lineup[2].to_f > 0
      lineup[3] = 1 
    end
    if lineup[2].to_f > 2.76
      lineup[3] = 2
    end 
    if lineup[2].to_f > 3.26
      lineup[3] = 3 
    end  
    if lineup[2].to_f > 3.76
      lineup[3] = 4 
    end 
    if lineup[2].to_f > 4.51
      lineup[3] = 5
    end 
    total.push lineup
  end
  i = (i + 1) % 20
end
puts total
#form = page.forms.first

#link = page.link_with(text: 'Random article')

#form['q'] = 'passport'

#page = form.submit

#page.search('#results h3').each do |h3|
#puts h3.text.strip

#end

#page = link.click

#puts page.at('h3').text.strip

#puts page.uri
