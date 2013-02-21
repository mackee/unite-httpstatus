" httpstatus for unite.vim
" Version:     0.0.1
" Last Change: 21 Feb 2013
" Author:      macopy <macopy123 at gmail.com>
" Licence:     The MIT License {{{
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.
" }}}

let s:save_cpo = &cpo
set cpo&vim

" define source
function! unite#sources#httpstatus#define()
    return s:source
endfunction


" cache
let s:cache = []
function! unite#sources#httpstatus#refresh()
    let s:cache = []
endfunction

" source
let s:source = {
\   'name': 'httpstatus',
\}
function! s:source.gather_candidates(args, context)
    let list = [
\       "100 - Continue",
\       "101 - Switching Protocols",
\       "102 - Processing",
\       "200 - OK",
\       "201 - Created",
\       "202 - Accepted",
\       "203 - Non-Authoritative Information",
\       "204 - No Content",
\       "205 - Reset Content",
\       "206 - Partial Content",
\       "207 - Multi-Status",
\       "208 - Already Reported",
\       "300 - Multiple Choices",
\       "301 - Moved Permanently",
\       "302 - Found",
\       "303 - See Other",
\       "304 - Not Modified",
\       "305 - Use Proxy",
\       "307 - Temporary Redirect",
\       "400 - Bad Request",
\       "401 - Unauthorized",
\       "402 - Payment Required",
\       "403 - Forbidden",
\       "404 - Not Found",
\       "405 - Method Not Allowed",
\       "406 - Not Acceptable",
\       "407 - Proxy Authentication Required",
\       "408 - Request Timeout",
\       "409 - Conflict",
\       "410 - Gone",
\       "411 - Length Required",
\       "412 - Precondition Failed",
\       "413 - Request Entity Too Large",
\       "414 - Request-URI Too Large",
\       "415 - Unsupported Media Type",
\       "416 - Request Range Not Satisfiable",
\       "417 - Expectation Failed",
\       "418 - I\m a teapot",
\       "422 - Unprocessable Entity",
\       "423 - Locked",
\       "424 - Failed Dependency",
\       "425 - No code",
\       "426 - Upgrade Required",
\       "428 - Precondition Required",
\       "429 - Too Many Requests",
\       "431 - Request Header Fields Too Large",
\       "449 - Retry with",
\       "500 - Internal Server Error",
\       "501 - Not Implemented",
\       "502 - Bad Gateway",
\       "503 - Service Unavailable",
\       "504 - Gateway Timeout",
\       "505 - HTTP Version Not Supported",
\       "506 - Variant Also Negotiates",
\       "507 - Insufficient Storage",
\       "509 - Bandwidth Limit Exceeded",
\       "510 - Not Extended",
\       "511 - Network Authentication Required",
\   ]
    return map(list, '{
        \ "word": v:val,
        \ "source": "httpstatus",
        \ "kind": "dictionary",
        \ "action__path": v:val[stridx(v:val, "=")+1 : -1],
        \ }')
endfunction

let &cpo = s:save_cpo
