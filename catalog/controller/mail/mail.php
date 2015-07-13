<?php
class ControllerMailMail extends Controller {
	public function index() {
		$message = array();

		$this->load->language('mail/callback');

		$message['ok'] = $this->language->get('text_ok');
		$message['error'] = $this->language->get('text_error');

		$this->load->library('mail');

        $mail = new Mail();

        if (isset($this->request->post['phone'])) {
            $phone = $this->request->post['phone'];
        }

        if ($phone) {
        	$mail->setSender($phone);
        	$mail->setSubject('Обратный звонок');
        	$mail->setTo($this->config->get('config_email'));
	        $mail->setFrom($this->config->get('config_email'));

	        $html = 'Пререзвоните мне на номер - ' .$phone;
	        $mail->setHtml($html);

	        if (!$mail->send()) {
	            echo json_encode(array(
	            	'data' => $message['ok'],
	            	'status' => 'ok'
	            ));
	        } else {
	            echo json_encode(array(
	            	'data' => $message['error'],
	            	'status' => 'error'
	            ));
	        }
        }
	}
}