<?php
class ControllerMailMail extends Controller {
	public function index() {
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
	            echo json_encode("Мы скоро свяжимся с Вами!");
	            die;
	        } else {
	            echo json_encode("Произошла ошибка!");
	            die;
	        }
        }
	}
}