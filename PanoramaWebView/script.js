document.addEventListener("DOMContentLoaded", function() {
  function shuffle(a) {
    for (let i = a.length; i; i--) {
        let j = Math.floor(Math.random() * i);
        [a[i - 1], a[j]] = [a[j], a[i - 1]];
    }
    return a;
  }

  const DURATION_SHOW_PANORAMA = 30; // s
  const DURATION_TRANSITION = 2000; // ms
  const FOV = 65;

  var panoramas = shuffle([
    '/Users/louislagrange/Pictures/Spheres/PANO_20160704_073208_6.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160704_080828_8.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160704_111457_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160706_143037_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160707_123153_1.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160708_094038_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160708_123840_1.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160708_135748_2.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160709_071045_3.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160709_080748_5.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160709_115655_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160714_160320_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160714_175205_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160717_090904_1.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160717_094355_1.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160718_063140_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160719_153924_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160720_110009_0.jpg',
    '/Users/louislagrange/Pictures/Spheres/PANO_20160723_095315_2.jpg',
  ]);
  var currentPanoramaIndex = -1;
  function nextPanorama() {
    if (++currentPanoramaIndex == panoramas.length) {
      currentPanoramaIndex = 0;
    }
    return panoramas[currentPanoramaIndex];
  }

  var viewer = new PhotoSphereViewer({
    container: 'photosphere',
    panorama: nextPanorama(),
    default_fov: FOV,
    anim_speed: Math.floor(60/DURATION_SHOW_PANORAMA) + 'rpm',
    navbar: false,
    mousewheel: false,
    mousemove: false,
    keyboard: false,
    transition: {
      duration: DURATION_TRANSITION,
      loader: false,
      blur: true
    },
    cache_texture: panoramas.length,
    webgl: true,
  });

  viewer.on('ready', function() {
    triggerTimeoutNextPanorama();
  });

  function triggerTimeoutNextPanorama() {
    viewer.startAutorotate();
    setTimeout(() => {
      viewer.setPanorama(nextPanorama(), {
        longitude: 0,
        latitude: 0
      }, true)
      .then(() => {
        triggerTimeoutNextPanorama();
      });
    }, Math.ceil(DURATION_SHOW_PANORAMA*1000*1.05)); // add 5% to account for possible lag
  }
});
