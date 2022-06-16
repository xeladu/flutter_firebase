const functions = require("firebase-functions");

exports.toUpperCase = functions.https.onCall((data, _) => {
    return data.toString().toUpperCase();
});

exports.toLowerCase = functions.https.onRequest((request, result) => {
    result.status(200).send(request.body.toString().toLowerCase());
});