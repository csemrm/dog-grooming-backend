<?php

class Category extends Base_Model {

    protected $table_name;

    function __construct() {
        parent::__construct();
        $this->table_name = 'rt_categories';
    }

    function exists($data) {
        $this->db->from($this->table_name);

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
        }

        if (isset($data['name'])) {
            $this->db->where('name', $data['name']);
        }

        if (isset($data['appuser_id'])) {
            $this->db->where('appuser_id', $data['appuser_id']);
        }

        $query = $this->db->get();
        return ($query->num_rows() == 1);
    }

    function save(&$data, $id = false) {
        if (!$id && !$this->exists(array('id' => $id, 'appuser_id' => $data['appuser_id']))) {
            if ($this->db->insert($this->table_name, $data)) {
                $data['id'] = $this->db->insert_id();
                return true;
            }
        } else {
            $this->db->where('id', $id);
            return $this->db->update($this->table_name, $data);
        }
        return false;
    }

    function get_all($limit = false, $offset = false) {
        $this->db->from($this->table_name);
        //$this->db->where('appuser_id', $appuser_id);

        if ($limit) {
            $this->db->limit($limit);
        }

        if ($offset) {
            $this->db->offset($offset);
        }

        $this->db->order_by('ordering', 'asc');
        return $this->db->get();
    }

    function get_only_publish($appuser_id, $limit = false, $offset = false) {
        $this->db->from($this->table_name);
        $this->db->where('appuser_id', $appuser_id);
        $this->db->where('is_published', 1);

        if ($limit) {
            $this->db->limit($limit);
        }

        if ($offset) {
            $this->db->offset($offset);
        }

        $this->db->order_by('ordering', 'asc');
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

    function get_multiple_info($ids) {
        $this->db->from($this->table_name);
        $this->db->where_in($ids);
        return $this->db->get();
    }

    function count_all() {
        $this->db->from($this->table_name);
        //$this->db->where('appuser_id', $appuser_id);
        $this->db->where('is_published', 1);
        return $this->db->count_all_results();
    }

    function count_all_by($conditions = array()) {
        $this->db->from($this->table_name);

        if (isset($conditions['searchterm'])) {
            $this->db->like('name', $conditions['searchterm']);
        }

        //$this->db->where('appuser_id', $appuser_id);
        $this->db->where('is_published', 1);
        return $this->db->count_all_results();
    }

    function get_all_by($appuser_id, $conditions = array(), $limit = false, $offset = false) {
        $this->db->from($this->table_name);

        if (isset($conditions['searchterm'])) {
            $this->db->like('name', $conditions['searchterm']);
        }
        if ($appuser_id)
            $this->db->where('appuser_id', $appuser_id);
        $this->db->where('is_published', 1);
        if ($limit) {
            $this->db->limit($limit);
        }

        if ($offset) {
            $this->db->offset($offset);
        }

        $this->db->order_by('added', 'desc');
        return $this->db->get();
    }

    function delete($id) {
        $this->db->where('id', $id);
        return $this->db->delete($this->table_name);
    }

    function get_cat_name_by_id($id) {
        $this->db->from($this->table_name);
        $this->db->where('id', $id);
        $query = $this->db->get();
        foreach ($query->result() as $row) {
            return $row->name;
        }
    }

    function delete_by_shop($appuser_id) {
        $this->db->where('appuser_id', $appuser_id);
        return $this->db->delete($this->table_name);
    }

}

?>