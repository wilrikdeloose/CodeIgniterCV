<?php

class Person extends CI_Model {
  
    public function getAll() {
        $query = "
            SELECT
                PERSON.*,
                CITY.Name AS City,
                BIRTHPLACE.Name AS Birthplace,
                NATIONALITY.Nationality,
                COUNTRY.Name AS Country,
                BIRTHCOUNTRY.Abbreviation AS BirthcountryAbbreviation
            FROM
                PERSON,
                CITY,
                CITY BIRTHPLACE,
                COUNTRY,
                COUNTRY BIRTHCOUNTRY,
                COUNTRY NATIONALITY
            WHERE
                PERSON.CityID = CITY.ID AND
                PERSON.BirthplaceID = BIRTHPLACE.ID AND
                CITY.Country = COUNTRY.Abbreviation AND
                BIRTHPLACE.Country = BIRTHCOUNTRY.Abbreviation AND
                PERSON.Nationality = NATIONALITY.Abbreviation
            LIMIT 1
        ";
        $result = $this->db->query($query);
        return $result->row();
    }
}