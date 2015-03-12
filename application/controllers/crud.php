<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Crud extends CI_Controller {
  private $crud;
  
	public function __construct()
	{
		parent::__construct();

		$this->load->library('grocery_CRUD');
    $this->crud = new grocery_CRUD();
	}

	public function output($output = null)
	{
		$this->load->view('crud_view.php', $output);
	}

	public function index()
	{
		$this->output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}

	public function lang()
	{
			$this->crud->set_table('ci__lang');
			$this->crud->columns('ID', 'Name');
			$this->crud->set_subject('language');

			$this->output($this->crud->render());
	}

	public function country()
	{
			$this->crud->set_table('ci__country');
			$this->crud->columns('Abbreviation', 'Name', 'Nationality');
			$this->crud->set_subject('country');

			$this->output($this->crud->render());
	}

	public function city()
	{
			$this->crud->set_table('ci__city');
			$this->crud->columns('ID', 'Name', 'Country');
			$this->crud->set_subject('city');
      $this->crud->set_relation('Country', 'ci__country', 'Abbreviation');

			$this->output($this->crud->render());
	}
}