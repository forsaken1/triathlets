doctype html
html
  head
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    title Dashboard
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"

  body    
    div.container.wide
      div.row
        div.col-sm-12.main
          == content

    script src="/javascripts/bundle.js"
