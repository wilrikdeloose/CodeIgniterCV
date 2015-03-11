<?php

class Application extends CI_Model {

    public function getInfo() {
        return array(
            "menu" => array(
              "person" => "Personal details",
              "education" => "Education",
              "work" => "Working experience",
              "knowledge" => "Knowledge",
              "hobbies" => "Hobbies",
              "language" => "Language",
            ),
            "siteName" => "Résumé of Wilrik"
        );
    }
}