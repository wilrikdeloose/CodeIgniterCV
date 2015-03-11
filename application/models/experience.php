<?php

class Experience extends CI_Model {
  
    public function getAll($category) {
        $query = "
            SELECT EXPERIENCE.*,
                   CITY.Name AS City,
                   CITY.Country
            FROM EXPERIENCE,
                 CITY
            WHERE EXPERIENCE.CityID = CITY.ID AND
                  EXPERIENCE.Category = '$category'
            ORDER BY BeginDate DESC";

        return $this->db->query($query);
    }
}