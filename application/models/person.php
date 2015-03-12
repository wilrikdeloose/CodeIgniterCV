<?php

class Person extends CI_Model {
  
    public function getAll() {
        $query = "
            SELECT
                CI__PERSON.*,
                CI__CITY.Name AS City,
                CI__BIRTHPLACE.Name AS Birthplace,
                CI__NATIONALITY.Nationality,
                CI__COUNTRY.Name AS Country,
                CI__BIRTHCOUNTRY.Abbreviation AS BirthcountryAbbreviation
            FROM
                CI__PERSON,
                CI__CITY,
                CI__CITY CI__BIRTHPLACE,
                CI__COUNTRY,
                CI__COUNTRY CI__BIRTHCOUNTRY,
                CI__COUNTRY CI__NATIONALITY
            WHERE
                CI__PERSON.CityID = CI__CITY.ID AND
                CI__PERSON.BirthplaceID = CI__BIRTHPLACE.ID AND
                CI__CITY.Country = CI__COUNTRY.Abbreviation AND
                CI__BIRTHPLACE.Country = CI__BIRTHCOUNTRY.Abbreviation AND
                CI__PERSON.Nationality = CI__NATIONALITY.Abbreviation
            LIMIT 1
        ";
        $result = $this->db->query($query);
        return $result->row();
    }
}