<?php 


/**
* 
*/
class Menu extends CI_Controller
{
	 public function __construct()
        {
                parent::__construct();
                $this->load->model('Modelmenu');
                $this->load->model('Modelslider');
                $this->load->library('session');
		
	}

	public function index(){

		$data['menus']=$this->Modelmenu->get_menu();
		$data['slider']=$this->Modelslider->slider_info();
		
		$data['email'] = $this->session->userdata('email');
	    $data['name'] = $this->session->userdata('name');
	    $data['avatar'] = $this->session->userdata('avatar');
	    $data['tagline'] = $this->session->userdata('tagline');
	    $data['teamId'] = $this->session->userdata('teamId');


		// $this->load->view('cms/header');
		 

		$this->load->view('template/header');
		//$this->load->view('cms/menu',$data);

		$this->load->view('show_menu',$data);
		$this->load->view('template/footer');
	}

}

 ?>