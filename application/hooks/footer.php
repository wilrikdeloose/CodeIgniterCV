<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Footer extends CI_Controller {

    public function loadView()
    {
        $this->load->view("footer");
    }
}