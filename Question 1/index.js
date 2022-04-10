const express = require('express');
const app = express();
const TestRoute = require('./routes/TestRoute');

app.use('/',TestRoute);



const PORT = process.env.PORT || 5000;

app.listen(PORT,()=>{
    console.log(`Server is ready at ${PORT}`);
});