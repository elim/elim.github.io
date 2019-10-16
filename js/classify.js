(function() {
  var ua = navigator.appVersion.toLowerCase()
  var matches = ua.match(/(?:android|mac|iphone|ipad|win)/)

  if (! matches) return

  document.documentElement.dataset['os'] = matches[0]

  if (matches[0].match(/(?:mac|iphone|ipad)/)) {
    document.documentElement.dataset['font'] = 'apple-system'
  }
})()
