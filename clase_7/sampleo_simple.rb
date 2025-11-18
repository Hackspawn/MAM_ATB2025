#recuerden que las rutas son con / (incluso windows)
#recuerden que la ruta de Windows debe especificar unidad de almacenamiento "C:"
#ejemplo: "C:/Mis_Samples/" o "/User/usuario/Downloads/mis_samples/" (mac o linux)
solenoids = "/Users/brunoperelli/Downloads/solenoid_samples_1"
#determina las muestras por minuto
use_bpm 110

#establezco un nombre de loop ej: solenoid1
#llamo al nombre del archivo dentro de la carpeta tal y como se llama "loop_2"
live_loop :solenoid1 do
  sample solenoids, "loop_4", beat_stretch: 60, amp: 20
  sleep 2
end
#Repito el método para otras muestras de audio cambiando nombre de loop y asigno el archivo que quiero utilizar.
live_loop :solenoid2 do
  sample solenoids, "hit_5", beat_stretch: 10, amp: 2
  sleep 2
end

live_loop :solenoid3 do
  sample solenoids, "hit_1", beat_stretch: 4, amp: 20
  sleep 3
end

live_loop :solenoid4 do
  sample solenoids, "loop_1", beat_stretch: 4, amp: 2
  sleep 5
end
