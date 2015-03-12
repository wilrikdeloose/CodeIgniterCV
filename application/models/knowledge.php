<?php

class Knowledge extends CI_Model {
  
    public function getAll($category) {
        $query = "
            SELECT CI__KNOWLEDGE_HOBBY.Title, CI__KNOWLEDGE_HOBBY.Description
            FROM CI__KNOWLEDGE_HOBBY
            WHERE Category = '$category'";

        return $this->db->query($query);
    }
    
    public function addHobby($data) {
        $this->db->insert("CI__KNOWLEDGE_HOBBY", $data);
        return ($this->db->affected_rows() > 0);
    }
}