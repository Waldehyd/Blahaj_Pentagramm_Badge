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
  show-index: false,

  /// Uncomment one of the following lines to load the above
  /// package information directly from the typst.toml file
  // ..toml("../typst.toml"),
  // ..toml("typst.toml"),

  title: "The Shorktagram Badge",
  // subtitle: "Tagline",
  date: datetime.today(),
  cover: figure(image("/images/Front.png", width: 78%)),

  abstract: [
  The Shorktagram-Badge features a beautiful PCB-Frontplate backed with 15 individually controllable LEDs, Temperature and Humidity Sensor as well as an optional Motion Sensor. This setup makes it ideal to be used as an air sensor by day and a nightlight by uh... night.
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

= Assembly Part 1: PCB
+ Take the parts out of the bag. You only need the PCB which will contain the electronics for now.

    #subpar.grid(
    figure(image("/Images/Real/PartsOverview.jpeg", width: 90%)),
    columns: (1fr),
  )
  
+ Either apply solderpaste yourself or get help from the soldering team.
    #subpar.grid(
    figure(image("/Images/Real/Clamp.jpeg", width: 100%)),
    figure(image("/Images/Real/Clamp2.jpeg", width: 100%)),
    figure(image("/Images/Real/Paste.jpeg", width: 100%)),
    figure(image("/Images/Real/Paste2.jpeg", width: 100%)),
    columns: 2,
  )
  
+ Open the IBOM of the repo (PCB/PCB_Back/bom/ibom.html) and start placing the parts with a pair of tweezers. The parts in the box are sorted in the order in which they are needed.
+ When you are done with the first side, put the PCB in the oven and bake it for the first time.
    #subpar.grid(
    figure(image("/Images/Real/BottomView.jpeg", width: 72%)),
    columns: (1fr),
  )
+ Wait until the PCB has cooled of and continue placing the parts on the other side. Please skip the hand-solder parts for now.
    #subpar.grid(
    figure(image("/Images/Real/TopView.jpeg", width: 72%)),
    columns: (1fr),
  )
+ Bake the other side of the PCB.
+ Take a look at the PCB and search for shorts and errors on the placed parts. Remediate these errors before you continue. If needed, get help from your local Shorktagram dealer.
+ Hand-solder the last two parts onto the PCB. Solder on the  USB-C connector legs. DO THIS BEFORE YOU PLUG IN A USB CABLE.




+ Connect your PCB to your computer and see if the ESP shows up. If so: Congratulation, you are done with the hardest part. Please return your empty tray to the workshop-hosts. If you want, they can also flash your Shorktagram-Badge.



= Assembly Part 2: Case


+ Take the little bag with the screws and the standoffs. Screw the faceplate onto the PCB with the standoffs in between.


    #subpar.grid(
    figure(image("/Images/Standoffs.png", width: 65%)),
    columns: (1fr),
  )

+ Next you will need the battery and the velcro-tape. If you are planning on using the battery, apply one of the sides of the velcro to the battery-box-area on the PCB and the other side to the battery. 

  #subpar.grid(
    figure(image("/Images/Velcro.png", width: 70%)),
    columns: (1fr),
  )

+ Attach and plug in the Battery.

    #subpar.grid(
    figure(image("/Images/AttachLipo.png", width: 65%)),
    columns: (1fr),
  )


+ Take the case-shell and place the PCB in the correct orientation inside. 

  #subpar.grid(
    figure(image("/Images/Fullcase.png", width: 100%)),
    columns: (1fr),
  )

+ Close the case with the three screws on the sides.

  #subpar.grid(
    figure(image("/Images/CaseScrew.png", width: 60%)),
    columns: (1fr),
  )


+ Put the PIR sensor into its housing, close it and plug in the right-angled connector.

  #subpar.grid(
    figure(image("/Images/AssembleSensor.png", width: 100%)),
    columns: (1fr),
  )

