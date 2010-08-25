<html>
<head>
  <title><g:layoutTitle default="Grails"/></title>
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'print.css')}" media="print"/>
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'screen.css')}" media="screen, projection"/>
  <!--[if lt IE 8]>
        <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'ie.css')}" media="screen, projection"/>
        <![endif]-->
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'application.css')}"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <g:layoutHead/>
  <g:javascript library="application"/>
</head>
<body>

<div class="container">
  <div id="spinner" style="display:none;">
    <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
  </div>
  <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" border="0"/></a></div>
  <g:layoutBody/>
</div>
</body>
</html>