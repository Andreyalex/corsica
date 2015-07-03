<?php
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

        switch ($area) {
            case 'collection':
                $rootCatId = CorsicaConfig::CATEGORY_COLLECTION_ROOT_ID;
                break;
            default:
                $rootCatId = CorsicaConfig::CATEGORY_SHOP_ROOT_ID;
        }

        // Check if trying to view product
        if (isset($container['product_id'])) {
            $this->load->model('catalog/product');
            $product = $this->model_catalog_product->getProduct($container['product_id'], true);
            $this->load->model('catalog/category');
            $category = $this->model_catalog_category->getCategory($product['categories'][0]['category_id'], true);
            if ($category['path'][0]['path_id'] != $rootCatId) {
                $this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
            }
        // Check if trying to view category
        } elseif (isset($container['path'])) {
            $this->load->model('catalog/category');
            $category = $this->model_catalog_category->getCategory($container['path'], true);
            if ($category['path'][0]['path_id'] != $rootCatId) {
                $this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
            }
        }
    }
}