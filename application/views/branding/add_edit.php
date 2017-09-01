			<?php
			$this->lang->load('ps','english');
			?>
			<ul class="breadcrumb">
				<li><a href="<?php echo site_url() . "/dashboard";?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
				
				<li><?php echo $this->lang->line('branding_label')?></li>
			</ul>
			<br/>
			
			<!-- Message -->
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
			<?php
			$attributes = array('id' => 'category-form');
			echo form_open(site_url('configs/edit/1'), $attributes);
			?>
				
				<div class="row">
					<div class="col-sm-6">
						<legend><?php echo $this->lang->line('branding_info_label')?></legend>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('category_name_label')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('category_name_label')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>
							<input class="form-control" type="text" placeholder="Company Name" name='company_name' id='company_name' value='<?php echo $branding->company_name;?>'>
						</div>
						<div class="form-group">
							<label><?php echo $this->lang->line('slugon_label')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('slugon_label')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>
							<input class="form-control" type="text" placeholder="slugon" name='slugon' id='slugon'
								value='<?php echo $branding->slugon;?>'>
						</div>
						<div class="form-group">
							<label><?php echo $this->lang->line('contact_email_label')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('contact_email_label')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>
							<input class="form-control" type="text" placeholder="contact email" name='contact_email' id='contact_email'
								value='<?php echo $branding->contact_email;?>'>
						</div>
                                                <div class="form-group">
							<label><?php echo $this->lang->line('about_us_label')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('about_us_label')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>
                                                        <textarea class="form-control" name="about_us" placeholder="about us" rows="9"><?php echo $branding->about_us;?></textarea>
						</div>
                                                <div class="form-group">
							<label><?php echo $this->lang->line('contact_address_label')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('contact_address_label')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>
                                                        <textarea class="form-control" name="contact_address" placeholder="contact address" rows="9"><?php echo $branding->contact_address;?></textarea>
						</div>
						<label><?php echo $this->lang->line('compnay_logo_label')?>
							<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('compnay_logo_label')?>">
								<span class='glyphicon glyphicon-info-sign menu-icon'>
							</a>
						</label> <a class="btn btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage"><?php echo $this->lang->line('replace_photo_button')?></a>
						<hr/>					
						<?php
							$images = $this->image->get_all_by_type($branding->id, 'branding')->result();
							if(count($images) > 0):
						?>
							<div class="row">
							<?php
								$i= 0;
								foreach ($images as $img) {
									if ($i>0 && $i%3==0) {
										echo "</div><div class='row'>";
									}
									
									echo '<div class="col-md-4" style="height:100"><div class="thumbnail">'.
										'<img src="'.base_url('uploads/thumbnail/'.$img->path).'"><br/>'.
										'<p class="text-center">'.
										'<a data-toggle="modal" data-target="#deletePhoto" class="delete-img" id="'.$img->id.'"   
											image="'.$img->path.'">Remove</a></p>'.
										'</div></div>';
								   $i++;
								}
							?>
							</div>
						
						<?php
							endif;
						?>
						
					</div>
				</div>
							
				
				<hr/>
				
				<button type="submit" class="btn btn-primary"><?php echo $this->lang->line('update_button')?></button>
				<a href="<?php echo site_url('configs');?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button')?></a>
			</form>
			</div>
			
			<div class="modal fade"  id="uploadImage">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title"><?php echo $this->lang->line('replace_photo_button')?></h4>
						</div>
						<?php
						$attributes = array('id' => 'upload-form','enctype' => 'multipart/form-data');
						echo form_open(site_url("configs/upload/".$branding->id), $attributes);
						?>
							<div class="modal-body">
								<div class="form-group">
									<label><?php echo $this->lang->line('upload_photo_label')?></label>
									<input type="file" name="images1">
								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" value="Upload" class="btn btn-primary"/>
								<a type="button" class="btn btn-primary" data-dismiss="modal"><?php echo $this->lang->line('cancel_button')?></a>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<div class="modal fade"  id="deletePhoto">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title"><?php echo $this->lang->line('delete_cover_photo_label')?></h4>
						</div>
						<div class="modal-body">
							<p><?php echo $this->lang->line('delete_photo_confirm_message')?></p>
						</div>
						<div class="modal-footer">
							<a type="button" class="btn btn-primary btn-delete-image"><?php echo $this->lang->line('yes_button')?></a>
							<a type="button" class="btn btn-primary" data-dismiss="modal"><?php echo $this->lang->line('cancel_button')?></a>
						</div>
					</div>
				</div>			
			</div>

			<script>
				$(document).ready(function(){
					$('#category-form').validate({
						rules:{
							name:{
								required: true,
								minlength: 4,
								remote: '<?php echo site_url('categories/exists/'.$branding->id);?>'
							}
						},
						messages:{
							name:{
								required: "Please fill category name.",
								minlength: "The length of category name must be greater than 4",
								remote: "Category name is already existed in the system"
							}
						}
					});
					
					$('.delete-img').click(function(e){
						e.preventDefault();
						var id = $(this).attr('id');
						var image = $(this).attr('image');
						var action = '<?php echo site_url('configs/delete_image/'.$branding->id);?>/' + id + '/' + image;
						$('.btn-delete-image').attr('href', action);
					});
				});
				
				$(function () { $("[data-toggle='tooltip']").tooltip(); });
			</script>

