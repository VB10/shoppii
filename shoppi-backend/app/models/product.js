const mongoose = require('mongoose'); // Erase if already required

// Declare the Schema of the Mongo model
var productSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        unique: true,
        index: true,
    },
    image: {
        type: String,
        required: true,
        index: true,
    },
    price: {
        type: Number,
        required: true,
        index: true,
    },
    weight: {
        type: Number,
        required: true,
        index: true,
        default: 500
    },
    total: {
        type: Number,
        required: true,
        index: true,
    },
});

//Export the model
module.exports = mongoose.model('Product', productSchema);