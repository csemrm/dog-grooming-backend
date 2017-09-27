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

    function send_get() {
        $data = [];
        $appuser_id = $this->get('appuser_id');
        $DeviceTypeId = $this->get('DeviceTypeId');
        $push = array('mtitle' => 'Woodlesapp', 'mdesc' => 'THis is test message');

        if ($appuser_id && $DeviceTypeId) {
            $devicescount = $this->user_device->count_all_by($appuser_id, $DeviceTypeId);
            if ($devicescount) {
                $devices = $this->user_device->get_all_by($appuser_id, $DeviceTypeId)->result();

                foreach ($devices as $key => $device) {
                    $data[$key] = ($this->PushNotifications->android($push, $device->DeviceToken));
                }

                $this->response(array('notifications' => $data, 'success' => true));
            }
        } else if ($appuser_id) {
            $devicescount = $this->user_device->count_all_by($appuser_id);
            if ($devicescount) {
                $devices = $this->user_device->get_all_by($appuser_id)->result();

                foreach ($devices as $key => $device) {
                    if($device->DeviceTypeId ==='Android'){
                    $data[$key] = ($this->PushNotifications->android($push, $device->DeviceToken));
                    }else  if($device->DeviceTypeId ==='IOS'){
                        $data[$key] = ($this->PushNotifications->android($push, $device->DeviceToken));
                    }
                }

                $this->response(array('notifications' => $data, 'success' => true));
            }
        }
    }

}

?>