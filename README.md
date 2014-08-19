# Projection Mapping Workshop

Gray Area Creative Code Immersive, 2014

http://creativecode.io

### Description
Projection-mapping techniques allow you to paint with projected light onto physical shapes.


### Meeting Times
  6 - 9pm, Tue Aug 19  
  6 - 9pm, Thur Aug 21  
  12 - 6pm, Sat Aug 23  

### Location
  Gray Area  
  2665 Mission St  
  San Francisco, CA 94110  

### Instructor:

Gabriel Dunne  
gabe@gabrieldunne.com  
[gabrieldunne.com](http://gabrieldunne.com)

### Technology

Projection mapping is an effect of [Chiaroscuro](http://en.wikipedia.org/wiki/Chiaroscuro), which is the art "use of contrasts of light to achieve a sense of volume in modelling three-dimensional objects and figures."


### Examples


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

More...

 - [Hyper Matrix](http://vimeo.com/46857169)
 - [Northern Ballet](http://balletnews.co.uk/northern-ballets-cleopatra-tour-projection-mapping/)
 - [Tims Vermeer](https://www.youtube.com/watch?v=CS_HUWs9c8c)
 - [ProjectionMapping.org](http://projection-mapping.org/)
 - [Creative Applications Projection-Mapping Tag](http://www.creativeapplications.net/tag/projection-mapping/)
 - [Wake Me Up - Jack Conte](https://www.youtube.com/watch?v=EfDfdyBldz0) 
 - [Cubepix](http://vimeo.com/58701565)
 - [Lasers and LeapMotion](http://vimeo.com/66358726)
 - [Lasers and Bubble Tracking](http://vimeo.com/66367827)
 - [Light and Bottle](https://www.youtube.com/watch?v=7ZHef-hAvOM)
 - [Oblivion Making-Of](http://www.triplewidemedia.com/2013/04/projection-mapping-in-the-making-of-oblivion-starring-tom-cruise/)


### Software

Any software is usable if it can create, distort, and texture geometry and/or flat planes.

#### Code Frameworks

  - [Processing](http://processing.org)
    - [First Toolkit](github)  
	- [Keystone](http://keystonep5.sourceforge.net/)  
  - [Openframeworks](http://Openframeworks.cc)
  	- [Mapamok](https://github.com/YCAMInterlab/ProCamToolkit/wiki/mapamok-(English)
  	- [Ycam ProCam Toolkit](http://createdigitalmotion.com/2012/03/projector-and-camera-a-little-closer-new-magical-mapping-tools-3d-scanning-and-more/)
  	- Raspberry Pi

#### Software Packages

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
 
#### Automatic Calibration

  - [TightLight](http://createdigitalmotion.com/2013/08/tightlight-automatic-3d-mapping-for-anything-touchdesigner-arduino/) 
  - [Structured Light](http://en.wikipedia.org/wiki/Structured-light_3D_scanner)
  - [Structured Light Instructable](http://www.instructables.com/id/Structured-Light-3D-Scanning/)
    


## Day 1, Aug 19 2014, 6-9pm 

### Quad Mapping w/Processing

In its simplest form, the light cast from a typical project is typically a rectangle. 

A straightforward way to map graphics to a surface is to draw to a quad, and "corner pin" the quad to match the perspective of the projected image.

Using this hand-mapping technique, we can draw a series of rectangles that are hand-mapped onto the scene. This is great for:
    
  - Simple Shapes
  - Images
  - Video

  [Marcin Ignac](http://marcinignac.com) has an example for Processing, aptly named [Projected Quads]([Projected Quads](http://marcinignac.com/blog/projectedquads-source-code/). Try putting your own graphics in Processing's draw loop, and modifying the projected quads to match an object.

  [Example for Processing](http://marcinignac.com/blog/projectedquads-source-code/ProjectedQuadsTest.zip)

  Key Commands:

    'd' toggle debug mode
    'S' save settings
    'L' load settings
    '>' select next quad in debug mode
    '<' select prev quad in debug mode
    '1', '2', '3', '4' select one of selected quad's corners 
    Arrow keys (left, right, up, down) move selected corner's position (you can also use mouse for that)

  [Keystone](http://keystonep5.sourceforge.net/) is a Quad Mapping Library for Processing. Install by searching for 'Keystone' from the 'Import Library' Dialogue in Processing. Keystone works by creating offscreen buffer object that can be drawn to, and then quad mapping the result.

  [Example for Processing](http://keystonep5.sourceforge.net/examples/CornerPin/CornerPin.pde)

    'c' toggles calbration mode
    'l' load layout
    's' save layout
    

### Mesh Mapping w/OpenFrameworks

  By manipulating a mesh, we are effectively interleaving form and software geometry.
  
[Mesh Mapping Example in OpenFrameworks](https://github.com/quilime/of-meshMappingExample)
[Instructable](http://www.instructables.com/id/Projection-Mapped-Sculpture-with-OpenFrameworks-an/)



## Day 2, Aug 21 2014, 6-9pm 

  .... TBD ....

***CLASS CHALLENGE!  . . .***

  - Using the toolkit of your choice, consider an architectural element in the Theater for your own software mapping.
  - Identify a narrative, and technical execution.
  - Plan to balance your the time spent modeling, content creation, projector installation, and form matching.
  - Group work is encouraged. Divide up tasks, share amongst teams. 
  

## Day 3, Aug 23 2014, 12-9pm

Claim an architectural element of the Gray Area Theater for you or your group, and map it using the framework of your choice! Group work is encouraged. 

