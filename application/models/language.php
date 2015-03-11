<?php

class Language extends CI_Model {
  
    public function getAll() {
        $query = "
            SELECT LANG.Name AS Lang, PERSON_LANGUAGE.Description
            FROM PERSON_LANGUAGE, LANG
            WHERE PERSON_LANGUAGE.LanguageID = LANG.ID AND PersonID = 1";

        return $this->db->query($query);
    }
}