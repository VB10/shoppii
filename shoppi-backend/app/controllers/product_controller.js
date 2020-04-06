var express = require('express');
var router = express.Router();
var Joi = require('joi');
const Product = require('../models/product');
const httpStatusCode = require('http-status-codes');


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
    const data = req.body;
    const schema = joiProductSchema();

    console.log(req.body);
    Joi.validate(data, schema, (err, _) => {
        if (err) {
            return res.status(httpStatusCode.NOT_ACCEPTABLE).json({
                status: 'error',
                message: 'Invalid request data',
                data: data
            });
        } else {
            const product = new Product(data);
            product.save((err, data) => {
                if (err) {
                    return res.status(httpStatusCode.NOT_ACCEPTABLE).json({
                        status: 'error',
                        message: err.message,
                    });
                } else {
                    return res.status(httpStatusCode.ACCEPTED).json(product)
                }
            });
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

function joiProductSchema() {
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