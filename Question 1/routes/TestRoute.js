const express = require('express');
const router = express.Router();

router.route('/').get((req,res) => {
    res.json({
        greeting: 'Hello World'
    });
});


module.exports = router;