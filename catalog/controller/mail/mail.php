<?php
class ControllerMailMail extends Controller {
	public function index() {
		$message = array();

		$this->load->language('mail/callback');

		$message['ok'] = $this->language->get('text_ok');
		$message['error'] = $this->language->get('text_error');

		$this->load->library('mail');

		if (isset($this->request->post['subject'])) {
			$subject = $this->request->post['subject'];
		} else {
			$subject = 'Обратный звонок';
		}

		if (isset($this->request->post['name'])) {
            $phone = $this->request->post['name'];
        }

        if (isset($this->request->post['phone'])) {
            $phone = $this->request->post['phone'];
        }

        if ($phone) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        	$mail->setSender($this->config->get('config_email'));
        	$mail->setSubject($subject);
        	$mail->setTo($this->config->get('config_email'));
	        $mail->setFrom($this->config->get('config_email'));

	        if ($subject == 'Обратный звонок') {
	        	$text = 'Пререзвоните мне на номер - ' . $phone;
	        } else {
	        	$text = 'Я бы хотел оформить заказ. Мои контактные данные:\n';
	        	$text = 'Имя - ' . $name . '\n';
	        	$text .= 'Контактный телефон - ' . $phone .'\n';
	        }

	        $mail->setText($text);

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