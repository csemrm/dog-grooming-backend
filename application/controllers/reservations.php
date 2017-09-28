<?php

require_once('main.php');

class Reservations extends Main {

    function __construct() {
        parent::__construct('reservations');
        $this->load->library('common');
        $this->load->library('email', array(
            'mailtype' => 'html',
            'newline' => '\r\n'
        ));
    }

    function index() {
        $this->session->unset_userdata('searchterm');

        $pag = $this->config->item('pagination');
        $pag['base_url'] = site_url('reservations/index');
        $pag['total_rows'] = $this->reservation->count_all(1);

        $reservations = $this->reservation->get_all($pag['per_page'], $this->uri->segment(3))->result();

        foreach ($reservations as $reservation) {
            $reservation->dog = $this->category->get_info($reservation->dog_id);
            $reservation->promo = $this->feed->get_info($reservation->promo_id);
            $reservation->user = $this->appuser->get_info($reservation->user_id);
            $reservation->reservation_status = $this->reservation_status->get_info($reservation->status_id);
        }
        $data['reservations'] = $reservations;
        $data['pag'] = $pag;

        $content['content'] = $this->load->view('reservations/list', $data, true);

        $this->load_template($content);
    }

    function search() {
        $search_term = $this->searchterm_handler($this->input->post('searchterm'));

        $pag = $this->config->item('pagination');

        $pag['base_url'] = site_url('reservations/search');
        $pag['total_rows'] = $this->reservation->count_all_by(array('searchterm' => $search_term));

        $data['searchterm'] = $search_term;
        $data['categories'] = $this->reservation->get_all_by(null, array('searchterm' => $search_term), $pag['per_page'], $this->uri->segment(3)
        );
        $data['pag'] = $pag;

        $content['content'] = $this->load->view('reservations/search', $data, true);

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

    function create() {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('add');
        }
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $redirect = $this->input->post('redirect');
            if ($this->input->post('user_id') && $this->input->post('note')) {
                $appuser = $this->appuser->get_info($this->input->post('user_id'));
                $date = $this->input->post('resv_date');
                $note = $this->input->post('note');
                $reserve_data = array(
                    'resv_date' => date('Y-m-d', strtotime($date)),
                    'resv_time' => $this->input->post('resv_time'),
                    'note' => implode(',', $note),
                    'shop_id' => 1,
                    'user_id' => $this->input->post('user_id'),
                    'dog_id' => $this->input->post('dog_id'),
                    'promo_id' => $this->input->post('promo_id'),
                    'user_email' => $this->input->post('user_email') || $appuser->email,
                    'user_phone_no' => $this->input->post('user_phone_no'),
                    'user_name' => $appuser->username,
                    'status_id' => 1
                );

                if ($this->reservation->save($reserve_data)) {
                    $this->session->set_flashdata('success', 'Reservation is successfully updated.');

                    $this->send_email_to_user(
                            $this->input->post('resv_user_id_hidden'), $this->input->post('user_email'), $appuser->username, $this->input->post('user_phone_no'), 1, $this->input->post('resv_id_hidden'), $this->input->post('resv_date_hidden'), $this->input->post('resv_time_hidden'), $this->input->post('resv_note_hidden'), $this->reservation_status->get_info($this->input->post('resv_status'))->title);
                } else {
                    $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
                }
                if ($redirect) {
                    redirect($redirect);
                } else {
                    redirect(site_url('reservations'));
                }
            } else {
                if ($redirect) {
                    redirect($redirect);
                } else {
                    redirect(site_url('reservations'));
                }
            }
        }

