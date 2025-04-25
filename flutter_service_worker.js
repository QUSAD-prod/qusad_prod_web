'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c18130812eaf1abdc61a89c59e3b7b1c",
"version.json": "cb0c60656f52c33d70adc860cc552ef9",
"index.html": "24775c48fc41391d82bf38d884af1b47",
"/": "24775c48fc41391d82bf38d884af1b47",
"main.dart.js": "1fc71af7c682b977fc37b5eea8110135",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "82379276278f7bcc91fecbb24fc43d97",
"assets/AssetManifest.json": "5b037e27d54adfe3786a42675306e921",
"assets/NOTICES": "d7cf1486505d16c9d316f7717ee97f20",
"assets/FontManifest.json": "40f3263573607c06016dd3c6490878ea",
"assets/AssetManifest.bin.json": "b0e703c1a86e0fbd36c0249d9819ab22",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f9f7efb820139832df6ce1f3eab06f41",
"assets/fonts/MaterialIcons-Regular.otf": "9138a6ff6688583853604f2d0247ad16",
"assets/assets/images/avatar.jpeg": "92051cc698628a3e276d880f3690937c",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Thin.ttf": "629142e9d264355129ad45763caa52e0",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Bold.ttf": "3aba5b9b33104e426ed11fe6b5789753",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Italic.ttf": "7cd8630e1bc8cae364a3616418f954ed",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-LightItalic.ttf": "c1e8599bfdb164b1006ac9bc662f2f08",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Regular.ttf": "a0147b5ab9e4946e81879aef45313def",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-ExtraLightItalic.ttf": "2c20f32cbea6e03d91e0db149eb82466",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-SemiBoldItalic.ttf": "fa8c03a52bf38d2fb2967f54fbf28a75",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-VariableFont_wght.ttf": "0db4490d7d644e59cf7fd5eb5af386fb",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Light.ttf": "822a285e32f16f218ae505dc3c51cae7",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-MediumItalic.ttf": "69d9370ee127c4606da21f105d346f3f",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-ExtraBold.ttf": "49969685a0e949f34240ac994e4f6ac2",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-SemiBold.ttf": "9d1d8c76cca7c52b5ba85124ea0dde52",
"assets/google_fonts/JetBrains_Mono/OFL.txt": "2025a2ee80175b15561a8232e67d74d5",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Italic-VariableFont_wght.ttf": "e430ca03ef3f61ce9890325836e0a46b",
"assets/google_fonts/JetBrains_Mono/README.txt": "a4977b43c303e957fa91703e9540efc4",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-ExtraBoldItalic.ttf": "6f6d2ebd4e9e8050c1b761f0290518b2",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-ThinItalic.ttf": "e0e8df064ed52d72d70f586f36cee7f7",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-ExtraLight.ttf": "34216e1124b11af7747ecc363ee3504b",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-Medium.ttf": "9200bf1d80f2f4947b496a2e6ab2e224",
"assets/google_fonts/JetBrains_Mono/JetBrainsMono-BoldItalic.ttf": "7bef26e508e26a73412f3430432b8d79",
"assets/google_fonts/Inter/Inter-Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/google_fonts/Inter/Inter-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/google_fonts/Inter/Inter-ExtraLightItalic.ttf": "24df6449633144fa3f4258c775dd67c5",
"assets/google_fonts/Inter/Inter-VariableFont_opsz,wght.ttf": "0a77e23a8fdbe6caefd53cb04c26fabc",
"assets/google_fonts/Inter/Inter-SemiBoldItalic.ttf": "0f93bef7d8e8ea0612ba37a71efcccff",
"assets/google_fonts/Inter/Inter-Thin.ttf": "6f2d2f41f504aee66da88684f15d7e1d",
"assets/google_fonts/Inter/Inter-Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/google_fonts/Inter/Inter-Italic-VariableFont_opsz,wght.ttf": "6dce17792107f0321537c2f1e9f12866",
"assets/google_fonts/Inter/Inter-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/google_fonts/Inter/Inter-LightItalic.ttf": "6eb3a2d2c6f095080ac034867886d0bf",
"assets/google_fonts/Inter/Inter-ExtraBold.ttf": "a6ed481bff60bc9270904d214947ab13",
"assets/google_fonts/Inter/Inter-ThinItalic.ttf": "95d83862ccec5b0d0487f243e34fcc61",
"assets/google_fonts/Inter/OFL.txt": "52ccfed416a51baada9fe06010a9138d",
"assets/google_fonts/Inter/Inter-ExtraLight.ttf": "2c6c78d98816958b53fea58451f921d3",
"assets/google_fonts/Inter/Inter-BoldItalic.ttf": "66469edaf106f7a1e14f4061212a1123",
"assets/google_fonts/Inter/Inter-ExtraBoldItalic.ttf": "b03bfa9ceab3df1f81834d0523331c30",
"assets/google_fonts/Inter/README.txt": "2eb02df8302bb304049248d429f3b790",
"assets/google_fonts/Inter/Inter-MediumItalic.ttf": "c64a8c393f4d6ffd87f80723727b7f2c",
"assets/google_fonts/Inter/Inter-Black.ttf": "b797a429ef21b9b7d44b96038cdb10f2",
"assets/google_fonts/Inter/Inter-Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/google_fonts/Inter/Inter-BlackItalic.ttf": "6a6d7edd78447c5edcb33570ce97efe8",
"assets/google_fonts/Inter/Inter-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/google_fonts/Manrope/Manrope-VariableFont_wght.ttf": "cf98436d65175c509540014c3189fbc6",
"assets/google_fonts/Manrope/Manrope-Medium.ttf": "aa9897f9fa37c84d7b9d3d05a8a6bc07",
"assets/google_fonts/Manrope/Manrope-SemiBold.ttf": "4410f0d144bea752f9bfb5f33909e0c5",
"assets/google_fonts/Manrope/Manrope-ExtraBold.ttf": "8541582abce817ab8857c51ae0a35ca9",
"assets/google_fonts/Manrope/OFL.txt": "35f07270685c643d36c1111a117fb968",
"assets/google_fonts/Manrope/Manrope-Regular.ttf": "f8105661cf5923464f0db8290746d2f9",
"assets/google_fonts/Manrope/README.txt": "e1d93eb4c9685bb646127d6b4612975b",
"assets/google_fonts/Manrope/Manrope-ExtraLight.ttf": "100308b8ce2da4b67f4850e9b9252b26",
"assets/google_fonts/Manrope/Manrope-Light.ttf": "9e353f65739cc41a37bed272850cf92e",
"assets/google_fonts/Manrope/Manrope-Bold.ttf": "69258532ce99ef9abf8220e0276fff04",
"assets/google_fonts/Raleway/Raleway-BoldItalic.ttf": "9b2fd35772aa95d64c88d655a53a1715",
"assets/google_fonts/Raleway/Raleway-MediumItalic.ttf": "d6065512496d659bed12898032ea8729",
"assets/google_fonts/Raleway/Raleway-ThinItalic.ttf": "fe397b9bebda4ab94ed5f5af6c924551",
"assets/google_fonts/Raleway/Raleway-ExtraLight.ttf": "62b913f174cc545320b160b3a64dc6bb",
"assets/google_fonts/Raleway/Raleway-Medium.ttf": "28ea37f0eb58c57e01eed0b06fc359d6",
"assets/google_fonts/Raleway/Raleway-SemiBold.ttf": "66c9748f1e4aae2e764d5c50c05f7841",
"assets/google_fonts/Raleway/Raleway-ExtraBold.ttf": "4e37fffb940ad5e5b9b96f59079e2014",
"assets/google_fonts/Raleway/Raleway-ExtraBoldItalic.ttf": "f565acb98bdb33a03052d73c88fe217a",
"assets/google_fonts/Raleway/Raleway-Regular.ttf": "6310192cd2011f527e18b1586a1245c8",
"assets/google_fonts/Raleway/Raleway-ExtraLightItalic.ttf": "429362d36a625285ba2e28b864e3c834",
"assets/google_fonts/Raleway/Raleway-SemiBoldItalic.ttf": "26c32288806ad88dffc2bbe30dc6f4f3",
"assets/google_fonts/Raleway/Raleway-Italic-VariableFont_wght.ttf": "a454a97a31574945baa438773b6738a0",
"assets/google_fonts/Raleway/Raleway-Light.ttf": "1aa2abd0c1ee7d067e6df27f82f1f0b2",
"assets/google_fonts/Raleway/Raleway-Black.ttf": "0560c808e614a5550655e58cf7ff4ed7",
"assets/google_fonts/Raleway/OFL.txt": "ea4dda4afbf1ca126eee751a7a868628",
"assets/google_fonts/Raleway/Raleway-BlackItalic.ttf": "432ddc1df57eb5a56dd2d18fca2d064e",
"assets/google_fonts/Raleway/Raleway-VariableFont_wght.ttf": "029b34594de6218e9aaa8b95854f30fe",
"assets/google_fonts/Raleway/README.txt": "dd091a123f421fef10a19dc07c83e8de",
"assets/google_fonts/Raleway/Raleway-LightItalic.ttf": "f3c1507fc3d8231fa7011d827acd214b",
"assets/google_fonts/Raleway/Raleway-Thin.ttf": "d10da33944a69e7951077d2e9c1fdd16",
"assets/google_fonts/Raleway/Raleway-Italic.ttf": "1d1c86fde9011633aa535eaaaef72a17",
"assets/google_fonts/Raleway/Raleway-Bold.ttf": "9aefa157ae4a8f7ff923dd88cee3917f",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
