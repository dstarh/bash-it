cite about-plugin
about-plugin 'alias "http" to SimpleHTTPServer'

if [ $(uname) = "Linux" ]
then
  alias http='python2 -m SimpleHTTPServer 9000'
else
  alias http='python -m SimpleHTTPServer 9000'
fi

