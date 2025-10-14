use_bpm 220  # Define el tempo en beats por minuto

# Lista intercalada de notas y duraciones
notes_and_durations = [76, 12, 76, 12, 20, 12, 76, 12, 20, 12, 72, 12, 76, 12, 20, 12, 79, 12, 20, 36, 67, 12, 20, 36, 72, 12, 20, 24, 67, 12, 20, 24, 64, 12, 20, 24, 69, 12, 20, 12, 71, 12, 20, 12, 70, 12, 69, 12, 20, 12, 67, 16, 76, 16, 79, 16, 81, 12, 20, 12, 77, 12, 79, 12, 20, 12, 76, 12, 20, 12, 72, 12, 74, 12, 71, 12, 20, 24]

# Iterar sobre la lista en pasos de 2
live_loop:mario do
  notes_and_durations.each_slice(2) do |note, duration|
    play note
    sleep duration * 0.07  # Ajusta el 0.1 a tu preferencia para cambiar la duración de las pausas
  end
end
