<?php 
require_once(APPPATH.'/libraries/REST_Controller.php');

class Config extends REST_Controller
{
	function index_get()
	{
		$data = null;
		
		$id = 1;

		if ($id) {
			$cat = $this->branding->get_info($id); 
                        $cat->images = $this->image->get_all_by_type($id, 'branding')->result();
			$data = $cat;
		}  
		
		$this->response($data);
	}
	 
	function ago($time)
	{
		$time = mysql_to_unix($time);
		$now = mysql_to_unix($this->branding->get_now());
		
	   $periods = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
	   $lengths = array("60","60","24","7","4.35","12","10");
	
	   $difference     = $now - $time;
	   $tense         = "ago";
	
	   for ($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
	       $difference /= $lengths[$j];
	   }
	
	   $difference = round($difference);
	
	   if ($difference != 1) {
	       $periods[$j].= "s";
	   }
	   
	   if ($difference==0) {
	   		return "Just Now";
	   } else {
	   		return "$difference $periods[$j] ago";
	   }
	}
}
?>