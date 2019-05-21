doctype html
html
  head
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"

    title Triathlets

    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    link rel="stylesheet" href="/stylesheets/main.css"

  body
    div.masthead
      div.container
        nav.nav
          == render_template "layouts/_nav.slang"
    div.container.wide
      div.row
      - flash.each do |key, value|
        div class="alert alert-#{ key }"
          p = flash[key]
      div.row
        div.col-sm-12.main
          == content

    script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
    script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
    script src="https://use.fontawesome.com/b4153aa4cc.js"

    /! Yandex.Metrika counter
    javascript:
      (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter46577298 = new Ya.Metrika({ id:46577298, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks");
    noscript
      div
        img alt="" src="https://mc.yandex.ru/watch/46577298" style="position:absolute; left:-9999px;"
    /! /Yandex.Metrika counter
