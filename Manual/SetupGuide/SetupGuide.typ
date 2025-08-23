#import "@preview/mantys:1.0.2": *
#import "@preview/subpar:0.2.2"
#import "Theme/modernCustom.typ": modernCustom





#show: mantys(
  
  name: "mantys",
  version: "1.0.0",
  authors: (
    "Written by Waldo and Mona",
  ),
  license: "MIT",
  description: "Setup Guide for the Shorktagram Badge",
  repository: "https://github.com/Waldehyd/Blahaj_Pentagramm_Badge",

  /// Uncomment one of the following lines to load the above
  /// package information directly from the typst.toml file
  // ..toml("../typst.toml"),
  // ..toml("typst.toml"),

  title: "The Shorktagram Badge",
  // subtitle: "Tagline",
  date: datetime.today(),
  cover: figure(image("/images/Front.png", width: 78%)),

  abstract: [
  The Shorktagram-Bade features a beautiful PCB Frontplate backed with 15 individually controllable LEDs, Temperature and Humidity Sensor as well as a Motion Sensor. This setup makes it prone to be used as an air sensor by day and a nightlight by... night.
  ],

  // examples-scope: (
  //   scope: (:),
  //   imports: (:)
  // )

theme: modernCustom
)


#set par(
  spacing: 2em,
  leading: 0.85em,
)



= Flashing the Firmware
Prerequisites: A computer running VSCode with the Platform.io extension installed.


The Shorktagram-Badge is powered by WLED. As we use Usermods to support the PIR and the BME280, it's necessary to build WLED from source. This involves the folowing steps:



+ Clone or Download the latest Version of WLED from Github
+ Replace the platformio.ini by the one in the Firmware folder of Shorktagram-Badge Repository (https://github.com/wled/WLED)
+ Connect the Badge to your computer via USB (if it's not recognized as a serial device, it's likely a soldering problem) 
+ Open the WLED-Folder in VSCode
+ Choose the correct serial port of your Badge (if multiple devices are connected) and then hit Upload!



= Configuring WLED
== Defaults
After flashing, the 15 LEDs should light up instantly. The following values should be preconfigured and (if correct) should not be edited:


#figure(
table(
  columns: (auto, auto),
  stroke: 0.04em,
  inset: 6pt,
  align: left,
  [SDA], [4], 
  [SCL], [5],
  [PIRPIN], [13],
  [LEDPIN], [14],
  [LEDCOUNT], [15],

)
)

== Wifi-Setup

By default, WLED opens up a Wifi-AP to access the Webinterface. The default password is "wled1234". To integrate your Badge into your local Wifi, hit "WiFi Setup" and enter your credentials. You can also change the password of the accesspoint from there as well.

#subpar.grid(
  figure(image("/Images/Settings.png", width: 70%)),
  figure(image("/Images/Settings.png", width: 70%)),
  columns: (1fr, 1fr),
)


== Enable Usermods

Back in the Settings, go to "Usermods". From there, you can enable the BME280 and/or the PIR.

#block({
subpar.grid(
  figure(image("/Images/Settings.png", width: 100%)),
  figure(image("/Images/BME.png", width: 100%)),
  figure(image("/Images/PIR.png", width: 100%)),
  columns: (1fr, 1fr, 1fr),
)
place(
  top + left,
  circle(radius: 10pt, fill: green, outset: 2pt),
  dx: 24.5%,
  dy: 77.2%,
)})


The settings are mostly self-explanatory (famous last words I know). If you want to use Home Assistant, tick "HomeAssistantDiscovery" on the BME and "HA Discovery" on the PIR. The PIR can be used in MQTT-Only Mode, which exposes the PIR but doesn't turn off the LEDs automatically. The "PIROffSec" sets the delay between the moment when no motion was detected and the LEDs turning off.\
If you want access the values without using Home Assistant, head over to the LED Configuration Section  

\



== Home Assistant Integration and MQTT

After the Badge was added to your Wifi, it's usually autodiscovered by HA and can be configured via the WLED Integration. If not, manually install the integration manually and enter the local IP of your Badge.\
To access the values from the BME280 and the PIR, it's necessary to configure MQTT in WLED as well. If you use Home Assistant, you probably have the Mosquitto MQTT Broker installed already. Head over to "Sync Interfaces", scroll down to "MQTT" and enter the Broker IP (likely your Home Assistant IP) as well as Username and Password. Afterwards, restart WLED and you should find the published values in a MQTT-Device called "WLED".

#subpar.grid(
   figure(image("/Images/HA_MQTT_WLED.png", width: 100%)),
  columns: (1fr),
)

/// Helper for Tidy-Support
/// Uncomment, if you are using Tidy for documentation
// #let show-module(name, scope: (:), outlined: true) = tidy-module(
//   read(name + ".typ"),
//   name: name,
//   show-outline: outlined,
//   include-examples-scope: true,
//   extract-headings: 3,
// )


= Assembling the Case

The case is the 3D-Printed, all .stl files can be found in the /Case directory of the repository. 


= Notes on Usage

As running the LEDs for a while results in the Badge heating up quite a bit, the sensor readings from the BME280 become unreliable. As such, it's recommended to use the BME280 for setups where the LEDs aren't used continuously, e.g. when using the PIR in conjunction with a nighttime timer for the pathway to your bathroom.


