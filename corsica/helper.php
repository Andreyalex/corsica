<?php

class CorsicaHelper
{
    static public $fields = array(
        'lastname' => null,
        'company' => null,
        'address_1' => null,
        'address_2' => null,
        'postcode' => null,
        'country_id' => null,
        'zone_id' => null,
        'fax' => null,
        'city' => null
    );

    static public $errors = array(
        'lastname' => null,
        'company' => null,
        'address_1' => null,
        'address_2' => null,
        'postcode' => null,
        'country' => null,
        'zone' => null,
        'custom_field1' => null,
        'fax' => null,
        'city' => null
    );

    static public function addAbsentCustomerFields(&$request)
    {
        foreach (self::$fields as $key => $value) {
            if (!isset($request->post[$key])) {
                $request->post[$key] = $value;
            }
        }
    }
    static public function suppressErrorsOFAbsentCustomerFields(&$errorArray)
    {
        foreach (self::$errors as $key => $value) {
            if (isset($errorArray['error'][$key])) {
                unset($errorArray['error'][$key]);
            }
        }

        if (empty($errorArray['error'])) {
            unset($errorArray['error']);
        }
    }
}

