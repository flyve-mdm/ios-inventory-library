self.addEventListener('install', function(e) { 
  
   
    
  var CACHE_NAME = 'ios-inventory-version-8'

  caches.keys().then(function(cacheNames) {
    return Promise.all(
      cacheNames.map(function(cacheName) {
        if(cacheName != CACHE_NAME) {
          return caches.delete(cacheName)
        }
      })
    )
  })
  
  e.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      return cache.addAll([
        '/flyve-mdm-ios-inventory/',
        '/flyve-mdm-ios-inventory/?homescreen=1',
        '/flyve-mdm-ios-inventory/index.html',
        '/flyve-mdm-ios-inventory/index.html?homescreen=1',
        '/flyve-mdm-ios-inventory/css/flyve-mdm.min.css',
        '/flyve-mdm-ios-inventory/css/main.css',
        '/flyve-mdm-ios-inventory/css/syntax.css',
        '/flyve-mdm-ios-inventory/images/typo.png',
        '/flyve-mdm-ios-inventory/images/ipodTouch.png',
        '/flyve-mdm-ios-inventory/images/ipad.png',
        '/flyve-mdm-ios-inventory/images/IPhone6.png',
        '/flyve-mdm-ios-inventory/images/logo.png',
        '/flyve-mdm-ios-inventory/js/app.js',
        '/flyve-mdm-ios-inventory/js/jquery.min.js',
        '/flyve-mdm-ios-inventory/js/bootstrap.min.js',
        '/flyve-mdm-ios-inventory/manifest.json',
        '/flyve-mdm-ios-inventory/fonts/glyphs/winjs-symbols.ttf',
        '/flyve-mdm-ios-inventory/fonts/selawk.ttf',
      ])
    })
  )
})

self.addEventListener('fetch', function(event) {
  console.log(event.request.url)
  event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request)
    })
  )
})