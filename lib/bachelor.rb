require 'pry'

def get_first_name_of_season_winner(data, season)
  # data[season].find { |contestant| contestant['status'] == 'Winner' }['name'].split(' ').first
  data[season].find do |contestant|
    contestant['status'] == 'Winner'
  end['name'].split(' ')[0]
end

def get_contestant_name(data, occupation)
  # result = nil
  # data.each do |_season, contestant|
  #   result = contestant.find { |x| x['occupation'] == occupation }
  #   return result['name'] if result
  # end
  data.each do |_season, contestants|
    result = contestants.find do |name|
      name['occupation'] == occupation
    end
    # binding.pry
    return result['name'] if result
  end
end

def count_contestants_by_hometown(data, hometown)
  sum = 0
  # data.each do |_season, contestant|
  #   sum += contestant.count { |x| x['hometown'] == hometown }
  # end
  data.each do |_season, contestants|
    sum += contestants.count do |name|
      name['hometown'] == hometown
    end
  end
  sum
end

def get_occupation(data, hometown)
  # result = nil
  # data.each do |_season, contestant|
  #   result = contestant.find { |x| x['hometown'] == hometown }
  #   return result['occupation'] if result
  # end
  data.each do |_season, contestants|
    result = contestants.find do |name|
      name['hometown'] == hometown
    end
    return result['occupation'] if result
  end
end

def get_average_age_for_season(data, season)
  # total_age = 0
  # season = data[season.to_s]
  # season.each do |contestant|
  #   binding.pry
  #   total_age += contestant['age'].to_f
  # end
  # (sum / season.size).round
  sum = data[season].reduce(0) do |count, contestant|
    count + contestant['age'].to_f
  end
  (sum / data[season].size).round
end
