const express = require('express')
const client = require('prom-client')

// Create a Registry which registers the metrics
const register = new client.Registry()

// Add a default label which is added to all metrics
register.setDefaultLabels({
  app: 'example-nodejs-app'
})

// Enable the collection of default metrics
client.collectDefaultMetrics({ register })

let app = express();

app.use(express.static("."));

app.get("/", (req,res)=>{
    res.sendFile(__dirname + '/index.html')
})
app.get("/metrics", (req,res)=>{
    res.header("content-type", register.contentType)
    register.metrics().then(x => res.status(200).send(x)).catch(console.log)
})

app.listen("8081", ()=>{
    console.log("Server is listening on port 8081")
})
