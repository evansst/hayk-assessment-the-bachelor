require 'pry'


def all_contestants(data)
  data.reduce([]) do |contestants, season|
    contestants << season[1]
  end.flatten
end

def get_season(data, season)
  data[season]
end

def get_first_name_of_season_winner(data, season)
  # data[season].find { |contestant| contestant['status'] == 'Winner' }['name'].split(' ').first

  data[season].find do |contestant|
    contestant['status'] == 'Winner'
  end['name'].split(' ')[0]
end

def get_contestant_name(data, occupation)
  # data.each do |_season, contestant|
  #   result = contestant.find { |x| x['occupation'] == occupation }
  #   return result['name'] if result
  # end

  # data.each do |_season, contestant_list|
  #   result = contestant_list.find do |name|
  #     name['occupation'] == occupation
  #   end
  #   return result['name'] if result
  # end

  all_contestants(data).find do |name|
    name['occupation'] == occupation
  end['name']
end

def count_contestants_by_hometown(data, hometown)
  # sum = 0
  # data.each do |_season, contestant|
  #   sum += contestant.count { |x| x['hometown'] == hometown }
  # end

  # sum = 0
  # data.each do |_season, contestants|
  #   sum += contestants.count do |name|
  #     name['hometown'] == hometown
  #   end
  # end
  # sum

  all_contestants(data).count do |contestant|
    contestant['hometown'] == hometown
  end
end

def get_occupation(data, hometown)
  # data.each do |_season, contestant|
  #   result = contestant.find { |x| x['hometown'] == hometown }
  #   return result['occupation'] if result
  # end

  # data.each do |_season, contestants|
  #   result = contestants.find do |name|
  #     name['hometown'] == hometown
  #   end
  #   return result['occupation'] if result
  # end

  all_contestants(data).find do |contestant|
    contestant['hometown'] == hometown
  end['occupation']
end

def get_average_age_for_season(data, season)
  # total = data[season].reduce(0) do |sum, contestant|
  #   sum + contestant['age'].to_f
  # end
  # (total / data[season].size).round

  ((get_season(data, season).reduce(0) do |count, contestant|
    count + contestant['age'].to_f
  end) / data[season].size).round
end

# def get_average_age_for_season(data, season)
#   total = data[season].inject do |sum, contestant|
#     binding.pry
#     sum + contestant['age'].to_f
#   end
#   (total / data[season].size).round
# end