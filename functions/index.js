const { onCall, onRequest } = require("firebase-functions/v2/https");

exports.toUpperCase = onCall((request) => {
    return request.data.toUpperCase();
});

exports.toLowerCase = onRequest((request, result) => {
    result.status(200).send(request.body.toString().toLowerCase());
});