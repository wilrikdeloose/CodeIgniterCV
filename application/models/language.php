<?php

class Language extends CI_Model {
  
    public function getAll() {
        $query = "
            SELECT CI__LANG.Name AS Lang, CI__PERSON_LANGUAGE.Description
            FROM CI__PERSON_LANGUAGE, CI__LANG
            WHERE CI__PERSON_LANGUAGE.LanguageID = CI__LANG.ID AND PersonID = 1";

        return $this->db->query($query);
    }
}