# Write your code here!
require 'pry'


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
          ]
        },
     :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        }
        ]
        }
  }
end

def num_points_scored(player)
  game_hash.each do |ho_aw,info| 
    info.each do |team_id,stats| 
      if team_id == :players
        stats.each do |baller|
          if baller[:player_name] == player
            return baller[:points]
          end
        end
      end
    end
  end
end

# def player_info(player) #this is a helper_method that access player data when name is typed
#   game_hash.each do |hom_aw,info|
#     binding.pry
#   end
# end

def shoe_size(player)
  game_hash.each do |ho_aw,info| 
    info.each do |team_id,stats| 
      if team_id == :players
        stats.each do |baller|
          if baller[:player_name] == player
            return baller[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(da_team)
  game_hash.each do |ho_aw,info| 
    info.each do |team_id,stats| 
      if info[:team_name] == da_team
        return info[:colors]
      end
    end
  end
end

def team_names
  game_hash.map do |ho_aw,info| 
    info[:team_name]
    end
end

def player_numbers(da_team)
  num_array = []
  game_hash.map do |ho_aw, info| 
    info.reduce do |category,team_data|
      if info[:team_name] == da_team
        info[:players].map do |player|#team_name # we want to iterate through team_data array to find the numbers.
          num_array << player[:number]
          num_array = num_array.sort
          #binding.pry
        end
      end
    end
  end
  num_array.uniq!
end

    #it will first iterate through home and away to see if argument exists
    # this is how we access points - team[1][:players][0][:points]
    # this is how we access a player team[1][:players][0][:player_name]
     #try iterating over players array which is at game_hash[]
    # i need to set up these variables to point to points and iterate through them
    #reduce is good because it gives us a single value not an array
    #binding.pry
    #if the player's name is entered then it most locate their points
def player_stats(player_name)
  game_hash.each do |ho_away,info|
    i = 0
    while i < info[:players].length do
      if info[:players][i][:player_name] == player_name
          return info[:players][i].reject {|k,v| k == :player_name}
      end
      i += 1
    end
  end
end
#input will be "Player Name"
#we will iterate through the hash to get to players hash
#we need to gain access into an array
#result will be a hash (single value) game_hash[:away/home][:player]

def big_shoe_rebounds
    max = 0
    rebounds = 0
  game_hash.each do |ho_away, info|
    i = 0 
    while i < info[:players].length do 
      if info[:players][i][:shoe] > max
        max = info[:players][i][:shoe]
        rebounds = info[:players][i][:rebounds]
      end
      i += 1
    end
  end
   rebounds
end

def most_points_scored
    max = 0
    points = 0
    mvp = ""
  game_hash.each do |ho_away, info|
    i = 0 
    while i < info[:players].length do 
      if info[:players][i][:points] > max
        max = info[:players][i][:points]
        mvp = info[:players][i][:player_name]
      end
      i += 1
    end
  end
  mvp
end

def winning_team
  home_points = 0
  away_points = 0
  winner = ""
  home = game_hash[:home]
  away = game_hash[:away]
  game_hash.each do |ho_away, info| 
    home.each do |x,y| 
      h = 0
      while h < home[:players].length do
        home_points += home[:players][h][:points]
        h += 1
      end
      a = 0
      while a < away[:players].length do
        away_points += away[:players][a][:points]
        a += 1
      end
      if home_points > away_points
        winner = home[:team_name]
      else
        winner = away[:team_name]
      end
    end
  end
  winner
end

    # info.each do |x| 
    #   i = 0 
    #   while i < info[:players].length do
    #     home_points += info[:players][i][:points]
    #     i += 1
    #   end
    # end
#game_hash[:home] vs game_hash[:away]
  #iterate through each individual hash to tally points
  #compare the tallies to get the points
  #return game_hash[:home/:away][:team_name]

def player_with_longest_name
  player = ""
  longest_length = 0
  game_hash.each do |ho_away, info| 
    i = 0 
    while i < info[:players].length do 
      if info[:players][i][:player_name].length > longest_length
        longest_length = info[:players][i][:player_name].length
        player = info[:players][i][:player_name]
      end
      i += 1
    end
  end
  player
end

def long_name_steals_a_ton?
  steals_champ = player_with_longest_name
  total_steals = 0
  game_hash.each do |ho_away, info| 
    i = 0 
    while i < info[:players].length do 
      if info[:players][i][:steals] > total_steals
        total_steals = info[:players][i][:steals]
        steals_champ = info[:players][i][:player_name]
        if steals_champ == player_with_longest_name
          return true
        end
      end
      i += 1
    end
  end
end
 #find the max shoe size and return the rebounds in its hash
  #now find the max
  #we are finding the largest shoe size by iterating 
  #we are returning a value for the rebounds game_hash[:away/home][:player][:rebounds]