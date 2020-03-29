var express = require('express');
var router = express.Router();
var Joi = require('joi');
const Product = require('../models/product');


const productPath = "/product";
router.get(productPath, (req, res) => {
    Product.find((err, products) => {
        if (err) {
            return res.send(err);
        } else {
            return res.json(products);
        }
    })
});


router.post(productPath, (req, res) => {

    Joi.validate(data, schema, (err, _) => {
        const data = req.body;
        if (err) {
            // send a 422 error response if validation fails
            return res.status(httpStatusCode.NOT_ACCEPTABLE).json({
                status: 'error',
                message: 'Invalid request data',
                data: data
            });
        } else {
            const product = new Product(data);
            product.save();
            return res.status(httpStatusCode.ACCEPTED).json(product)
        }
    });
});

const updateProduct = async (item) => {
    const product = JSON.parse(item);

    const data = await Product.findById(product.model._id);

    if (!data) {
        return false;
    } else {
        data.price = product.model.price;
        data.total = product.model.total;
        data.save();
        return true;

    }
}

async function fun1(req, res) {
    let response = await request.get('http://localhost:3000');
    if (response.err) {
        console.log('error');
    } else {
        console.log('fetched response');
    }
}

function joiProductSchema() {
    const data = req.body;
    const schema = Joi.object().keys({
        id: Joi.any(),
        title: Joi.string()
            .min(3)
            .max(40)
            .required(),
        image: Joi.string()
            .min(3)
            .max(200)
            .required(),
        weight: Joi.number().min(0),
        total: Joi.number().min(10),
        price: Joi.number().min(4)
    });
    return schema;
}

module.exports = {
    router,
    updateProduct
};
// module.exports = updateProduct;