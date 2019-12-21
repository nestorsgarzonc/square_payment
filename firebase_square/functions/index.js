const functions = require('firebase-functions');
exports.nonce=function.https.onRequest(async(req, res)=>{
    return res.statusCode(200).json('Bearer EAAAEMX5NYyuIIRSJutuPb0dyD5acCsyK527VVwiH5XNBBkryTHfm1aVZFLRFniS');
})