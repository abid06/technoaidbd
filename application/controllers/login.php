<?php

class login extends CI_Controller {

    function __construct(){
        parent::__construct();
         $this->load->library('session');
         $this->load->model('user_m');

    }

    function index() {
       
        if( $this->session->userdata('isLoggedIn') ) {
            redirect('/home/');
        } else {
            $this->show_login(false);
        }
    }

    function login_user() {
        // Create an instance of the user model
        $this->load->model('user_m');

        // Grab the email and password from the form POST
        $email = $this->input->post('email');
        $pass  = $this->input->post('password');

        //Ensure values exist for email and pass, and validate the user's credentials
        if( $email && $pass && $this->user_m->validate_user($email,$pass)) {
            // If the user is valid, redirect to the main view
            redirect('/home/');
        } else {
            // Otherwise show the login screen with an error message.
            $this->show_login(true);
        }
    }

    function show_login( $show_error = false ) {
        $data['error'] = $show_error;

        $this->load->helper('form');

        $this->load->view('cms/header');
        $this->load->view('login',$data);
        $this->load->view('cms/footer');
    }

    function logout_user() {
      $this->session->sess_destroy();

      $this->index();
    }

    function showphpinfo() {
        echo phpinfo();
    }


}
