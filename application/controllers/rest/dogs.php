<?php

require_once(APPPATH . '/libraries/REST_Controller.php');

class Dogs extends REST_Controller {

    function get_get() {
        $data = null;

        $appuser_id = $this->get('appuser_id');

        if ($appuser_id) {
            $cat = $this->category->get_all_by($appuser_id)->result();
            foreach ($cat as $key => $dog) {
                $cat[$key]->images = $this->image->get_all_by_type($dog->id, "category")->result();
            }

            $data = $cat;
        }

        $this->response(array('dogs' => $data, 'success' => true));
    }

    function add_post() {
        $data = $this->post();
        $this->load->library('uploader');

        if ($data == null) {
            $this->response(array('error' => true, 'message' => 'invalid_json'));
        }

        if (!array_key_exists('name', $data)) {
            $this->response(array('error' => true, 'message' => 'require name'));
        }

        if (!array_key_exists('type', $data)) {
            $this->response(array('error' => true, 'message' => 'require type'));
        }

        if (!array_key_exists('appuser_id', $data)) {
            $this->response(array('error' => true, 'message' => 'require appuser_id'));
        }

        $user_data = array(
            'name' => $data['name'],
            'is_published' => 1,
            'type' => $data['type'],
            'gender' => $data['gender'],
            'weight' => $data['weight'],
            'bread' => $data['bread'],
            'appuser_id' => $data['appuser_id']
        );

        if ($this->category->exists($user_data)) {
            $this->response(array('error' => true, 'message' => 'email_exist'));
        } else {
            $this->category->save($user_data);
            $upload_data = $this->uploader->upload($_FILES);
            foreach ($upload_data as $upload) {
                $image = array(
                    'parent_id' => $user_data['id'],
                    'type' => 'category',
                    'description' => "",
                    'path' => $upload['file_name'],
                    'width' => $upload['image_width'],
                    'height' => $upload['image_height']
                );
                $this->image->save($image);
            }
            $this->response(array('error' => false, 'user' => $user_data));
        }
    }

    function get_items($cat_id) {
        $all = $this->get('item');
        $count = $this->get('count');
        $from = $this->get('from');
        $keyword = "";
        if ($this->get('keyword')) {
            $keyword = $this->get('keyword');
        }

        if (!$all) {
            $items = $this->item->get_all_by_cat($cat_id, $keyword, 3)->result();
        } else {
            if ($count && $from) {
                $items = $this->item->get_all_by_cat($cat_id, $keyword, $count, $from)->result();
            } else if ($count) {
                $items = $this->item->get_all_by_cat($cat_id, $keyword, $count)->result();
            } else {
                $items = $this->item->get_all_by_cat($cat_id, $keyword)->result();
            }
        }

        $i = 0;


        return $items;
    }

    function ago($time) {
        $time = mysql_to_unix($time);
        $now = mysql_to_unix($this->category->get_now());

        $periods = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
        $lengths = array("60", "60", "24", "7", "4.35", "12", "10");

        $difference = $now - $time;
        $tense = "ago";

        for ($j = 0; $difference >= $lengths[$j] && $j < count($lengths) - 1; $j++) {
            $difference /= $lengths[$j];
        }

        $difference = round($difference);

        if ($difference != 1) {
            $periods[$j].= "s";
        }

        if ($difference == 0) {
            return "Just Now";
        } else {
            return "$difference $periods[$j] ago";
        }
    }

}

?>