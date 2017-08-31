<?php
class Shop extends Base_Model
{
	protected $table_name;
	
	function __construct()
	{
		parent::__construct();
		$this->table_name = 'rt_shops';
	}
	
	function exists($data)
	{
		$this->db->from($this->table_name);
		
		if (isset($data['id'])) {
			$this->db->where('id',$data['id']);
		}
		
		$query = $this->db->get();
		return ($query->num_rows()==1);
	}
	
	function get_all($limit=false, $offset=false)
	{
		$this->db->from($this->table_name);
		$this->db->where('status',1);
		
		if ($limit) {
			$this->db->limit($limit);
		}
		
		if ($offset) {
			$this->db->offset($offset);
		}
		
		return $this->db->get();
	}

	function save(&$data, $id=false)
	{
		//if there is no data with this id, create new
		if (!$id && !$this->exists(array('id'=>$id))) {
			if ($this->db->insert($this->table_name,$data)) {
				$data['id'] = $this->db->insert_id();
				return true;
			}
		} else {
			//else update the data
			$this->db->where('id',$id);
			return $this->db->update($this->table_name,$data);
		}
		
		return $false;
	}
	
	function get_all_by($conditions=array(), $limit=false, $offset=false)
	{
		$this->db->from($this->table_name);
		
		if (isset($conditions['searchterm']) && trim($conditions['searchterm']) != "") {
			$this->db->where("(
									 name LIKE '%".$conditions['searchterm']."%' OR 
									 description LIKE '%".$conditions['searchterm']."%' OR 
									 phone LIKE '%".$conditions['searchterm']."%' OR 
									 address LIKE '%".$conditions['searchterm']."%'
									 )", NULL, FALSE);
		}
			
		$this->db->where('status',1);
		if ($limit) {
			$this->db->limit($limit);
		}
		
		if ($offset) {
			$this->db->offset($offset);
		}
		
		$this->db->order_by('added','desc');
		return $this->db->get();
	}
	
	function get_info($id)
	{
		$query = $this->db->get_where($this->table_name, array('id'=>$id));
		
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return $this->get_empty_object($this->table_name);
		}
	}
	
	function get_current_shop()
	{
		if ($this->session->userdata('shop_id') != "") {
			return $this->get_info($this->session->userdata('shop_id'));
		}
		return false;
	}
	
	function upload($shop_id=0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		    $this->check_access('edit');
		}
		
		$upload_data = $this->uploader->upload($_FILES);
		
		if (!isset($upload_data['error'])) {
			foreach ($upload_data as $upload) {
				$image = array(
								'parent_id'=> $shop_id,
								'type' => 'shop',
								'description' => $this->input->post('image_desc'),
								'path' => $upload['file_name'],
								'width'=>$upload['image_width'],
								'height'=>$upload['image_height']
							);
				$this->image->save($image);
			}
		} else {
			$data['error'] = $upload_data['error'];
		}
		
		$data['shop'] = $this->shop->get_info($shop_id);
		
		$content['content'] = $this->load->view('shops/edit',$data,true);		
		$this->load->view('template',$content);
	}
	
	function delete_by_shop($shop_id)
	{
		$this->db->where('id', $shop_id);
		return $this->db->delete($this->table_name);
	}
	
	function search_by_geo($miles, $user_lat, $user_long)
	{
		$query = $this->db->query("SELECT *, ( 3959 * acos( cos( radians('$user_lat') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('$user_long') ) + sin( radians('$user_lat') ) * sin( radians( lat ) ) ) ) AS distance FROM rt_shops HAVING distance < '$miles' ORDER BY distance LIMIT 0 , 20"); 
		 
		
		return $query;
	}
	
	function search_by_keyword($keyword)
	{
		$this->db->from($this->table_name);
		
		$this->db->where("(
						 keyword LIKE '%".$keyword."%' 
						 )", NULL, FALSE);
			
		$this->db->where('status',1);
		
		if ($limit) {
			$this->db->limit($limit);
		}
		
		if ($offset) {
			$this->db->offset($offset);
		}
		
		$this->db->order_by('id','asc');
		return $this->db->get();
	}
}
?>