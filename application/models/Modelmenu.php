

<?php 


/**
* 
*/
class Modelmenu extends CI_Model
{
	
	 public function __construct()
	{
		# code...
		
		$this->load->database();
	}

	public function get_menu(){
		$qeury=$this->db->get('tbl_menu');
		return $qeury->result_array();
	}
}


 ?>