+ Plug in the PIR via the 3-Pin connector and attach it with two screws.

  
  #subpar.grid(
    figure(image("/Images/SensorScrewToCase.png", width: 72%)),
    columns: (1fr),
  )

+ Screw in two screws into the mounting plate (towards the side with cutouts). Optionally, push through the hook. You attach the mounting plate by pushing and turning them in the oblong holes.


  #subpar.grid(
    figure(image("/Images/MountScrew.png", width: 100%)),
    figure(image("/Images/Mount.png", width: 100%)),
    columns: (1fr, 1fr),
  )





= Flashing the Firmware
#strong[Prerequisites]: A computer running VSCode with the Platform.io extension installed.


The Shorktagram-Badge is powered by WLED. As we use Usermods to support the PIR and the BME280, it's necessary to build WLED from source. This involves the following steps:



+ Clone or Download the latest Version of WLED from Github (https://github.com/wled/WLED)
+ Replace the platformio.ini by the one in the /Firmware folder of the Shorktagram-Badge Repository (https://github.com/Waldehyd/Blahaj_Pentagramm_Badge)
+ Connect the Badge to your computer via USB (if it's not recognized as a serial device, it's likely a soldering problem) 
+ Open the WLED-Folder in VSCode
+ Choose the correct serial port of your Badge (if multiple devices are connected) and then hit upload!

= Configuring WLED
== Default Values
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

By default, WLED opens up a Wifi-AP to access the Webinterface. The default password is "wled1234". To integrate your Badge into your local Wifi, hit "WiFi Setup" and enter your credentials. You can also change the password of the AP from there as well (we recommend this to avoid mix-ups, i.e. connecting to the wrong device).

#block({
subpar.grid(
  figure(image("/Images/Settings.png", width: 100%)),
  figure(image("/Images/APPass.png", width: 100%)),
  figure(image("/Images/WifiSetup.png", width: 100%)),
  columns: (1fr, 1fr, 1fr),
)
place(
  top + left,
  circle(radius: 10pt, fill: green, outset: 2pt),
  dx: 24.5%,
  dy: 21.7%,
)})

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
If you want access the values without using Home Assistant, head over to the LED Configuration section.  

\



== Home Assistant Integration and MQTT

After the Badge was added to your Wifi, it's usually autodiscovered by HA and can be configured via the WLED-Integration. If not, manually install the integration manually and enter the local IP of your Badge.\
To access the values from the BME280 and the PIR, it's necessary to configure MQTT in WLED as well. If you use Home Assistant, you probably have the Mosquitto MQTT Broker installed already. Head over to "Sync Interfaces", scroll down to "MQTT" and enter the Broker IP (likely your Home Assistant IP) as well as Username and Password. Afterwards, restart WLED and you should find the published values in a MQTT-Device called "WLED".

#subpar.grid(
   figure(image("/Images/HA_MQTT_WLED.png", width: 100%)),
  columns: (1fr),
)
#pagebreak()
/// Helper for Tidy-Support
/// Uncomment, if you are using Tidy for documentation
// #let show-module(name, scope: (:), outlined: true) = tidy-module(
//   read(name + ".typ"),
//   name: name,
//   show-outline: outlined,
//   include-examples-scope: true,
//   extract-headings: 3,
// )

== Loading your light settings at startup

WLED does not save your light settings without being explicitly. After setting up your colors/effects, you need to save them as a preset. If you want a preset to be loaded at startup, enter the ID in the LED  Preferences under "Defaults -> Apply preset X". 

#subpar.grid(
   figure(image("/Images/SavePreset.png", width: 100%)),
   figure(image("/Images/LoadPreset.png", width: 100%)),
   figure(image("/Images/LoadPreset.png", width: 100%)),
   columns: (1fr,1fr,1fr),
)

= Notes on Usage

As running the LEDs for a while results in the Badge heating up quite a bit, the sensor readings from the BME280 become unreliable for air measurements. As such, it's recommended to use the BME280 for setups where the LEDs aren't used continuously, e.g. when using the PIR in conjunction with a nighttime timer for the pathway to your bathroom.