<?php

class Experience extends CI_Model {
  
    public function getAll($category) {
        $query = "
            SELECT CI__EXPERIENCE.*,
                   CI__CITY.Name AS City,
                   CI__CITY.Country
            FROM CI__EXPERIENCE,
                 CI__CITY
            WHERE CI__EXPERIENCE.CityID = CI__CITY.ID AND
                  CI__EXPERIENCE.Category = '$category'
            ORDER BY BeginDate DESC";

        return $this->db->query($query);
    }
}