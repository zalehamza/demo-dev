const express = require("express");
const app = express();
const PORT = 3000

app.get("/", (req,res) => {
    
    res.send("Application is running")
})

app.listen(PORT, ()=>{
    console.log(`Web server is listening at port ${PORT}`)
})

