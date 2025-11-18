# Coded by Bruno Perelli S.

use_bpm 56

flutes = "/Users/hackspawn/Downloads/flute/"
solenoids = "/Users/hackspawn/Downloads/solenoid_samples_1/"

# Add some reverb for depth
with_fx :reverb, mix: 0.5 do
  live_loop :desert_winds do
    # Choose a suitable synth and parameters for desert ambiance
    s = synth :dark_ambience, amp: rrand(0.2, 0.5), attack: 1, sustain: 4, release: 5, cutoff_slide: 3, cutoff: 80, pan: rrand(-0.2, 0.2), pan_slide: 4
    
    # Add some wind-like effects by manipulating cutoff and pan
    control s, pan: rrand(-0.2, 0.2), cutoff: rrand(70, 90)
    
    sleep rrand(3, 6)
  end
end

# Define crowd sound samples
#crowd_samples = [:ambi_lunar_land, :ambi_dark_woosh, :ambi_glass_rub, :ambi_haunted_hum]

# Start the stadium crowd loop
#live_loop :stadium_crowd do
# Randomly choose a crowd sample
#  sample crowd_samples.choose, rate: rrand(0.125, 0.25), amp: rrand(0.5, 1.0)
#  sleep rrand(0.1, 1)
#end

with_fx :distortion do
  live_loop :flutes do
    decimal = rand_i(10) # Generate a random integer between 0 and 9
    samplename = ["flute_c3", "flute_c4", "flute_c5", "flute_c6"]
    time = [0.25, 0.5, 0.75, 1].choose
    sample flutes, samplename[decimal], amp: 0.125, rate: 1, pan: rrand(-0.8, 0.8), sustain: 2.0 # Adjust sustain time here
    sleep time
  end
end

with_fx :reverb do
  live_loop :solenoids do
    decimal = rand_i(10) # Generate a random integer between 0 and 9
    samplename = ["loop_1", "loop_2", "loop_3", "loop_4", "loop_5", "loop_6", "loop_7", "hit_1", "hit_2", "hit_3"]
    time = [0.125, 0.25, 0.5, 0.75].choose
    sample solenoids, samplename[decimal], amp: 0.25, rate: 2, pan: rrand(-0.8, 0.8), sustain: 2.0 # Adjust sustain time here
    sleep time
  end
end
