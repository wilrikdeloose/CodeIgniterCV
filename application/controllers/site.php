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
    
    public function knowledge($errorString = "")
    {
        $this->load->model("knowledge");
        $data["content"] = $this->knowledge->getAll("Knowledge");
        $data["title"] = "Knowledge";
        $data["category"] = "Knowledge";
        $data["error"] = $errorString;
        $this->load->view("knowledge", $data);
    }
    
    public function hobbies($errorString = "")
    {
        $this->load->model("knowledge");
        $data["content"] = $this->knowledge->getAll("Hobby");
        $data["title"] = "Hobbies";
        $data["category"] = "Hobby";
        $data["error"] = $errorString;
        $this->load->view("knowledge", $data);
    }
    
    public function addKnowledge()
    {
      $error = "";
      $success = false;
      
      $title = $this->input->post('title');
      $description = $this->input->post('description');

      if ($title != false && $description != false)
      {
        $data = array(
          "Title" => $title,
          "Description" => $description,
          "Category" => "Hobby",
          "PersonID" => 1);
          
        $this->load->model("knowledge");
        $success = $this->knowledge->addHobby($data);
      }

      if (!$success) {
        $this->hobbies("Could not insert the data!");
        return;
      }
      
      redirect(site_url() . '/site/hobbies');
    }
    
    public function language()
    {
        $this->load->model("language");
        $data["content"] = $this->language->getAll();
        $this->load->view("language", $data);
    }
}