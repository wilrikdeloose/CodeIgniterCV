<?php

class Knowledge extends CI_Model {
  
    public function getAll($category) {
        $query = "
            SELECT KNOWLEDGE_HOBBY.Title, KNOWLEDGE_HOBBY.Description
            FROM KNOWLEDGE_HOBBY
            WHERE Category = '$category'";

        return $this->db->query($query);
    }
}