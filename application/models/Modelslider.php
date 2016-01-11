<?php 	


/**
* 	
*/
class Modelslider extends CI_Model
{
	
	public function __construct()
	{
		# code...
		$this->load->database();
	}

	public function slider_info (){

		$query=$this->db->get_where('tbl_slider',array('valid'=>1));
		return $query->result_array();
	}

	public function slidersave($filename, $caption_title,$caption_subtitle)
    {
        $data = array(
            'caption_title'     	=> $caption_title,
            'caption_subtitle'     	=> $caption_subtitle,
            'image'      			=> $filename,
            'image_path'      		=> 'assets/files/'.$filename,
            'valid'					=>1
        );
        $this->db->insert('tbl_slider', $data);
        return $this->db->insert_id();
        return $data;
    }

    public function sliderimgremove($id){

 		$this->db->query("delete from tbl_slider where id=$id");

        return 1;
        
    }
}

 ?>