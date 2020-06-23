require 'pry'


def get_first_name_of_season_winner(data, season)
  season = data["#{season}"].find {|x| x["status"] == "Winner"}["name"].split(' ').first
end

def get_contestant_name(data, occupation)
  result = nil 
  data.each do |season, contestant|
    result = contestant.find{|x| x["occupation"] == occupation}
    return result["name"] if result
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestant|
    count = count + contestant.count {|x| x["hometown"] == hometown}
  end
  count
end

def get_occupation(data, hometown)
  result = nil
  data.each do |season, contestant|
    result =  contestant.find {|x| x["hometown"] == hometown}
    return result["occupation"] if result
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  season = data["#{season}"]
  season.each do |contestant|
    #binding.pry
    total_age = total_age + contestant["age"].to_f
  end
  (total_age/season.size).round
end
