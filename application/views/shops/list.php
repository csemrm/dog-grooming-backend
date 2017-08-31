<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>
    	<?php
    		$this->lang->load('ps', 'english');
    		echo $this->lang->line('site_title');
    	?>
    </title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url('css/bootstrap.min.css');?>" rel="stylesheet">
	 <link href="<?php echo base_url('fonts/ptsan/stylesheet.css');?>" rel="stylesheet">
	 <link href="<?php echo base_url('css/animate.css');?>" rel="stylesheet">
	 <link href="<?php echo base_url('css/dashboard.css');?>" rel="stylesheet">
	 <!-- Font CSS -->
	 <link href="<?php echo base_url('css/font-awesome/css/font-awesome.min.css');?>" rel="stylesheet">
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php echo base_url('js/jquery.js');?>"></script>
    <script src="<?php echo base_url('js/bootstrap.min.js');?>"></script>
    <script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
    
    <script src="<?php echo base_url('js/peity/jquery.peity.min.js');?>"></script>
    <script src="<?php echo base_url('js/peity/peity-demo.js');?>"></script>
	</head>
	<body>
		<div class="navbar navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">	
						<label class="login-title">Restaurateur</label>
					</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Account
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<div class="navbar-content">
										<div class="row">
											<div class="col-md-5">
												<img src="<?php echo base_url('img/fokhwar.png');?>" alt="Alternate Text" class="img-responsive"/>
												<!--<p class="text-center small">
													<a href="#">Change Photo</a>
												</p>-->
											</div>
											<div class="col-md-7">
												<?php $logged_in_user = $this->user->get_logged_in_user_info();?>
												<span><?php echo $logged_in_user->user_name;?></span>
												<p class="text-muted small"><?php echo $this->role->get_name($logged_in_user->role_id);?></p>
												<!--<div class="divider"></div>
												<a href="<?php echo site_url('profile');?>" class="btn btn-sm active">Edit Profile</a>-->
											</div>
										</div>
									</div>
									<div class="navbar-footer">
										<div class="navbar-footer-content">
											<div class="row">
												<div class="col-md-6">
													<a href="<?php echo site_url('profile');?>" class="btn btn-default btn-sm" style="background-color: #fff; border-radius: 0;">Edit Profile</a>
												</div>
												<div class="col-md-6">
													<a href="<?php echo site_url('logout');?>" class="btn btn-default btn-sm pull-right" style="background-color: #fff; border-radius: 0;">Sign Out</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="container-fluid animated fadeInRight">
			<div class="row" style="padding: 10px 0px;">
				<div class="col-md-12 text-center">
					<?php
						$attributes = array('id' => 'category-form', 'class'=>'form-inline'); 
						echo form_open(site_url('shops'), $attributes);
					?>
					  <div class="form-group">
					    <label class="sr-only" for="shopname">Restaurant Name</label>
					    <input name="searchterm" type="text" class="form-control" id="shopname" placeholder="Enter Restaurant Name"
					     style="width: 300px" value='<?php echo (isset($searchterm))? $searchterm: ""; ?>'>
					  </div>
					  <button type="submit" class="btn btn-primary"> &#10148; &nbsp; Search Restaurant</button>
					  <a class="btn btn-primary" href="<?php echo site_url('shops/create');?>"> 
					  	&#10148; &nbsp; Create New Restaurant
					  </a>
					</form>
				</div>
			</div>
			
			<?php
				$index = 0;
				foreach ($shops as $shop) {
					//echo $index . " # ";
					if (($index % 3) == 0) {
						echo '<div class="row">';
					}
					$index++;
			?>
			
			<div class="col-md-4">
				<div class="grid" style="text-align: left;">
					<div class="ibox float-e-margins">
					        <div class="ibox-title">
					            <h4><strong><?php echo $shop->name; ?></strong></h4>
					        </div>
					        <div>
					            <div class="ibox-content no-padding border-left-right">
					                <a href="<?php echo site_url('dashboard/index/'. $shop->id);?>">
						                <?php
						                	echo "<img alt='image' class='img-responsive' src='".base_url('uploads/'.$shop->image)."'/>";
						                ?>
					                </a>
					            </div>
					            <div class="ibox-content profile-content">
					                <h5>
					                    <strong>Address</strong>
					                </h5>
					                <p><i class="fa fa-map-marker" style="padding-right: 5px;"></i><?php echo $shop->address; ?></p>
					                <h5>
					                    <strong>About Shop</strong>
					                </h5>
					                <p>
					                    <?php 
					                    	
					                    	$shopDesc = strip_tags($shop->description);
					                    	
					                    	if (strlen($shopDesc) > 200) {
					                    	
					                    	    $stringCut = substr($shopDesc, 0, 200);
					                
					                    	    $shopDesc = substr($stringCut, 0, strrpos($stringCut, ' ')).'...'; 
					                    	}
					                    	
					                    	echo $shopDesc;
					                    	
					                    ?>
					                </p>
					                <div class="row m-t-lg">
					                    
					                    <div class="col-md-4">
					                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
					                        <p><?php echo $this->category->count_all($shop->id) ?>  Categories</p>
					                    </div>
					                    <div class="col-md-4">
					                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
					                        <p><?php echo $this->item->count_all($shop->id) ?> Items</p>
					                    </div>
					                    <div class="col-md-4">
					                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
					                        <p><?php echo $this->transaction_header->count_all_by($shop->id) ?> Transactions</p>
					                    </div>
					                </div>
					                <div class="user-button">
					                    <div class="row">
					                        <a href="<?php echo site_url('dashboard/index/'. $shop->id);?>">
					                        	<button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-dashboard" style="padding-right: 5px;"></i>Dashboard</button>
					                        </a>
					                    </div>
					                </div>
					            </div>
					    </div>
				    </div>
				</div>
			</div>
			
			<?php
					if (($index % 3) == 0) {
						echo '</div>';
					}
				}
			?>
			
		</div>
		
	</body>
	<script>
	    $(document).ready(function(){
	        $('.grid').each(function() {
	            animationHover(this, 'pulse');
	        });
	    });
	    
	    function animationHover(element, animation){
	        element = $(element);
	        element.hover(
	            function() {
	                element.addClass('animated ' + animation);
	            },
	            function(){
	                window.setTimeout( function(){
	                    element.removeClass('animated ' + animation);
	                }, 1500);
	            });
	    }
	</script>
</html>