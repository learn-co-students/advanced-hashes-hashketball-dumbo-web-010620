require "pry"

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
    :players => [
      {:player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {:player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
         },
      {:player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
         },
      {:player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
         },
      {:player_name => "Kemba Walker",
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
  game_hash.each do |team,summary|
   players = summary[:players]
   players.each do |player_stats|
     if player_stats[:player_name] == name
       score = player_stats[:points]
     end 
   end 
 end
 return score
end

def shoe_size(name)
  size = nil
  game_hash.each do |team,summary|
   players = summary[:players]
   players.each do |player_stats|
     if player_stats[:player_name] == name
       size = player_stats[:shoe]
     end 
   end 
 end
 return size
end 

def team_colors(t_name)
  game_hash.each do |team,summary|
    if summary[:team_name] == t_name
      return summary[:colors]
    end 
  end 
end 

def team_names
  #binding.pry
  t_n =[]
  game_hash.each do |team,summary|
     t_n << summary[:team_name]
  end 
  return t_n
end 

def player_numbers(team_name)
  jersey_number = []
  game_hash.each do |team, summary|
    t_name = summary[:team_name]
    if t_name == team_name
      summary[:players].each do |players|
        players.each do |stat,value|
        if stat == :number
         jersey_number << value
       end 
     end 
     end 
    end 
  end 
  return jersey_number
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


def most_points_scored
  most_points_and_name = [0,""]
  game_hash.each do |place, team|
    team[:players].each do |player_stats|
      if player_stats[:points] > most_points_and_name[0]
        most_points_and_name[0] = player_stats[:points]
        most_points_and_name[1] = player_stats[:player_name]
      end
    end
  end
  return most_points_and_name[1]
end

def winning_team
  team_scores = {} # we will store each team's name and score here
  game_hash.each do |location, team_data|
    if !team_scores[:team_name]
      team_scores[team_data[:team_name]] = 0
    end
    team_data[:players].each do |player_stats| 
      team_scores[team_data[:team_name]] += player_stats[:points]
    end
  end
  return (team_scores.values[0] > team_scores.values[1]) ? team_scores.keys[0] : team_scores.keys[1]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats| 
      if player_stats[:player_name].length > longest_name.length
        longest_name = player_stats[:player_name]
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_steals = ["", 0]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats| 
      if player_stats[:steals] > most_steals[1]
        most_steals = [player_stats[:player_name], player_stats[:steals]]
      end
    end
  end
  return (player_with_longest_name == most_steals[0])
end

