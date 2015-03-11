<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Header extends CI_Controller {

    public function loadView()
    {
        $headerInfo = $this->application->getInfo();
        $this->load->view("header", $headerInfo);
    }
}