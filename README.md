# Blahaj_Pentagramm_Badge

The Shorktagram-Badge features a beautiful PCB-Frontplate backed with 15 individually controllable LEDs, Temperature and Humidity Sensor as well as an optional Motion Sensor. This setup makes it ideal to be used as an air sensor by day and a nightlight by uh... night.

IBOM:
https://htmlpreview.github.io/?https://github.com/Waldehyd/Blahaj_Pentagramm_Badge/ibom/ibom.html

Firmware:

Build WLED (https://github.com/Aircoookie/WLED) using PlatformIO with the following Environment using the Buildflags for BME280 and PIR:

```
[env:d1_mini]
...
build_flags = ${common.build_flags_esp8266} -D USERMOD_BME280 -D USERMOD_PIRSWITCH -D PIR_SENSOR_PIN=13
...
```

Configuration:
```
LED Preferences: 
    -> Length = 15
    -> GPIO = 14
Usermods:
    -> SDA = 4
    -> SCL = 5
    -> Enabled

    Reboot
```
