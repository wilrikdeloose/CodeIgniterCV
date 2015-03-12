<?php

class Application extends CI_Model {

    public function getInfo() {
        return array(
            "menu" => array(
              "site/person" => "Personal details",
              "site/education" => "Education",
              "site/work" => "Working experience",
              "site/knowledge" => "Knowledge",
              "site/hobbies" => "Hobbies",
              "site/language" => "Language"
            ),
            "siteName" => "Résumé of Wilrik"
        );
    }
}