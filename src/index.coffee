

http = require('http')
iconv = require('iconv-lite')

class window

  @parse: (ct) ->
    ct

parse = window.parse

class FindIP

  API_URL = "http://whois.pconline.com.cn/ipJson.jsp"

  find: (ip, callback) ->

    ret = ''

    http.get "#{API_URL}?ip=#{ip}&callback=parse", (res) ->
      res.setEncoding('binary')
      res.on 'data', (chunk) ->
        ret += chunk
      res.on 'end', ->
        buf = new Buffer(ret,'binary')
        ret = iconv.decode(ret, 'GBK')
        callback(null, eval(ret))
    .on 'error', (e) ->
      callback(e)


findIP = new FindIP
module.exports = findIP