        $content['content'] = $this->load->view('reservations/add', array(), true);
        $this->load_template($content);
    }

    function edit($reservation_id, $redirect = null) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('edit');
        }

        if ($this->input->server('REQUEST_METHOD') == 'POST') {

            if ($this->input->post('resv_status_hidden') != $this->input->post('resv_status')) {

                $reserve_data = array(
                    'status_id' => $this->input->post('resv_status')
                );

                if ($this->reservation->save($reserve_data, $reservation_id)) {
                    $this->session->set_flashdata('success', 'Reservation is successfully updated.');
                    if ($this->input->post('resv_status') === '4') {
                        $this->sendpush($reservation_id, 4);
                    } elseif ($this->input->post('resv_status') === '3') {
                        $this->sendpush($reservation_id, 3);
                    }
                    $this->send_email_to_user(
                            $this->input->post('resv_user_id_hidden'), $this->input->post('resv_user_email_hidden'), $this->input->post('resv_user_name_hidden'), $this->input->post('resv_user_phone_hidden'), $this->input->post('resv_shop_id_hidden'), $this->input->post('resv_id_hidden'), $this->input->post('resv_date_hidden'), $this->input->post('resv_time_hidden'), $this->input->post('resv_note_hidden'), $this->reservation_status->get_info($this->input->post('resv_status'))->title);
                } else {
                    $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
                }
                if ($redirect) {
                    redirect(site_url('appusers/detail/' . $this->input->post('resv_user_id_hidden')));
                } else {
                    redirect(site_url('reservations'));
                }
            } else {
                if ($redirect) {
                    redirect(site_url('appusers/detail/' . $this->input->post('resv_user_id_hidden')));
                } else {
                    redirect(site_url('reservations'));
                }
            }
        }

        $reservation = $this->reservation->get_info($reservation_id);
        $reservation->dog = $this->category->get_info($reservation->dog_id);
        $reservation->promo = $this->feed->get_info($reservation->promo_id);
        $reservation->user = $this->appuser->get_info($reservation->user_id);
        $data['reservation'] = $reservation;
        $data['redirect'] = $redirect;
        $content['content'] = $this->load->view('reservations/edit', $data, true);
        $this->load_template($content);
    }

    function sendpush($reservation_id = 0, $type = 4) {

        $reservation = $this->reservation->get_info($reservation_id);
        $reservation->dog = $this->category->get_info($reservation->dog_id);
        $reservation->images = $this->image->get_all_by_type($reservation->dog_id, "category")->result();
        $_type = 'dog';
        if ($type == 4) {
            $_type = 'dog';
            $payload = $reservation->dog->name . ' is ready for pickup! "I has a parfect day !"';
        } elseif ($type == 3) {
            $_type = 'app.confirm';
            $payload = 'An appointment has been confirmed for ' . $reservation->dog->name . '! "I has a parfect day !"';
        } elseif ($type == 1) {
            $_type = 'app.pending';
            $payload = 'An appointment is pending for ' . $reservation->dog->name . '! "I has a parfect day !"';
        }
        $push = array(
            'title' => 'Woodlesapp',
            'payload' => $payload,
            'message' => $payload,
            'body' => $payload,
            'subtitle' => '',
            'tickerText' => '',
            'msgcnt' => 1,
            'vibrate' => 1,
            'extradata' => array(
                'id' => $reservation_id,
                'type' => $_type,
                'reservation' => $reservation
            )
        );
        $devicescount = $this->user_device->count_all_by($reservation->user_id);
        if ($devicescount) {
            $devices = $this->user_device->get_all_by($reservation->user_id)->result();

            foreach ($devices as $key => $device) {
                if ($device->DeviceTypeId === 'Android') {
                    $data[$key] = ($this->pushnotifications->android($push, $device->DeviceToken));
                } else if ($device->DeviceTypeId === 'IOS') {
                    $data[$key] = ($this->pushnotifications->iOS($push, $device->DeviceToken));
                }
            }

            return array('notifications' => $data, 'success' => true);
        }
    }

    function send_email_to_user($user_id, $user_email, $user_name, $user_phone, $shop_id, $resv_id, $resv_date, $resv_time, $note, $resv_status_title) {

        $shop = $this->shop->get_info($shop_id);
        $resv_info = "Please take note your reservation status has been changed to " . $resv_status_title . ". Your reservation detail infromation at below:";


        $sender_email = trim($shop->sender_email);
        $sender_name = $shop->name;
        $sender_phone = $shop->phone;
        $sender_address = $shop->address;

        $to = $user_email;
        $subject = 'Reservation';

        $html = "<p>Hi " . $user_name . ",</p>" .
                $resv_info .
                "<br><br>Date : " . $resv_date . " (DD/MM/YYYY)<br>" .
                "Time : " . $resv_time . " (HH-MM)<br>" .
                "Additional Note : " . $note . " <br>" .
                "<br>Reserved Person Detail<br>" .
                "Name : " . $user_name . "<br>" .
                "Email : " . $user_email . "<br>" .
                "Phone No : " . $user_phone . "<br><br>" .
                "<p>Best Regards,<br/>"
                . $sender_name . "<br>" .
                "Phone(" . $sender_phone . ")<br>" .
                "Address(" . $sender_address . ")<br>" .
                "</p>";


        $this->email->from($sender_email, $sender_name);
        $this->email->to($to);
        $this->email->subject($subject);
        $this->email->message($html);
        if ($this->email->send()) {
            return true;
        } else {
            return false;
        }
    }

}

?>