# Write your code here!
require "pry"

 def game_hash
   hash = {:home => {},
           :away => {}};

  #fill out home team
  hash[:home] = {:team_name => "Brooklyn Nets",
                  :colors => ["Black", "White"],
                  :players => []};

  hash[:home][:players]= [{:player_name => "Alan Anderson",
                            :number => 0,
                            :shoe => 16,
                            :points => 22,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 1},
                            {:player_name => "Reggie Evans",
                             :number => 30,
                             :shoe => 14,
                             :points => 12,
                             :rebounds => 12,
                             :assists => 12,
                             :steals => 12,
                             :blocks => 12,
                             :slam_dunks => 7},
                             {:player_name => "Brook Lopez",
                              :number => 11 ,
                              :shoe => 17,
                              :points => 17,
                              :rebounds => 19,
                              :assists => 10,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 15},
                              {:player_name => "Mason Plumlee",
                               :number => 1,
                               :shoe => 19,
                               :points => 26,
                               :rebounds => 11,
                               :assists => 6,
                               :steals => 3,
                               :blocks => 8,
                               :slam_dunks => 5},
                               {:player_name => "Jason Terry",
                                :number => 31,
                                :shoe => 15,
                                :points => 19,
                                :rebounds => 2,
                                :assists => 2,
                                :steals => 4,
                                :blocks => 11,
                                :slam_dunks => 1}];
#now fill out away team
hash[:away] = {:team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => []};

                hash[:away][:players]= [{:player_name => "Jeff Adrien",
                                          :number => 4,
                                          :shoe => 18,
                                          :points => 10,
                                          :rebounds => 1,
                                          :assists => 1,
                                          :steals => 2,
                                          :blocks => 7,
                                          :slam_dunks => 2},
                                          {:player_name => "Bismack Biyombo",
                                           :number => 0,
                                           :shoe => 16,
                                           :points => 12,
                                           :rebounds => 4,
                                           :assists => 7,
                                           :steals => 22,
                                           :blocks => 15,
                                           :slam_dunks => 10},
                                           {:player_name => "DeSagna Diop",
                                            :number => 2,
                                            :shoe => 14,
                                            :points => 24,
                                            :rebounds => 12,
                                            :assists => 12,
                                            :steals => 4,
                                            :blocks => 5,
                                            :slam_dunks => 5},
                                            {:player_name => "Ben Gordon",
                                             :number => 8,
                                             :shoe => 15,
                                             :points => 33,
                                             :rebounds => 3,
                                             :assists => 2,
                                             :steals => 1,
                                             :blocks => 1,
                                             :slam_dunks => 0},
                                             {:player_name => "Kemba Walker",
                                              :number => 33,
                                              :shoe => 15,
                                              :points => 6,
                                              :rebounds => 12,
                                              :assists => 12,
                                              :steals => 7,
                                              :blocks => 5,
                                              :slam_dunks => 12}];
  hash
end

def num_points_scored(desired_name)
  hash = game_hash;
  points_scored = 0

  hash[:home][:players].each do |player_hash|
    if  player_hash[:player_name] == desired_name
      points_scored = player_hash[:points]
    end
  end

  hash[:away][:players].each do |player_hash|
    if player_hash[:player_name] == desired_name
      points_scored = player_hash[:points]
    end
  end
  points_scored
end

def shoe_size(desired_name)
  hash = game_hash;
  shoe_size = 0

  hash[:home][:players].each do |player_hash|
    if  player_hash[:player_name] == desired_name
      shoe_size = player_hash[:shoe]
    end
  end

  hash[:away][:players].each do |player_hash|
    if player_hash[:player_name] == desired_name
      shoe_size = player_hash[:shoe]
    end
  end
  shoe_size
end

def team_colors(team_name)
  hash = game_hash;
  points_scored = 0

  if hash[:home][:team_name] == team_name
    colors = hash[:home][:colors]
  elsif hash[:away][:team_name] == team_name
    colors = hash[:away][:colors]
  end

  colors
  end

  def team_names
    hash = game_hash;
    team_array = [];

    team_array.push(hash[:home][:team_name])
    team_array.push(hash[:away][:team_name])

    team_array
  end

  def player_numbers(team_name)
    hash = game_hash
    number_array = [];

    if hash[:home][:team_name] == team_name
      hash[:home][:players].each do |player_hash|
          number_array.push(player_hash[:number])
        end
      elsif hash[:away][:team_name] == team_name
      hash[:away][:players].each do |player_hash|
          number_array.push(player_hash[:number])
        end
      end
      number_array
    end

def player_stats(desired_name)
  hash = game_hash;
  player_stats = {}

  hash[:home][:players].each do |player_hash|
    if  player_hash[:player_name] == desired_name
      player_hash.delete(:player_name)
      player_stats = player_hash
    end
  end

  hash[:away][:players].each do |player_hash|
    if player_hash[:player_name] == desired_name
      player_hash.delete(:player_name)
      player_stats = player_hash
    end
  end
  player_stats
end

def big_shoe_rebounds
  hash = game_hash;
  player_array = [];

  hash[:home][:players].each do |player_hash|
    player_array.push(player_hash[:player_name])
  end

  hash[:away][:players].each do |player_hash|
    player_array.push(player_hash[:player_name])
  end

  i=0
  biggest_shoe = 0

  while i < player_array.length
    if shoe_size(player_array[i]) >  biggest_shoe
      biggest_shoe = shoe_size(player_array[i])
      player_index = i
    end
    i += 1
  end

  player_hash = player_stats(player_array[player_index])
  player_hash[:rebounds]

end
