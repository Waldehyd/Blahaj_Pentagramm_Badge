#import "@preview/mantys:1.0.2": *

#show: mantys(
  name: "mantys",
  version: "1.0.0",
  authors: (
    "Written by Waldo and Mona",
  ),
  license: "MIT",
  description: "Setup Guide for the Blahaj Pentgramm Badge",
  repository: "https://github.com/jneug/typst-mantys",

  /// Uncomment one of the following lines to load the above
  /// package information directly from the typst.toml file
  // ..toml("../typst.toml"),
  // ..toml("typst.toml"),

  title: "Blahaj Pentagramm Badge",
  // subtitle: "Tagline",
  date: datetime.today(),

  // url: "",

  abstract: [
    The Blahaj Pentragram Badge is a...
  ],

  // examples-scope: (
  //   scope: (:),
  //   imports: (:)
  // )

theme: themes.modern
)

= Flashing the Firmware

The Blahaj Pentagramm Badge (BPB) is powered by WLED. As we use Usermods to support the PIR and the BME280, it's necessary to build WLED from source. This involves the folowing steps:

- Clone the latest Version from Github
- Replace the Platform.io by the one in the Firmware folder of BPB-Repository
- Connect the BPB via USB to your Computer
- Open the WLED-Folder in VSCode
- Hit Compile and Upload



= Configuring WLED

After flashing, the 15 LEDs should light up instantly. The following values are preconfigured and should not be edited:
#v(0.5cm)

#figure(
table(
  columns: (auto, auto),
  stroke: 0.04em,
  inset: 6pt,
  align: left,
  [SDA], [4], 
  [SCL], [5],
  [LEDPIN], [14],
  [LEDCOUNT], [15]
)
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
