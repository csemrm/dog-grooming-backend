<?php

require_once('main.php');

class Appusers extends Main {

    function __construct() {
        parent::__construct('appusers');
    }

    //retrieve
    function index() {
        $this->session->unset_userdata('searchterm');

        $pag = $this->config->item('pagination');
        $pag['base_url'] = site_url('appusers/index');
        $pag['total_rows'] = $this->appuser->count_all();

        $data['appusers'] = $this->appuser->get_all($pag['per_page'], $this->uri->segment(3));
        $data['pag'] = $pag;

        $content['content'] = $this->load->view('appusers/list', $data, true);

        $this->load_template($content);
    }

    function search() {
        $search_term = $this->searchterm_handler($this->input->post('searchterm'));

        $pag = $this->config->item('pagination');

        $pag['base_url'] = site_url('appusers/search');
        $pag['total_rows'] = $this->appuser->count_all_by(array('searchterm' => $search_term));

        $data['searchterm'] = $search_term;
        $data['appusers'] = $this->appuser->get_all_by(array('searchterm' => $search_term), $pag['per_page'], $this->uri->segment(3));
        $data['pag'] = $pag;

        $content['content'] = $this->load->view('appusers/search', $data, true);

        $this->load_template($content);
    }

    function searchterm_handler($searchterm) {
        if ($searchterm) {
            $this->session->set_userdata('searchterm', $searchterm);
            return $searchterm;
        } elseif ($this->session->userdata('searchterm')) {
            $searchterm = $this->session->userdata('searchterm');
            return $searchterm;
        } else {
            $searchterm = "";
            return $searchterm;
        }
    }

    //create
    function detail($appuser_id) {
        $data['appuser'] = $this->appuser->get_info($appuser_id);

        $pets = $this->category->get_all_by($appuser_id)->result();
        foreach ($pets as $key => $dog) {
            $pets[$key]->images = $this->image->get_all_by_type($dog->id, "category")->result();
        }
        $data['categories'] = $pets;
        $data['pets'] = $this->load->view('categories/userlist', $data, true);

        $reservations = $this->reservation->get_all_by($appuser_id)->result();
        foreach ($reservations as $reservation) {
            $reservation->dog = $this->category->get_info($reservation->dog_id);
            $reservation->promo = $this->feed->get_info($reservation->promo_id);
            $reservation->user = $this->appuser->get_info($reservation->user_id);
            $reservation->reservation_status = $this->reservation_status->get_info($reservation->status_id);
        }
        $data['reservations'] = $reservations;
        $data['appointments'] = $this->load->view('reservations/listbyuser', $data, true);


//
        $content['content'] = $this->load->view('appusers/detail', $data, true);

        $this->load_template($content);
    }

    function petedit($category_id = 0) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('edit');
        }

        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $category_data = array(
                'name' => $this->input->post('name'),
                'appuser_id' => $this->input->post('appuser_id'),
                'type' => $this->input->post('type'),
                'gender' => $this->input->post('gender'),
                'weight' => $this->input->post('weight'),
                'bread' => $this->input->post('bread'),
            );

            if ($this->category->save($category_data, $category_id)) {
                $this->session->set_flashdata('success', 'Category is successfully updated.');
            } else {
                $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
            }
            redirect(site_url('appusers/detail/' . $this->input->post('appuser_id')));
        }

        $data['category'] = $this->category->get_info($category_id);

        $content['content'] = $this->load->view('categories/petedit', $data, true);

        $this->load_template($content);
    }

    function petappointment($category_id = 0) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('add');
        }
        $data['category'] = $this->category->get_info($category_id);
        $content['content'] = $this->load->view('reservations/petadd', $data, true);
        $this->load_template($content);
    }

    function ban($appuser_id = 0) {
        $this->check_access('ban');

        $data = array(
            'is_banned' => 1
        );

        if ($this->appuser->save($data, $appuser_id)) {
            echo 'true';
        } else {
            echo 'false';
        }
    }

    function unban($appuser_id = 0) {
        $this->check_access('ban');

        $data = array(
            'is_banned' => 0
        );

        if ($this->appuser->save($data, $appuser_id)) {
            echo 'true';
        } else {
            echo 'false';
        }
    }

}

?>