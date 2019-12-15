require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
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
        }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
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
        }]
    }
  }
end

def num_points_scored(name)
  score = nil
  game_hash.each do |team, details_hash|
    players_array = details_hash[:players]
    players_array.each do |player_details|
      if player_details[:player_name] == name
        score = player_details[:points]
      end
    end
  end
  return score
end

def shoe_size(name)
  size = nil
  game_hash.each do |team, details_hash|
    players_array = details_hash[:players]
    players_array.each do |player_details|
      if player_details[:player_name] == name
        size = player_details[:shoe]
      end
    end
  end
  return size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |team, team_details|
    if team_details[:team_name] == team_name
      colors = team_details[:colors]
    end
  end
  return colors
end

def team_names
  game_hash.collect do |team, team_details|
    team_details[:team_name]
  end
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, team_details|
    if team_details[:team_name] == team_name
      team_details[:players].each do |player|
        player.each do |key, value|
          if key == :number
            jersey_numbers << value
          end
        end
      end
    end
  end
  return jersey_numbers
end

def player_stats(name)
  player_stats = {}
  game_hash.each do |team, team_details|
    team_details[:players].each do |player|
      if player[:player_name] == name
        player.delete(:player_name)
        player_stats = player
      end
    end
  end
  return player_stats
end

def big_shoe_rebounds
  big_foot = 0
  rebounds = 0

  game_hash.each do |team, team_details|
    team_details[:players].each do |player|
      if player[:shoe] > big_foot
        big_foot = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end