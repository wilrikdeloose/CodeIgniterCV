<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller {

    public function index()
    {
        $this->person();
        $this->education();
        $this->work();
        $this->knowledge();
        $this->hobbies();
        $this->language();
    }
    
    public function person()
    {
        $this->load->model("person");
        $data["content"] = $this->person->getAll();
        $this->load->view("person", $data);
    }
    
    public function education()
    {
        $this->load->model("experience");
        $data["content"] = $this->experience->getAll("Education");
        $data["title"] = "Education";
        $this->load->view("experience", $data);
    }
    
    public function work()
    {
        $this->load->model("experience");
        $data["content"] = $this->experience->getAll("Work");
        $data["title"] = "Working experience";
        $this->load->view("experience", $data);
    }
    
    public function knowledge()
    {
        $this->load->model("knowledge");
        $data["content"] = $this->knowledge->getAll("Knowledge");
        $data["title"] = "Knowledge";
        $this->load->view("knowledge", $data);
    }
    
    public function hobbies()
    {
        $this->load->model("knowledge");
        $data["content"] = $this->knowledge->getAll("Hobby");
        $data["title"] = "Hobbies";
        $this->load->view("knowledge", $data);
    }
    
    public function language()
    {
        $this->load->model("language");
        $data["content"] = $this->language->getAll();
        $this->load->view("language", $data);
    }
}