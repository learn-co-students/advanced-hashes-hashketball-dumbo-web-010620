require 'pry'

def game_hash 
    big_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [ {
                :player_name =>     "Alan Anderson", :number => 0, :shoe =>  16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1,   :slam_dunks => 1},
                {:player_name =>    "Reggie Evans",  :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                {:player_name => 	"Brook Lopez",   :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals =>	3, :blocks => 1,   :slam_dunks => 15},
                {:player_name => 	"Mason Plumlee", :number => 1, :shoe =>  19, :points => 26, :rebounds => 11, :assists => 6,  :steals => 3, :blocks => 8,   :slam_dunks => 5},
                {:player_name => 	"Jason Terry",   :number => 31, :shoe => 15, :points => 19, :rebounds => 2,  :assists => 2,  :steals =>	4, :blocks => 11,  :slam_dunks => 1}
            ]
        },

        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [ {
                 :player_name => 	"Jeff Adrien", :number => 		4	, :shoe => 		18	, :points => 		10	, :rebounds => 		1	, :assists => 		1	, :steals => 		2	, :blocks => 		7	, :slam_dunks =>		2},
                {:player_name => 	"Bismack Biyombo", :number => 		0	, :shoe => 		16	, :points => 		12	, :rebounds => 		4	, :assists => 		7	, :steals => 		22	, :blocks => 		15	, :slam_dunks =>		10},
                {:player_name => 	"DeSagna Diop", :number => 		2	, :shoe => 		14	, :points => 		24	, :rebounds => 		12	, :assists => 		12	, :steals => 		4	, :blocks => 		5	, :slam_dunks =>		5},
                {:player_name => 	"Ben Gordon", :number => 		8	, :shoe => 		15	, :points => 		33	, :rebounds => 		3	, :assists => 		2	, :steals => 		1	, :blocks => 		1	, :slam_dunks =>		0},
                {:player_name => 	"Kemba Walker", :number => 		33	, :shoe => 		15	, :points => 		6	, :rebounds => 		12	, :assists => 		12	, :steals => 		7	, :blocks => 		5	, :slam_dunks =>		12}
            ]
        }
    }
end

# pp game_hash[:home][:team_name]
# pp game_hash[:home][:colors][0]
# pp game_hash[:home][:players][0][:player_name]
# pp game_hash[:home][:players][0][:points]
# pp game_hash[**][:players][**][:points]
# rspec spec/hashketball_spec.rb -e game_hash


def num_points_scored(player_name)
    game_hash.each do |home_away, value| 
        value.each do |team_colors_players, inner_value|
            if team_colors_players == :players
                inner_value.each do |player_hash|
                    if player_hash[:player_name] == player_name
                        return player_hash[:points]
                    end
                end
            end 
        end 
    end
end 

def shoe_size(player_name)
    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players
                inner_value.each do |player_hash|
                    if player_hash[:player_name] == player_name
                        return player_hash[:shoe]
                    end 
                end 
            end 
        end 
    end
end 

def team_colors(team_name)
    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if inner_value.include?(team_name)
                return value[:colors]
            end 
        end 
    end 
end 

# CLOSE BUT TOO NARROW: don't have access to the :colors k/v at this level
# if inner_value.include?(team_name)
#     puts team_atts
#     puts inner_value
# end 
# nevermind! it worked perfectly! Just had to use a pointer starting from the outer scope (which is accessible to the inner scope)
# in order to point back out to the outer level we had just stepped out of to identify the correct inner value


def team_names
    team_names_array = []
    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            # binding.pry
            if team_atts == :team_name
                team_names_array.push(inner_value)
            end 
        end
    end
    team_names_array
end 

def player_numbers(team_name)
    jerseys = []
    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            # binding.pry
            if inner_value == team_name 
                value[:players].each do |players|
                    players.each do |stat, val|
                        if stat == :number
                            jerseys.push(val)
                        end
                    end 
                end 
            end 
        end 
    end 
    jerseys # returns an array of the jersey numbers for the team passed in 
end 


# Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(player_name)
    stats = {}

    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players
                inner_value.each do |player_hash|
                    if player_hash[:player_name] == player_name
                        stats = player_hash
                        stats.delete(:player_name)
                    end 
                end 
            end 
        end 
    end
    stats #returns hash of that player's stats excluding name
end 


# We can run a section of our tests by using the following command from the CLI:
# rspec spec/hashketball_spec.rb -e find_bigfoot

def find_bigfoot
    bigfoot_array = ["player", 0]

    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players 
                inner_value.each do |player_hashes|
                    player_hashes.each do |k,v|
                        if k == :shoe
                            if v > bigfoot_array[1]
                                bigfoot_array[0] = player_hashes[:player_name]
                                bigfoot_array[1] = player_hashes[:shoe]

                            end
                        end 
                    end 
                end 
            end 
        end 
    end
    bigfoot_array
end 


def big_shoe_rebounds
    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players 
                inner_value.each do |player_hashes|
                    player_hashes.each do |k,v|
                        if v == find_bigfoot[0]
                            return player_hashes[:rebounds]
                        end 
                    end 
                end 
            end 
        end 
    end    
end 


def most_points_scored
    mvp = ["player", 0]

    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players 
                inner_value.each do |player_hashes|
                    player_hashes.each do |k,v|
                        if k == :points
                            if v > mvp[1]
                                mvp[0] = player_hashes[:player_name]
                                mvp[1] = player_hashes[:points]

                            end
                        end 
                    end 
                end 
            end 
        end 
    end
    mvp[0]
end 


def winning_team
    home_team = ["Brooklyn Nets", 0]
    away_team = ["Charlotte Hornets", 0]

    game_hash.each do |home_away, value|
        value.each do |team_atts, inner_value|
            if team_atts == :players 
                inner_value.each do |player_hashes|
                    player_hashes.each do |k,v|
                        if k == :points && home_away == :home
                                home_team[1] += v
                        end 
                        if k == :points && home_away == :away
                            away_team[1] += v
                    end 
                    end 
                end 
            end 
        end 
    end
    if home_team[1] > away_team[1]
        return home_team[0]
    else return away_team[0]
    end 
end 
    # we're going to reduce
    # step into 1st team, traverse player points, reducing to 1st_team points
    # step into 2nd team, traverse player points, reducing to 2nd_team points
        # lingering thought: does it matter array vs integer?

    # return larger total's associated team name (string)

    
    def player_with_longest_name
        mln = ["player", 0]

        game_hash.each do |home_away, value|
            value.each do |team_atts, inner_value|
                if team_atts == :players 
                    inner_value.each do |player_hashes|
                        player_hashes.each do |info, val|
                            if info == :player_name
                                if val.length > mln[1]
                                    mln[0] = player_hashes[:player_name]
                                    mln[1] = player_hashes[:player_name].length
    
                                end
                            end 
                        end 
                    end 
                end 
            end 
        end
        mln[0]
    end 


    def most_steals_stolen
        msp = ["player", 0]

        game_hash.each do |home_away, value|
            value.each do |team_atts, inner_value|
                if team_atts == :players 
                    inner_value.each do |player_hashes|
                        player_hashes.each do |k,v|
                            if k == :steals
                                if v > msp[1]
                                    msp[0] = player_hashes[:player_name]
                                    msp[1] = player_hashes[:steals]
    
                                end
                            end 
                        end 
                    end 
                end 
            end 
        end
        msp[0]
    end 


    def long_name_steals_a_ton? 
        if most_steals_stolen == player_with_longest_name
            return true 
        else return false
        end 
    end 