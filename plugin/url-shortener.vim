" Shorten URLs
" Author: Bohr Shaw <pubohr@gmail.com>

command! -nargs=1 URLShorten call s:shorten(<q-args>)

" References: http://is.gd/apishorteningreference.php
" Todo: Support a user specified short URL instead of a random one.
let s:api_isgd = 'http://is.gd/create.php?format=json&url='
" References: http://open.weibo.com/wiki/2/short_url/shorten
let s:api_sina = 'https://api.weibo.com/2/short_url/shorten.json?source=2603250270&url_long='

function! s:shorten(url)
  let url = a:url =~ '^http' ? a:url : 'http://'.a:url
  let result = webapi#http#get(s:api_isgd.webapi#http#encodeURI(url))
  let url_short = eval(result.content).shorturl
  let @+ = url_short
  echon url_short.' has been copied to your clipboard.'
endfunction
