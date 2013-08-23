#!/usr/bin/env ruby
episodes_in_season_lookup = [:one_indexed, 12, 23, 25, 24, 20, 22, 23, 22, 15, 15, 12, 22, 24]
s = rand(13) + 1
e = rand(episodes_in_season_lookup[s]) + 1

num_episodes_in_prior_seasons = (s == 1) ? 0 : episodes_in_season_lookup[1..(s-1)].inject(&:+)
episode_number = num_episodes_in_prior_seasons + e

episode_info_array = File.read("episode_info.txt").split("\n").map{ |row| row.split("\t") }
episode_info = episode_info_array[episode_number]
formatted_episode_info = [
                          episode_info[2],
                          "Air Date: #{episode_info[-2]}",
                          "Directed By: #{episode_info[3]}",
                          "Written By: #{episode_info[4]}"
                         ].join("\n")

puts
puts "Season #{s} Episode #{e} (##{episode_number})"
puts formatted_episode_info
puts
exit
