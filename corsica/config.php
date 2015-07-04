<?php

class CorsicaConfig
{
    const PRODUCT_OPTION_SIZE_ID = 11;
    const PRODUCT_OPTION_COLOR_ID = 1;

    static public $productOptionColorMap = array(
        49 => 'white',
        43 => 'gold',
        31 => 'red',
        32 => 'black'
    );

    static public $productOptionSizeMap = array(
        '40' => array('XS', 34, 40),
        '42' => array('XS', 36, 42),
        '44' => array('S',  38, 44),
        '46' => array('S',  40, 46),
        '48' => array('M',  42, 48),
        '50' => array('M',  44, 50),
        '52' => array('L',  46, 52)
    );

    const CUSTOMER_GROUP_GUEST = 0;
    const CUSTOMER_GROUP_BUYER = 1;
    const CUSTOMER_GROUP_USER  = 2;

    const CATEGORY_COLLECTION_ROOT_ID = 61;
    const CATEGORY_SHOP_ROOT_ID = 60;

    const CUSTOMER_SHOW_COLLECTION_PRICE_ID = 1;
    const CUSTOMER_SHOW_COLLECTION_PRICE_YES_ID = 1;
    const CUSTOMER_SHOW_COLLECTION_PRICE_NO_ID = 2;

    static public $acl = array(
        CorsicaConfig::CUSTOMER_GROUP_GUEST => array(
            array(
                'resource' => array('area' => 'collection'),
                'permissions' => array()
            )
        ),
        CorsicaConfig::CUSTOMER_GROUP_USER => array(
            array(
                'resource' => array('area' => 'collection'),
                'permissions' => array()
            )
        ),
        CorsicaConfig::CUSTOMER_GROUP_BUYER => array(
        )
    );
}

