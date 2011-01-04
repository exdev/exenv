Exif plugin version 1.47b for Total Commander (Version 6.5 and above)

This is plugin is a remake of the plugin made by Christian Ghisler (version 1.4)

Warning
-------
Although I have tested this plugin quite intensively it may still contain some bugs. Please treat this version as a beta version and report any bugs you may find.
This version is NOT supported or endorsed by Christian Ghisler. I only used his source code.

Version 1.47b
-------------

	This version fixes a bug that prevented the plug-in from reading the exif data from pictures edited by Irfanview. (Thanks to Lars Denkewitz for the bug report).


Version 1.46b
-------------

	This version fixes a bug that caused TC to crash on certain pictures. (Thanks to Joost and Remsan for the bug report).


Version 1.45b
-------------

	This version recognizes .tif and .jpe as valid extensions.


Version 1.44b
-------------

	This version fixed a bug that caused TC to crash (sometimes) when viewing ExposureTimeFraction field.

Version 1.43b
-------------

	This version adds support to the Canon MakerNote. I tried to include as many fields as possible but some might still be missing

	added fields
	------------
	- Canon Macro mode
	- Canon Flash mode
	- Canon Continuous drive mode
	- Canon Focus Mode
	- Canon Image size
	- Canon Easy shooting mode
	- Cannon Digital Zoom
	- Cannon Contrast
	- Canon Saturation
	- Canon Sharpness
	- Canon ISO Speed
	- Canon Metering Mode
	- Canon Focus Type
	- Canon AF point selected
	- Canon Exposure mode
	- Canon Flash Activity
	- Canon White Balance
	- Canon Flash Bias
	- Canon Image type
	- Canon Firmware version
	- Canon Image number
	- Canon Owner name
	- Canon Camera serial number


Version 1.42b
-------------

	A few bugs were fixed and many new fields were added as detailed:

	fixed
	-----
	- Colordepth field renamed to BitsPerSample
	- ApertureValue field is now displayed as floating point
	- MaxApertureValue field is now displayed as floating point
	- Metering Mode values were not correct
	- Light Source Values were not correct
	- A bug prevented the Flash values being displayed correctly
	- Some minor fixes made to comply with the Exif standard Version 2.2 (and my real life tests :-)

	added fields
	------------
	- ImageDescription
	- UserComment
	- XResolution
	- YResolution
	- ResolutionUnit
	- Software
	- Artist
	- ShutterSpeed
	- YCbCrPositioning
	- SensingMethod
	- ExposureMode
	- WhiteBalance
	- DigitalZoomRatio
	- FocalLengthIn35mmFilm
	- SceneCaptureType
	- GainControl
	- Contrast
	- Saturation
	- Sharpness
	- SubjectDistanceRange

future enhancements
-------------------
	- Adding more fields as required
	- Adding more MakerNote fields (Nikon is probably next - but it depends on popular demand)
	- Adding more languages (if someone sends me the translations - I know only english :-(

How to contact me
-----------------
By e-mail: mpcrypt@yahoo.com


A BIG thank you
---------------
A BIG thank you to Christian Ghisler for making the great software Total Commander is and for releasing the exif plugin's source code.


The Original Readme.Txt accompanying version 1.4
-----------------------------------------------

Exif plugin version 1.4 for Total Commander

This plugin extracts digital camera data from JPG files, like exposure time.
Can be used in thumbnail view and custom column view, as well as in the
search and multi-rename functions.

Changelog:
20041124 Fixed: MaxApertureValue uses APEX field type: RootOf(2)^value
20041124 Added: ApertureValue and ExposureTimeFraction(APEX) fields
20041116 Fixed: Division by zero error if nominator or denominator contained 0 (rational value)
20041027 Added: Better display of ExposureTimeFraction for jpegs which store it as 16666/1000000
20041020 Added: Support for files in JFIF mode
20041017 Added: Support for ISO field
20041017 Added: Support for Canon RAW image files
20041017 Fixed: jpg file wasn't closed after extracting the exif data!

