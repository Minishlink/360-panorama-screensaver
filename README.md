# macOS 360° Panorama / Photo Sphere shots Screen Saver

## Requirements
* XCode
* node

## Install

It's only a proof of concept right now, so you'll have to build the screen saver in order to change the images.
Let me know in an issue if you want to be able to change the files more easily ;) (add a Thumbs up vote on [issue #2](https://github.com/Minishlink/360-panorama-screensaver/issues/2))

* First, setup the project:
```bash
git clone https://github.com/Minishlink/360-panorama-screensaver.git
cd PanoramaScreenSaver/PanoramaWebView
yarn # or npm install
```
* Edit the paths to your images in `PanoramaWebView/script.js`
* In XCode, open `PanoramaScreenSaver.xcodeproj`
* In XCode, build the project
* In XCode, develop the `Products` folder and right click the `PanoramaScreenSaver.saver` file to show it in finder
* Double click on the aforementioned file to install the screen saver
* Open the macOS preferences, choose Screensaver and activate `360° Panorama`

## Uninstall

Open the macOS preferences, choose Screensaver, right click on `360° Panorama` and choose delete.
