require 'csv'

solenoids = "/Users/hackspawn/Downloads/solenoid_samples_1/"

# Determina las muestras por minuto
use_bpm 110

# Lee el archivo CSV y almacena los valores en un array
data = CSV.read("/Users/hackspawn/Downloads/samples.csv")

# Define los bucles en vivo
live_loop :solenoid1 do
  data.each do |line|
    music1 = line[0]
    sample solenoids, music1, beat_stretch: 1, amp: 10
    sleep 2
  end
end

live_loop :solenoid2 do
  data.each do |line|
    music2 = line[1]
    sample solenoids, music2, beat_stretch: 4, amp: 2
    sleep 2
  end
end

live_loop :solenoid3 do
  data.each do |line|
    music3 = line[2]
    sample solenoids, music3, beat_stretch: 4, amp: 2
    sleep 3
  end
end

live_loop :solenoid4 do
  data.each do |line|
    music4 = line[3]
    sample solenoids, music4, beat_stretch: 4, amp: 2
    sleep 5
  end
end
