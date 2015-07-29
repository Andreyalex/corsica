<?php

/**
 * @property Request $request
 * @property Response $response
 * @property Language $language
 * @property Customer $customer
 * @property Url $url
 * @property Loader $load
 * @property Config $config
 * @property Session $session
 * @property Cart $cart
 */
abstract class Controller {
	protected $registry;

	public function __construct($registry) {
		$this->registry = $registry;
	}

	public function __get($key) {
		return $this->registry->get($key);
	}

	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}

    public function checkAccess($resource)
    {
        // Check if user is granted to access the resource
        $acl = new CorsicaAcl($this->registry);
        if (!$acl->isAuthorized($this->customer->getGroupId(), $resource, 'view')) {
            $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        }
    }

    public function checkAsset($area)
    {
        $container = $this->request->server['REQUEST_METHOD'] == 'POST'?
            $this->request->post : $this->request->get;

        // Check if trying to view product
        if (isset($container['product_id'])) {
            $this->load->model('catalog/product');
            $product = $this->model_catalog_product->getProduct($container['product_id'], true);
            $categories = $product['categories'];
        // Check if trying to view category
        } elseif (isset($container['path'])) {
            $categories = array(array('category_id' => $container['path']));
        }

        $this->load->model('catalog/category');
        foreach($categories as $category) {
            $category = $this->model_catalog_category->getCategory($category['category_id'], true);

            $assetArea = $this->isWholesaleArea($category['category_id'])?
                'wholesale' : 'shop';

            if ($area == $assetArea) {
                return true;
            }
        }
        $this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
    }

    public function isWholesaleArea($categoryId)
    {
        $this->load->model('catalog/category');
        $categories = $this->model_catalog_category->getActiveCollections();
        return $categoryId == $categories[0]['category_id'];
    }
}