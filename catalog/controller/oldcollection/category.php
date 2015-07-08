<?php
class ControllerOldCollectionCategory extends Controller {
	public function index() {
		$data = array();

        $this->load->model('catalog/category');
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

                $category_info['href'] = $this->url->link('previous-collections', 'path=' . $category_info['category_id'] . $url);
            }
            $data['categories'][] = $category_info;
        }


        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/oldcollection/collection.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/oldcollection/category.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/oldcollection/category.tpl', $data));
        }
	}
}