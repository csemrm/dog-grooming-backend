<?php
require_once('main.php');

class User_devices extends Main
{
	function __construct()
	{
		parent::__construct('user_devices'); 
	}
	
	function index()
	{
		$this->session->unset_userdata('searchterm');
	
		$pag = $this->config->item('pagination');
		$pag['base_url'] = site_url('sub_categories/index');
		
		$pag['total_rows'] = $this->user_device->count_all($this->get_current_shop()->id);
		$data['sub_categories'] = $this->user_device->get_all($this->get_current_shop()->id, $pag['per_page'], $this->uri->segment(3));
		$data['pag'] = $pag;
		
		$content['content'] = $this->load->view('sub_categories/list',$data,true);		
		
		$this->load_template($content);
	}
	
	
	 
	
	 
	  
	 
	
}
?>