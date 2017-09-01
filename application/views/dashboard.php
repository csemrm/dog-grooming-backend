			<h2 class="page-header">Welcome, <?php echo $this->user->get_logged_in_user_info()->user_name;?>!</h2>
			
			<?php if($this->session->flashdata('success')): ?>
				<div class="alert alert-success fade in">
					<?php echo $this->session->flashdata('success');?>
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				</div>
			<?php elseif($this->session->flashdata('error')):?>
				<div class="alert alert-danger fade in">
					<?php echo $this->session->flashdata('error');?>
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				</div>
			<?php endif;?>
			
			<div class="wrapper wrapper-content animated fadeInRight">
		 	<div class="row">
		  		
			  	<div class="col-sm-3">
			  		<a href="<?php  echo site_url('reservations') ?>">
				  		
				  		<span class="badge badge-important">
				  			<?php echo $this->reservation->count_all($this->shop->get_current_shop()->id);?>
				  		</span>
				  		
				  		<div class="hero-widget">
				  			<div class="icon">
				  				<i class="fa fa-calendar"></i>
				  			</div>
				  			<div class="text">
				  				
				  				<label class="text-muted">Reservation Counts</label>
				  			</div>
				  		</div>
			  		</a>
			  	</div>
			  	
			  	
			  	
		  	</div>
			<hr/>
			
			<?php
				$all_discounts = $this->discount_type->get_all($this->shop->get_current_shop()->id, 3);
				$all_discounts_count = $this->discount_type->count_all($this->shop->get_current_shop()->id);
			?>
			<div class="row">
		            <div class="col-lg-4"> 
		            	<div class="ibox float-e-margins">
		                    <div class="ibox-title">
		                        <h5>Discount Information</h5>
		                        <div class="ibox-tools">
		                            <span class="label label-warning-light">Total : <?php echo $all_discounts_count; ?> Discounts</span>
		                        </div>
		                    </div>
		                    <div class="ibox-content">
		                        
		                        <div>
		                        	<?php 
		                        		foreach($all_discounts->result() as $dis)
		                        			echo '<h5>'.$dis->name.' <br/><small class="m-r">'.
		                        				'<a href="'.site_url('discount_types').'">Check For Detail!</a></small></h5>';
		                        	?>
		                         </div>
		                         
		                    </div>
		                </div>
		            
		                <div class="ibox float-e-margins">
		                    <div class="ibox-title">
		                    	<?php
		                    		$all_inquiries = $this->inquiry->get_all($this->shop->get_current_shop()->id, 5);
		                    		$all_inquiries_count = $this->inquiry->count_all($this->shop->get_current_shop()->id);
		                    	?>
		                        <h5>Inquiry Messages</h5>
		                        <div class="ibox-tools">
		                            <span class="label label-warning-light">Total : <?php echo $all_inquiries_count; ?> Messages</span>
		                        </div>
		                    </div>
		                   
		                    <div class="ibox-content">
		                        <div class="feed-activity-list">
									
									<?php 
										foreach($all_inquiries->result() as $inquiry)
											echo "<div class='feed-element'><div>".
													"<small class='pull-right text-navy'>".$this->inquiry->ago($inquiry->added)."</small>".
													"<strong>".$inquiry->name."</strong>".
													"<div><i class='glyphicon glyphicon-envelope'></i>    ".$this->feed->read_more_text($inquiry->message)."</div>".
											     "</div></div>";
									?>
									
		                        </div>
		                        <small class="pull-right text-navy"><a href='<?php echo site_url('inquiries');?>'>View All</a></small>
		                    </div>
		                </div>
		            </div>
		        
		            <div class="col-lg-8">
		                <div class="row">
		                    <div class="col-lg-6">
		                        <div class="ibox float-e-margins">
			                        <?php
			                        	$all_items = $this->item->get_all($this->shop->get_current_shop()->id, 7);
			                        	$all_items_count = $this->item->count_all($this->shop->get_current_shop()->id);
			                         ?>
		                            <div class="ibox-title">
		                                <h5>Recent Items list</h5>
		                                <div class="ibox-tools">
		                                    <span class="label label-warning-light">Total : <?php echo $all_items_count;?> Items</span>
		                                </div>
		                            </div>
		                            <div class="ibox-content">
		                                <table class="table table-hover no-margins">
		                                    <thead>
		                                    <tr>
		                                        <th>Name</th>
		                                        <th>Category</th>
		                                        <th>Sub Cat.</th>
		                                        <th>Price</th>
		                                    </tr>
		                                    </thead>
		                                    
		                                    <tbody>
		                                    
		                                    <?php 
		                                    	
		                                    	foreach($all_items->result() as $item)
		                                    		echo '<tr>'.
		                                    			 '<td><small>'.$item->name.'</small></td>'.
		                                    			 '<td><small>'.$this->category->get_info($item->cat_id)->name.'</small></td>'.
		                                    			 '<td><small>'.$this->sub_category->get_info($item->sub_cat_id)->name.'</small></td>'.
		                                    			 '<td><small>'.$item->unit_price.'</small></td>'.
		                                    		     '</tr>';
		                                    ?>
		                                   </tbody>
		                                </table>
		                                <small class="pull-right text-navy"><a href='<?php echo site_url('items');?>'>View All</a></small>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-6">
		                        <div class="ibox float-e-margins">
		                        	<?php
		                        		$all_feeds = $this->feed->get_all($this->shop->get_current_shop()->id, 3);
		                        		$all_feeds_count = $this->feed->count_all($this->shop->get_current_shop()->id);
		                        	 ?>
		                            <div class="ibox-title">
		                                <h5>News Feed List</h5>
		                                <div class="ibox-tools">
		                                    <span class="label label-warning-light">Total : <?php echo $all_feeds_count;?> Feeds</span>
		                                </div>
		                            </div>
		                            <div class="ibox-content">
		
		                                <div>
		                                    <div class="feed-activity-list">
												
												<?php 
													
													foreach($all_feeds->result() as $feed){
														$feed_all =  $this->image->get_all_by_type($feed->id,'feed')->result();
														
														if(count($feed_all)<1){
															$feed_image = "feedDefault.png";
														} else {
															$feed_image = $feed_all[0]->path; 
														}
														
														
														echo "<div class='feed-element'>".
															 	"<img class='img-circle pull-left' src='".base_url('uploads/thumbnail/'.$feed_image)."'>".
														    	"<div class='media-body '>".
														    		 "<small class='pull-right'>".$this->inquiry->ago($feed->added)."</small>".
														    		 "<strong>".$feed->title."</strong><br>".
														     		 "<small class='text-muted'>".$this->feed->read_more_text($feed->description)."</small>".
														     	"</div>".
														     "</div>";
														  
													}  
													
												?>
												
		                                </div>
		                                
		                                 <small class="pull-right text-navy"><a href='<?php echo site_url('feeds');?>'>View All</a></small>
		                                
		
		                            </div>
		                        </div>
		
		                    </div>
		                </div>
		                 
		
		            </div>
		
		
		        </div>
		        </div>
			</div>
			
					
        