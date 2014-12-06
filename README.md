# Intro to Projection Mapping

Projection-mapping techniques allow you use software to paint with projected light onto physical shapes. Projection mapping is an effect of [Chiaroscuro](http://en.wikipedia.org/wiki/Chiaroscuro), which is an art that "uses of contrasts of light to achieve a sense of volume in modelling three-dimensional objects and figures."

## Instructor:

Gabriel Dunne  
gabe@gabrieldunne.com  
[gabrieldunne.com](http://gabrieldunne.com)

## Workshop History

- 2014 Summer, Gray Area Creative Code Immersive
- 2014 Fall, Gray Area Creative Code Immersive

## Meeting Times

- 6 - 9pm, Tue, Dec 2 2014
- 6 - 9pm, Thu, Dec 4 2014
- 12 - 4pm, Sat, Dec 6 2014

## Examples

Pablo Valbuena 

  - [Augmented Sculpture](http://www.pablovalbuena.com/selectedwork/augmented-sculpture-v1/)
  - [Time Tiling](http://www.pablovalbuena.com/selectedwork/time-tiling-stuk/)    
  
Xavier Chassaing

 - [SCINTILLATION](http://vimeo.com/3114617)  
 
Dev Harlan

  - [Works](http://www.devharlan.com/doku.php)

AntiVJ 

  - [The Ark](http://antivj.com)
  - [EYJAFJALLAJÖKULL](http://antivj.com/empac/index.htm)

Obscura Digital

  - [Exploratorium](http://obscuradigital.com/work/emergence-exploratorium/)
  - [More](http://obscuradigital.com/?filter=video-architectural-mapping)

Bot & Dolly 

  - [Box](http://vimeo.com/75260457)

Nobumichi Asai

  - [OMOTE](http://vimeo.com/103425574)
  
Masaru Ozaki 

  - [Chair](https://www.youtube.com/watch?v=KToDmJbEE7Y)
  
Kyle Mcdonald, Jonas Jongejan

  - [Light Leaks](http://vimeo.com/66167082)

More...

 - [Hyper Matrix](http://vimeo.com/46857169)
 - [Northern Ballet](http://balletnews.co.uk/northern-ballets-cleopatra-tour-projection-mapping/)
 - [Tims Vermeer](https://www.youtube.com/watch?v=CS_HUWs9c8c)
 - [ProjectionMapping.org](http://projection-mapping.org/)
 - [Creative Applications Projection-Mapping Tag](http://www.creativeapplications.net/tag/projection-mapping/)
 - [MIT “Shader Lamps”](https://www.youtube.com/watch?v=qfWdMZIo4Cg)
 - [MIT "Shader Lamps"](https://www.youtube.com/watch?v=pDexuUc7r9c) 
 - [Osman Khan "Sur La Table"](http://vimeo.com/5003959)
 - [Wake Me Up - Jack Conte](https://www.youtube.com/watch?v=EfDfdyBldz0) 
 - [Cubepix](http://vimeo.com/58701565)
 - [MIT Tangible Media Group](http://tangible.media.mit.edu/project/io-bulb-and-luminous-room/)
 - [RFIG: High-precision RFID Location Sensing using Pocket Projector](https://www.youtube.com/watch?v=MURwa1lWDsY)
 - [Lasers and LeapMotion](http://vimeo.com/66358726)
 - [Automatic Projection Calbration by Jonny Lee](https://www.youtube.com/watch?v=XgrGjJUBF_I)
 - [Lasers and Bubble Tracking](http://vimeo.com/66367827)
 - [Light and Bottle](https://www.youtube.com/watch?v=7ZHef-hAvOM)
 - [Oblivion Making-Of](http://www.triplewidemedia.com/2013/04/projection-mapping-in-the-making-of-oblivion-starring-tom-cruise/)


## Software

Any software is usable if it can create, distort, and texture geometry and/or flat planes.

### Code Frameworks

  - [Processing](http://processing.org)
  - [Openframeworks](http://Openframeworks.cc)
    - [Mapamok](https://github.com/YCAMInterlab/ProCamToolkit/wiki/mapamok-\(English\))
    - [Ycam ProCam Toolkit](http://createdigitalmotion.com/2012/03/projector-and-camera-a-little-closer-new-magical-mapping-tools-3d-scanning-and-more/)
  - 

### Software Packages

  - [Touch Designer](http://www.derivative.ca/)  
  - [Lpmt](http://hv-a.com/lpmt/)
  - [vvvv](http://vvvv.org/)
     - [How to project on 3D Geometry](http://vvvv.org/documentation/how-to-project-on-3d-geometry)
  - [Vdmx](http://vidvox.net/)
  - [Syphon](http://syphon.v002.info/)
  - [Max/MSP + Jitter](maxmsp)
  - [Cinder](http://libcinder.org)
  - [madmapper](http://www.madmapper.com/)
  - [Structured-light](http://en.wikipedia.org/wiki/Structured-light_3D_scanner)
  - [Dynamapper](http://dynamapper.net/)
  - [Painting With Light](http://pwl.bigfug.com/)
  - [VPT](http://hcgilje.wordpress.com/vpt/)
  - [MapMap](http://mapmap.info/tiki-index.php)
  - [Mesh Warp Server](http://meshwarpserver.org/)
 
### Automatic Calibration

  - [TightLight](http://createdigitalmotion.com/2013/08/tightlight-automatic-3d-mapping-for-anything-touchdesigner-arduino/) 
  - [Structured Light](http://en.wikipedia.org/wiki/Structured-light_3D_scanner)
  - [Structured Light Instructable](http://www.instructables.com/id/Structured-Light-3D-Scanning/)
    
====

## Day 1

### Quad Mapping

In its purest form, the light cast from a typical projector is a rectangle. Additionally, most content built for screens are rectangles. Therefore, a straightforward method of mapping graphics to a surface is to draw it in a quad, and "corner pin" the quad to match the perspective of the projected image. Using this hand-mapping technique, we can draw a series of rectangles that are aligned onto a space or object. This is great for:
    
  - Existing Images
  - Existing Videos
  - Emulation of Multiple Displays
  - Placing "displays" of content where ever you like

#### Using Processing  

In the examples/ folder, you will find a few Processing sketches. One of which is an example that uses Projected Quads, based on a processing sketch by [Marcin Ignac](http://marcinignac.com/blog/projectedquads-source-code/). Navigate to the examples/ folder in this repo and open ProjectedQuadsGLShaders, for example. 

Features:

- Using OpenGL (hardware accellerated)
- Live Video Textures
- GLSL Shaders
- Shader Uniforms are passed into the shaders- 
- Live Shader Reloading

Key Commands

    'SPACE' toggle debug mode
    's' save settings
    'l' load settings
    ',' select next quad in debug mode
    '.' select prev quad in debug mode
    '1', '2', '3', '4' select one of selected quad's corners 
    Arrow keys (left, right, up, down) move selected corner's position (you can also use mouse for that)


  [Demo of this sketch in action](http://vimeo.com/110955580), as used by Stephanie Sherriff for her "White Paintings" series.

#### Exercise

Load your own content into these sketches, and quad-map the content.

====

## Day 2

### Mesh Mapping

  By manipulating a mesh, we are effectively interleaving form and software geometry. There is an addtional step of digitally modeling a 3D form, which can be done a variety of ways. You can use 3D modeling software, like [Sketchup](http://www.sketchup.com/) or [Rhinoceros 3D](http://www.rhino3d.com/), [Maya](http://www.autodesk.com/products/maya/overview), [Cinema4D](http://www.maxon.net/products/cinema-4d-studio/who-should-use-it.html), and etc.
  
Additionally there are a variety of methods to scan forms, using a depth camera, 2D camera vision, or 3D laser scanners. Even [DIY](http://makezine.com/projects/diy-3d-laser-scanner-using-arduino/) methods.

#### OpenFrameworks  
  
- [Mesh Mapping Example in OpenFrameworks](https://github.com/quilime/of-meshMappingExample)
- [Instructable](http://www.instructables.com/id/Projection-Mapped-Sculpture-with-OpenFrameworks-an/)

### Computer Vision

Computer Vision techniques use matrix transformations to approzimate focal distortion through a lense. This method distorts the frame of reference based on a pattern, or markers on a physical object, usually read by a camera, sensors, or manual input.

[ProCamToolkit](https://github.com/YCAMInterlab/ProCamToolkit/) is a modular toolkit developed with YCAM Interlab by Kyle Mcdonald, built with OpenFrameworks. It's collection software and code for openFrameworks aimed at making high level projector-camera calibration more accessible. 

Mapamok is a module of ProCamToolkit used for for exploring projection mapping. It includes features for matching geometry to space using camera vision, rapid prototying with GLSL Shaders, and camera calibration tools. 

### Optical Mapping with Mapamok

  [Download Mapamok](https://github.com/YCAMInterlab/ProCamToolkit/downloads)

  After downloading Mapamok, grab the grandtheater.dae file in the assets/ folder of this repo, and put it inside Mapamok data folder. Rename the "grandtheater.dae" to "model.dae". You'll have to rename the original "model.dae" to something else.

  Then, follow along with the [Mapamok Tutorial](https://github.com/YCAMInterlab/ProCamToolkit/wiki/mapamok-(English).
  
  The code of Mapamok has been ported to Touch Designer in [CamSchnappr](https://www.derivative.ca/Forum/viewtopic.php?f=22&t=4225)
  
#### Exercise

Model 3D wireframe, and align it to a physical shape via projection. Choose a simple elements such as a corner, or a window, or a doorway. Deconstruct your shape down to its component parts and try to use modeling primitives in a modular way.
  
====

## Day 3

### Projectors

#### DLP

DLP stands for digital light processing. These projectors use tiny mirrors to reflect light toward the screen (an "on" pixel) or away (an "off" pixel). Most use a color wheel -- literally a spinning wheel with color filters -- to create sequential color. Some high-end models use three DLP chips; one each for red, green, and blue. DLP projectors range in price from a few hundred dollars to tens of thousands, and more. Most projectors in movie theaters use DLP. A challenge imposed by DLP projectors is that unless you are filming them with a high-end camera, you will see banding on most consumer digital cameras.

Pros of DLP:

- Great color accuracy
- Great contrast.
- Best contrast ratios and shadow detail.
- Same technology as projectors installed in digital theaters.

Cons of DLP:

- On some projectors, viewers can detect a color breakup effect called the "rainbow" effect.
- Sometimes color saturation is not as good as LCD or home theater DLP projectors.


#### LCD

LCD, i.e., liquid crystal display, is the technology found in most TVs. LCD projectors use three liquid crystal panels, each tasked with creating an image using just one of the primary colors (red, green, and blue). All three are projected on the screen at once, so you see a full color image. LCD projectors range in price from a few hundred to several thousand dollars. LCD projectors will film properly with hand-held and consumer cameras, they are ideal for documenting projection works.

Pros of LCD

- Very bright
- True high definition models are the least costly of any technologies with 720p models starting at under $2k.
- Great color saturation.
- 1000 lumen and lower models will usually have long lasting lamps.
- Cna be filmed with consumer cameras w/out banding.

Cons of LCD

- Dead pixels are common.
- Contrast ratios are lower than those on DLP projectors.
- Shadow detail and absolute black levels fall short of DLP powered projectors.
- Panel convergence problems (where the three LCD panels don't align properly producing a noticeable color halo around each pixel) are common.
- LCD panels are organic and lose image quality over time. The less the machine is used each day, the less of a problem this is. Projectors that are used for over eight (8) hours a day can exhibit problems fairly quickly.
- Color uniformity across the image is lower than that of DLP powered projectors.


#### LCoS

LCoS, or liquid crystal on silicone projectors, came along at about the same time as DLP powered projectors. It is a bit of a hybrid between LCD and DLP LCoS technology is also referred to as reflective LCD, while individual manufacturers use their own names. Sony and JVC are the primary manufacturers of LCoS projectors, which they call SXRD and D-ILA, respectively. LCoS projectors range in price from a few thousand dollars to a few models that are in the tens-of-thousands range. 

Pros of LCoS:

- LCoS resolutions tend to start at SXGA enabling native 720p high definition images to be shown.
- Like LCD, LCoS machines can be very bright.
- Offers a very smooth, film-like image due to its pixel structure.
- Great color saturation and accuracy.

Cons:

- Can be pricey, although based on resolution, the cost is not much more than that of DLP.
- Dead pixels are more visible than with other technologies and happen as often as with LCD's.

====

Projector References:

- http://www.projectorcentral.com/
- http://www.theprojectorpros.com/learn-s-learn-p-theater_dlp_vs_lcd_vs_lcos.htm
- http://www.cnet.com/news/dlp-vs-lcd-vs-lcos-projector-tech-pros-and-cons/

#### In-Class Lab

  - Consider which architectural elements in the theater you want to map
  - Use the toolkit of your choice to map the element
  - Use mesh mapping, quad mapping, CV methods, mapamok, or combination.
  - Balance your the time spent modeling, content, calibration
  - Group work is encouraged! Divide up tasks, share amongst teams. 
