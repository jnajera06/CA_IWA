var mongoose = require('mongoose');

var bookSchema = new mongoose.Schema({
    title: String,
    category: String,
    price: Number 
}
);

module.exports = mongoose.model('book', bookSchema);