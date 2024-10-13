a = [1,0,1,0,2,1,0,0,1,0,0,0,2,1,0,2]

live_loop :drum1 do
  16.times do |i|
    sample :bd_haus if a[i] == 1
    sleep 0.25
  end
end


live_loop :drum1 do
  16.times do |i|
    sample :bd_haus if a[i] == 1
    sample :sn_zome if a[i] == 2
    sleep 0.25
  end
end

# Define the Tizita scale (D, F, G, B, C)
tizita_scale = [:d, :f, :g, :b, :c]

# Function to play the Tizita melody
define :tizita_melody do
  use_synth :piano
  with_fx :reverb, room: 0.8 do
    # Play notes in a simple melodic pattern
    play_pattern_timed tizita_scale, [0.25, 0.25, 0.5, 0.5, 1], release: 1
  end
end

# Function to create a simple beat
define :tizita_beat do
  puts "tixita beats"
  sample :bd_haus, amp: 0.5 # Kick drum
  sleep 0.5
  sample :sn_dolf, amp: 0.1 # Snare
  sleep 0.5
end

# Background drone
live_loop :drone do
  use_synth :dark_ambience
  puts "drone"
  play :d2, sustain: 4, release: 4, amp: 0.5
  sleep 2
end


# Background drone
live_loop :drone do
  use_synth :dark_ambience
  puts "drone"
  play :d2, sustain: 4, release: 4, amp: 0.2
  sleep 2
end

# Live loop for Tizita melody
live_loop :tizita do
  tizita_melody
  puts "tizita_melody"
  
  sleep 0.5 # Pause before repeating the melody
end

# Live loop for the beat
live_loop :beat do
  puts "synch"
  sync :tizita # Ensure the beat syncs with the melody
  tizita_beat
end