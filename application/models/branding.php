<?php

class Branding extends Base_Model {

    protected $table_name;

    function __construct() {
        parent::__construct();
        $this->table_name = 'rt_branding';
    }

    function save(&$data, $id = false) {
        //if there is no data with this id, create new
        if (!$id && !$this->exists(array('id' => $id))) {
            if ($this->db->insert($this->table_name, $data)) {
                $data['id'] = $this->db->insert_id();
                return true;
            }
        } else {
            //else update the data
            $this->db->where('id', $id);
            return $this->db->update($this->table_name, $data);
        }

        return $false;
    }

    function get_all($limit = false, $offset = false) {
        $this->db->from($this->table_name);
        if ($limit) {
            $this->db->limit($limit);
        }

        if ($offset) {
            $this->db->offset($offset);
        }

        $this->db->order_by('added', 'desc');
        return $this->db->get();
    }

    function get_info($id) {
        $query = $this->db->get_where($this->table_name, array('id' => $id));

        if ($query->num_rows() == 1) {
            return $query->row();
        } else {
            return $this->get_empty_object($this->table_name);
        }
    }

}

?>