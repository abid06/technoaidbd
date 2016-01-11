<?php 

/**
* Author: Abid Hasan
* class: Home page Manage
*/
class Home extends CI_Controller
{
	
	public function __construct()
	{
		parent::__construct();
 		$this->load->library('session');

	  if( !$this->session->userdata('isLoggedIn') ) {
	        redirect('/login/show_login');
	    }

		 $this->load->model('Modelslider');
        $this->load->database();

       
	}

	function index(){

$data['email'] = $this->session->userdata('email');
	    $data['name'] = $this->session->userdata('name');
	    $data['avatar'] = $this->session->userdata('avatar');
	    $data['tagline'] = $this->session->userdata('tagline');
	    $data['teamId'] = $this->session->userdata('teamId');


		 $this->load->view('cms/header');
		 $this->load->view('cms/menu',$data);
		 $this->load->view('cms/footer');
	}
	/**
	
	*/

	public function slider_manage(){

		$data['email'] = $this->session->userdata('email');
	    $data['name'] = $this->session->userdata('name');
	    $data['avatar'] = $this->session->userdata('avatar');
	    $data['tagline'] = $this->session->userdata('tagline');
	    $data['teamId'] = $this->session->userdata('teamId');


		 $this->load->view('cms/header');
		 $this->load->view('cms/menu',$data);
		 $this->load->view('cms/slidermanage');
		 $this->load->view('cms/footer');
	} 

	function slider_save(){

	
		$status = "";
    	$msg = "";
    	$file_element_name = 'userfile';
     
    if (empty($_POST['caption_title']))
    {
        $status = "error";
        $msg = "Please enter a title";
    }
     
    if ($status != "error")
    {
        $config['upload_path'] = './assets/files/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = 1024 * 8;
        $config['encrypt_name'] = TRUE;
 
        $this->load->library('upload', $config);
 
        if (!$this->upload->do_upload($file_element_name))
        {
            $status = 'error';
            $msg = $this->upload->display_errors('', '');
        }
        else
        {
            $data = $this->upload->data();


 		$config['image_library'] = 'gd2';
        $config['source_image'] = $data['full_path'];
        $config['maintain_ratio'] = TRUE;
        $config['height']   = 365;
		//$config['width']     = 1163;
        
        $this->load->library('image_lib', $config); 

        $this->image_lib->resize();


        $file_id= $this->Modelslider->slidersave($data['file_name'], $_POST['caption_title'],$_POST['caption_subtitle']);
            if($file_id)
            {
                $status = "success";
                $msg = "File successfully uploaded";
            }
            else
            {
                unlink($data['full_path']);
                $status = "error";
                $msg = "Something went wrong when saving the file, please try again.";
            }
        }
        @unlink($_FILES[$file_element_name]);
    }
    echo json_encode(array('status' =>$file_id, 'msg' => $msg));
		
	}


	public function slider_list(){

		$data['slider']=$this->Modelslider->slider_info();
    	$this->load->view('cms/sliderlist', $data);

	}

	public function slider_remove($id){

		 $data =$this->Modelslider->sliderimgremove($id);
		 echo json_encode(array('status' =>$data));

	}
}


 ?>