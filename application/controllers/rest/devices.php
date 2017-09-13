<?php

require_once(APPPATH . '/libraries/REST_Controller.php');

class Devices extends REST_Controller {

   

    function add_post() {

        $data = $this->post();
        if ($data == null) {
            $this->response(array('error' => true, 'message' => 'invalid_json'));
        }

        if (!array_key_exists('UserId', $data)) {
            $this->response(array('error' => true, 'message' => 'require UserId'));
        }

        if (!array_key_exists('DeviceTypeId', $data)) {
            $this->response(array('error' => true, 'message' => 'require DeviceTypeId'));
        }

        if (!array_key_exists('DeviceToken', $data)) {
            $this->response(array('error' => true, 'message' => 'require DeviceToken'));
        }

        $user_data = array(
            'UserId' => $data['UserId'],
            'DeviceTypeId' => $data['DeviceTypeId'],
            'DeviceToken' => $data['DeviceToken'],
        );

        if ($this->user_device->exists($user_data)) {
            $this->response(array('error' => true, 'message' => 'email_exist'));
        } else {
            $this->user_device->save($user_data);

            $this->response(array('error' => false, 'user' => $user_data));
        }
    }

}

?>