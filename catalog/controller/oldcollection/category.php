<?php
class ControllerOldCollectionCategory extends Controller {
	public function index() {
		$data = array();

        $this->load->language('oldcollection/category');

        $this->load->model('catalog/category');
        $this->load->model('tool/image');
        /** ModelCatalogCategory $this->model_catalog_category */
        $categories = $this->model_catalog_category->getActiveCollections();
        unset($categories[0]);

        $data['heading_title'] = $this->language->get('text_error');

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('previous_collections_title'),
            'href' => $_SERVER['REQUEST_URI']
        );

        $data['categories'] = array();

        foreach ($categories as $category) {
            $category_info = $this->model_catalog_category->getCategory($category['category_id']);
            if ($category_info) {
                $url = '';

                if (isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                if ($category_info['image']) {
                    $image = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                }

                $data['categories'][] = array(
                    'name' => $category_info['name'],
                    'href' => $this->url->link('product/category', 'path=' . $category_info['category_id'] . $url),
                    'thumb' => $image
                );
            }
        }

        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/oldcollection/category.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/oldcollection/category.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/oldcollection/category.tpl', $data));
        }
	}
}