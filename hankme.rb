#!/usr/bin/env ruby
load 'episode_info.rb'

formatted_episode_info = EPISODE_INFO.map{|row| row.split("	") }.map{|a| [a[2], "Air Date: #{a[-2]}", "Directed By: #{a[3]}", "Written By: #{a[4]}"].join("\n") }

episodes_in_season_lookup = [:one_indexed, 12, 23, 25, 24, 20, 22, 23, 22, 15, 15, 12, 22, 24]
s = rand(13) + 1
e = rand(episodes_in_season_lookup[s]) + 1

puts "*****************************************************************************************"
num_episodes_in_prior_seasons = (s == 1) ? 0 : episodes_in_season_lookup[1..(s-1)].inject(&:+)
episode_number = num_episodes_in_prior_seasons + e
puts "Season #{s} Episode #{e} (##{episode_number})"
puts formatted_episode_info[episode_number]
puts "*******************************************DKR*******************************************"
exit
