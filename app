const axios = require('axios');
const bodyParser = require('body-parser');
var cors = require('cors');
var express = require('express')
var app = express()
var alert = require('alert-node')
app.use(cors());
app.use(bodyParser.json());
const port = 3000

var entries = 0;
var blackList = [];

const url = "https://www.rescuetime.com/anapi/data?key=B630_Jm8_rHPEnkQuCb0bhyXlNOtjhpqtjucq72K&perspective=interval&interval=minute&restrict_begin=2020-01-19&restrict_end=2020-01-19&format=json";

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))

var inputArray = [];
function test(){
  axios.get(url)
  .then(function (response) {
    // handle success
    for (var i = entries; i<response.data.rows.length;i++){
      console.log(response.data.rows[i][3]);
      for(var w = 0; w < inputArray.length; w++)
      {
        if(response.data.rows[i][3].indexOf(inputArray[w])!==-1)
        {
          alert('Wait..stop being distracted');
        }
      }
    }
     entries = response.data.rows.length;
  })
}
app.post('/updateBlackList', function (req, res) {
  console.log(req.body); // inputArray
  inputArray.push(req.body);
  res.send('POST request to the homepage');
})
 setInterval(test,3000);
