<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->load->language('common/home');

		$data['text_collection'] = $this->language->get('text_collection');
		$data['text_about'] = $this->language->get('text_about');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_oldcollection'] = $this->language->get('text_oldcollection');
		$data['text_logout'] = $this->language->get('text_logout');

		$this->load->model('catalog/category');
		$this->load->model('tool/image');

		$categories = $this->model_catalog_category->getActiveCollections();
		$category = $categories[0];
		$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));

		$data['category'] = array(
			'name'  => $category['name'],
			'image' => $image,
			'href'  => $this->url->link('product/category', 'path=' . $category['category_id'])
		);

		$data['logged'] = $this->customer->isLogged();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}