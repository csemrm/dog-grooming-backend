<?php 
class User_Device extends Base_Model
{
	protected $table_name;

	function __construct()
	{
		parent::__construct();
		$this->table_name = 'user_devices';
	}

	function exists($data)
	{
		$this->db->from($this->table_name);
		
		if (isset($data['id'])) {
			$this->db->where('id',$data['id']);
		}
		
		if (isset($data['DeviceToken'])) {
			$this->db->where('DeviceToken',$data['DeviceToken']);
		}
		
		if (isset($data['UserId'])) {
			$this->db->where('UserId', $data['UserId']);
		}
		
		if (isset($data['DeviceToken'])) {
			$this->db->where('DeviceToken',$data['DeviceToken']);
		}
		
		$query = $this->db->get();
		return ($query->num_rows() == 1);
	}

	function save(&$data, $id=false)
	{
		if (!$id && !$this->exists(array('id' => $id))) {
			if ($this->db->insert($this->table_name,$data)) {
				$data['id'] = $this->db->insert_id();
				return true;
			}
		} else {
			$this->db->where('id',$id);
			return $this->db->update($this->table_name,$data);
		}		
		return false;
	}

	function get_all($UserId, $limit = false, $offset = false)
	{
		$this->db->from($this->table_name);
		$this->db->where('UserId', $UserId);
		
		if ($limit) {
			$this->db->limit($limit);
		}
		
		if ($offset) {
			$this->db->offset($offset);
		} 
		return $this->db->get();
	} 
	function get_info($id)
	{
		$query = $this->db->get_where($this->table_name,array('id' => $id));
		
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return $this->get_empty_object($this->table_name);
		}
	} 

	function count_all($UserId)
	{
		$this->db->from($this->table_name);
		$this->db->where('UserId', $UserId); 
		return $this->db->count_all_results();
	}

	function count_all_by($UserId)
	{
		$this->db->from($this->table_name);
		$this->db->where('UserId', $UserId);
		 
		return $this->db->count_all_results();
	}
	 
	
	function get_all_by_cat($cat_id)
	{
		$this->db->from($this->table_name);
		$this->db->where('cat_id', $cat_id);
		return $this->db->get();
	} 
	function delete($id)
	{
		$this->db->where('id', $id);
		return $this->db->delete($this->table_name);
 	}
 	
 	function delete_by_userid($UserId)
 	{
 		$this->db->where('UserId', $UserId);
 		return $this->db->delete($this->table_name);
 	}
 	 
}
?>