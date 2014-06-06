
fip = require('../lib')

fip.find('61.235.82.163', function (err, ret) {
  console.log(err, ret);
})
