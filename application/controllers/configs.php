<?php

require_once('main.php');

class Configs extends Main {

    function __construct() {
        parent::__construct('configs');
        $this->load->library('uploader');
    }

    function index() {
        $this->edit(1);
    }

    function edit($branding_id = 1) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('edit');
        }

        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $branding_data = array(
                'company_name' => $this->input->post('company_name'),
                'slugon' => $this->input->post('slugon'),
                'contact_email' => $this->input->post('contact_email'),
                'about_us' => $this->input->post('about_us'),
                'contact_address' => $this->input->post('contact_address'),
                'website' => $this->input->post('website'),
                'facebook' => $this->input->post('facebook'),
                'twitter' => $this->input->post('twitter'),
                'email_address' => $this->input->post('email_address'),
                'email_username' => $this->input->post('email_username'),
                'email_password' => $this->input->post('email_password'),
                'email_smtpserver' => $this->input->post('email_smtpserver'),
                'email_smtp_port' => $this->input->post('email_smtp_port'),
                'email_ssl' => $this->input->post('email_ssl'),
                'mailchimp_username' => $this->input->post('mailchimp_username'),
                'mailchimp_apikey' => $this->input->post('mailchimp_apikey'),
                'mailchimp_enable' => $this->input->post('mailchimp_enable'),
                'company_phone' => $this->input->post('company_phone'),
                    // 'services' => $this->input->post('services'),
            );

            if ($this->branding->save($branding_data, $branding_id)) {
                $this->session->set_flashdata('success', 'Configuration is successfully updated.');
            } else {
                $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
            }
            redirect(site_url('configs'));
        }

        $data['branding'] = $this->branding->get_info($branding_id);

        $content['content'] = $this->load->view('branding/add_edit', $data, true);

        $this->load_template($content);
    }

    function add_service($branding_id = 1) {
        $branding_id = $this->input->post('brandingid');
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $service = $this->input->post('service');
            if ($branding_id && $service) {
                $services = $this->branding->get_info($branding_id)->services;
                if ($services)
                    $services = explode(',', $services);
                $services[] = $service;
                $services = array_unique($services);
                $branding_data = array(
                    'services' => implode(',', $services)
                );
                $saved = $this->branding->save($branding_data, $branding_id);
                if ($saved) {
                    $this->session->set_flashdata('success', 'Configuration is successfully updated.');
                } else {
                    $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
                }
                redirect(site_url('configs'));
            }
            redirect(site_url('configs'));
        }
    }

    function delete_service($branding_id = 0, $service = '') {
        if ($branding_id) {
            $services = explode(',', $this->branding->get_info($branding_id)->services);
            if (in_array($service, $services)) {
                if (($key = array_search($service, $services)) !== false) {
                    unset($services[$key]);
                    $branding_data = array(
                        'services' => implode(',', $services)
                    );
                    $saved = $this->branding->save($branding_data, $branding_id);
                    if ($saved) {
                        $this->session->set_flashdata('success', 'Configuration is successfully updated.');
                    } else {
                        $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
                    }
                    redirect(site_url('configs'));
                }
            }
        }
        redirect(site_url('configs'));
    }

    function delete($branding_id = 0) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('delete');
        }

        if ($this->branding->delete($branding_id)) {

            unlink('./uploads/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            unlink('./uploads/thumbnail/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            $this->image->delete_by_parent($branding_id, 'branding');

            $this->session->set_flashdata('success', 'The branding is successfully deleted.');
        } else {
            $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
        }
        redirect(site_url('configs'));
    }

    function delete_items($branding_id = 0) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('delete');
        }

        if ($this->branding->delete($branding_id)) {
            unlink('./uploads/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            unlink('./uploads/thumbnail/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            $this->image->delete_by_parent($branding_id, 'branding');

            if ($this->delete_sub_configs($branding_id)) {
                if ($this->delete_items_images($branding_id)) {
                    $this->session->set_flashdata('success', 'The branding is successfully deleted.');
                } else {
                    $this->session->set_flashdata('error', 'Database error occured in items.Please contact your system administrator.');
                }
            } else {
                $this->session->set_flashdata('error', 'Database error occured in sub configs.Please contact your system administrator.');
            }
        } else {
            $this->session->set_flashdata('error', 'Database error occured in configs.Please contact your system administrator.');
        }
        redirect(site_url('configs'));
    }

    function delete_sub_configs($branding_id) {
        $sub_cats = $this->sub_branding->get_all_by_cat($branding_id);

        foreach ($sub_cats->result() as $sub_cat) {
            unlink('./uploads/' . $this->image->get_info_parent_type($sub_cat->id, 'sub_branding')->path);
            unlink('./uploads/thumbnail/' . $this->image->get_info_parent_type($sub_cat->id, 'sub_branding')->path);
            $this->image->delete_by_parent($sub_cat->id, 'sub_branding');
        }

        $this->sub_branding->delete_by_cat($branding_id);

        return true;
    }

    function delete_items_images($branding_id) {
        $items = $this->item->get_all_by_cat($branding_id);

        foreach ($items->result() as $item) {
            $images = $this->image->get_all_by_type($item->id, 'item');
            foreach ($images->result() as $image) {
                unlink('./uploads/' . $image->path);
            }

            $this->image->delete_by_parent($item->id, 'item');
        }
        $this->item->delete_by_cat($branding_id);

        return true;
    }

    function delete_image($branding_id, $image_id, $image_name) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('edit');
        }

        if ($this->image->delete($image_id)) {
            unlink('./uploads/' . $image_name);
            unlink('./uploads/thumbnail/' . $image_name);
            $this->session->set_flashdata('success', 'Category cover photo is successfully deleted.');
        } else {
            $this->session->set_flashdata('error', 'Database error occured.Please contact your system administrator.');
        }
        redirect(site_url('configs'));
    }

    function exists($shop_id = 0) {
        $name = $_REQUEST['name'];
        if (strtolower($this->branding->get_info($branding_id)->name) == strtolower($name)) {
            echo "true";
        } else if ($this->branding->exists(array('name' => $_REQUEST['name'], 'shop_id' => $shop_id))) {
            echo "false";
        } else {
            echo "true";
        }
    }

    function upload($branding_id = 0) {
        if (!$this->session->userdata('is_shop_admin')) {
            $this->check_access('edit');
        }

        $upload_data = $this->uploader->upload($_FILES);

        if (!isset($upload_data['error'])) {

            unlink('./uploads/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            unlink('./uploads/thumbnail/' . $this->image->get_info_parent_type($branding_id, 'branding')->path);
            $this->image->delete_by_parent($branding_id, 'branding');

            foreach ($upload_data as $upload) {
                $image = array(
                    'parent_id' => $branding_id,
                    'type' => 'branding',
                    'description' => "",
                    'path' => $upload['file_name'],
                    'width' => $upload['image_width'],
                    'height' => $upload['image_height']
                );
                $this->image->save($image);
                redirect(site_url('configs/edit/' . $branding_id));
            }
        } else {
            $data['error'] = $upload_data['error'];
        }

        $data['branding'] = $this->branding->get_info($branding_id);

        $content['content'] = $this->load->view('branding/add_edit', $data, true);
        $this->load_template($content);
    }

}

?>