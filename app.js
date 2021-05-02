//mongodb+srv://jose:<password>@cluster0.ja2ie.mongodb.net/myFirstDatabase?retryWrites=true&w=majority
var http = require('http'), //This module provides the HTTP server functionalities
    path = require('path'), //The path module provides utilities for working with file and directory paths
    express = require('express'), //This module allows this app to respond to HTTP Requests, defines the routing and renders back the required content
    fs = require('fs'), //This module allows to work witht the file system: read and write files back
    xmlParse = require('xslt-processor').xmlParse, //This module allows us to work with XML files
    xsltProcess = require('xslt-processor').xsltProcess, //The same module allows us to utilise XSL Transformations
    xml2js = require('xml2js'); //This module does XML to JSON conversion and also allows us to get from JSON back to XML
    logger = require('morgan');
    cors = require('cors');
    bodyParser = require('body-parser');
    mongoose = require('mongoose');
    dotenv = require("dotenv");

    dotenv.config();

    const dbURI = process.env.MONGODB_URL


mongoose.connect(dbURI, { useNewUrlParser: true, useUnifiedTopology: true })

        .then((result) => console.log('connected to db'))
        .catch((err) => console.log(err));

var Book = require('./bookmodel');
    
var router = express(); //We set our routing to be handled by Express
var server = http.createServer(router); //This is where our server gets created

router.use(logger('tiny'));

router.use(express.static(path.resolve(__dirname, 'views'))); //We define the views folder as the one where all static content will be served
router.use(express.urlencoded({extended: true})); //We allow the data sent from the client to be coming in as part of the URL in GET and POST requests
router.use(express.json()); //We include support for JSON that is coming from the client

// Function to read in XML file and convert it to JSON
function xmlFileToJs(filename, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  fs.readFile(filepath, 'utf8', function(err, xmlStr) {
    if (err) throw (err);
    xml2js.parseString(xmlStr, {}, cb);
  });
}

//Function to convert JSON to XML and save it
function jsToXmlFile(filename, obj, cb) {
  var filepath = path.normalize(path.join(__dirname, filename));
  var builder = new xml2js.Builder();
  var xml = builder.buildObject(obj);
  fs.unlinkSync(filepath);
  fs.writeFile(filepath, xml, cb);
}

router.get('/', function(req, res) {
  res.render('index');

});

router.get('/get/html', function(req, res) {

    // res.writeHead(200, {'Content-Type': 'text/html'}); //We are responding to the client that the content served back is HTML and the it exists (code 200)

    // var xml = fs.readFileSync('PaddysCafe.xml', 'utf8'); //We are reading in the XML file
    // var xsl = fs.readFileSync('PaddysCafe.xsl', 'utf8'); //We are reading in the XSL file

    // var doc = xmlParse(xml); //Parsing our XML file
    // var stylesheet = xmlParse(xsl); //Parsing our XSL file

    // var result = xsltProcess(doc, stylesheet); //This does our XSL Transformation

    // res.end(result.toString()); //Send the result back to the user, but convert to type string first

    Book.find({}, function (err, books) {

      html = `
          <table id="menuTable" border="1" class="indent">
            <thead>
                <tr>
                    <th colspan="3">Book Catalogue</th>
                </tr>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            `;
            books.forEach(element => {
              html += `
              <xsl:for-each select="entree">
                  <tr id="{`+element._id+`}">
                      <td>
                        <span>`+element.title+`</span>
                      </td>
                      <td align="right">
                          <span>`+element.price+`</span>
                      </td>
                      <td align="center">
                        <button type="button" onclick="deletebook('`+element._id+`')">Delete</button>
                      </td>
                  </tr>
              </xsl:for-each>
              `
            });
              
            
      html += `</tbody>
        </table>
      `;

      //console.log("test");
      //console.log(books); 
      res.json(html);
    }); 

});

router.post('/post/json', function (req, res) {

    // function appendJSON(obj) {

    //     console.log(obj)

    //     xmlFileToJs('PaddysCafe.xml', function (err, result) {
    //         if (err) throw (err);
            
    //         result.cafemenu.section[obj.sec_n].entree.push({'item': obj.item, 'price': obj.price});

    //         console.log(JSON.stringify(result, null, "  "));

    //         jsToXmlFile('PaddysCafe.xml', result, function(err){
    //             if (err) console.log(err);
    //         });
    //     });
    // };

    
      var newbook = new Book({title: req.body.item, category:req.body.sec_n, price:req.body.price});
          newbook.save(function (err, book) {
              //res.json(book);
              res.redirect('back'); 
      });

    //console.log(req.body);
    //appendJSON(req.body);

    //res.redirect('back');

});

router.post('/post/delete', function (req, res) {

    Book.findByIdAndRemove({_id: req.body.id}, function (err, users) {
      if (err) {
        res.status(400).json(err); 
      } 
      res.json(users);
    }); 

    // function deleteJSON(obj) {

    //     console.log(obj)

    //     xmlFileToJs('PaddysCafe.xml', function (err, result) {
    //         if (err) throw (err);
            
    //         delete result.cafemenu.section[obj.section].entree[obj.entree];

    //         console.log(JSON.stringify(result, null, "  "));

    //         jsToXmlFile('PaddysCafe.xml', result, function(err){
    //             if (err) console.log(err);
    //         });
    //     });
    // };

    //deleteJSON(req.body);
    // console.log(req.body);
    // res.redirect('back');

});

server.listen(process.env.PORT || 3001, process.env.IP || "0.0.0.0", function () {
    var addr = server.address();
    console.log("Server listnening at", addr.address + ":" + addr.port);
});

router.post('/hello', (req, res) => {
    res.json({result: 'Post was sent', data: req.body});
});

