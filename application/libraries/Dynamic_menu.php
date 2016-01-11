<?php

/*
 * Dynmic_menu.php
 */
class Dynamic_menu {
 
    private $ci;            // para CodeIgniter Super Global Referencias o variables globales
   
    // --------------------------------------------------------------------
    /**
     * PHP5        Constructor
     *
     */
    function __construct()
    {
        $this->ci =& get_instance();    // get a reference to CodeIgniter.
    }


public function buildMenu($parent, $menu,$position,$mnu)
{

   $html = "";
   
   if (isset($menu['parents'][$parent]))
   {
       
                if($position==0)
                {
                    $html .= '<div class="navbar-collapse collapse">';
                    $html .= '<ul class="nav navbar-nav">';
                }else{
                    $html .='<ul class="dropdown-menu">';
                }               
                   foreach ($menu['parents'][$parent] as $itemId)
                   {
                      if(!isset($menu['parents'][$itemId]))
                      {
                          if(in_array($menu['items'][$itemId]['id'],$mnu)) //privilege check
                         $html .= "<li ><a href='".$menu['items'][$itemId]['link']."'>".$menu['items'][$itemId]['label']."</a></li> ";
                      }
                      if(isset($menu['parents'][$itemId]))
                      {
                         if($position==0)
                                {
                                    if(in_array($menu['items'][$itemId]['id'],$mnu)) //privilege check
                                     $html .= '<li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">'.$menu['items'][$itemId]['label'].'<b class="caret"></b></a>';
                                     
                                }else{
                                     if(in_array($menu['items'][$itemId]['id'],$mnu)) //privilege check
                                     $html .= '<li class="dropdown-submenu"><a tabindex="-1" href="#">'.$menu['items'][$itemId]['label'].'</a> ';                                   
                                }        
                                                    
                         $html .= $this->buildMenu($itemId, $menu,1, $mnu);
                         
                          if(in_array($menu['items'][$itemId]['id'],$mnu)) //privilege check
                         $html .= "</li>";               
                        
                      }
                   }
       $html .= "</ul> ";

   }
   return $html;
}


        function cmenu(){

        $query = $this->ci->db->query("SELECT id, title as label, url as link, parent_id as parent FROM dyn_menu");
        $menu = array(
                'items' => array(),
                'parents' => array()
            );
         
                 foreach ($query->result() as $row)
                    {
                               
                  // Creates entry into items array with current menu item id ie. $menu['items'][1]
                    $menu['items'][$row->id]['id']=$row->id;
                    $menu['items'][$row->id]['label']=$row->label;
                    $menu['items'][$row->id]['link']=$row->link;
                    $menu['items'][$row->id]['parent']=$row->parent;
                    // Creates entry into parents array. Parents array contains a list of all items with children
                    $menu['parents'][$row->parent][] = $row->id;
                    
                    }

                  $mnu=array(1,2,3,4,5,6,7,8,9,10,11,12,13);
                $x= $this->buildMenu(0, $menu, 0, $mnu);
                print_r($x);


        }
 }
// ------------------------------------------------------------------------
// End of Dynamic_menu Library Class.
// ------------------------------------------------------------------------
/* End of file Dynamic_menu.php */
/* Location: ../application/libraries/Dynamic_menu.php */

?>
