// Creat server
const express = require("express")

// Instance
const app = express();

app.use(express.static('public'));

// Render
app.set('view engine', 'ejs');

// Creat router
app.get("/", function (req, res) {
  res.render("index")
})

app.get("/sobre", function (req, res) {
  res.render("about")
})

// Listen port
app.listen(8080);
console.log("Rodando");