			<?php
				$this->lang->load('ps', 'english');
			?>
			<ul class="breadcrumb">
				<li><a href="<?php echo site_url() . "/dashboard";?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
				<li><?php echo $this->lang->line('cat_list_label')?></li>
				<li><?php echo $this->lang->line('search_result_label')?></li>
			</ul>
			
			<div class='row'>
				<div class='col-sm-9'>
					<?php
					$attributes = array('class' => 'form-inline');
					echo form_open(site_url('dogs/search'), $attributes);
					?>
						<div class="form-group">
					   	<input type="text" name="searchterm" class="form-control" placeholder="Search"
					   		value="<?php echo $searchterm;?>">
					  	</div>
					  	<button type="submit" class="btn btn-default"><?php echo $this->lang->line('search_button')?></button>
					  	<a href='<?php echo site_url('dogs');?>' class="btn btn-default"><?php echo $this->lang->line('reset_button')?></a>
					</form>
				</div>	
				<div class='col-sm-3'>
					<a href='<?php echo site_url('dogs/add');?>' class='btn btn-primary pull-right'><span class='glyphicon glyphicon-plus'></span>
					<?php echo $this->lang->line('add_new_cat_button')?></a>
				</div>
			</div>
			
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
			<table class="table table-striped table-bordered">
				<tr>
					<th><?php echo $this->lang->line('no_label')?></th>
					<th><?php echo $this->lang->line('category_name_label')?></th>
					<?php 
						if(!$this->session->userdata('is_shop_admin')) { 
							if(in_array('edit',$allowed_accesses)):?>
								<th><?php echo $this->lang->line('edit_label')?></th>
					<?php endif; } else { ?>
								<th><?php echo $this->lang->line('edit_label')?></th>
					<?php } ?>
					
					<?php 
						if(!$this->session->userdata('is_shop_admin')) { 
							if(in_array('delete',$allowed_accesses)):?>
								<th><?php echo $this->lang->line('delete_label')?></th>
					<?php endif; } else { ?>
								<th><?php echo $this->lang->line('delete_label')?></th>
					<?php } ?>
					
					<?php 
						if(!$this->session->userdata('is_shop_admin')) { 
							if(in_array('publish',$allowed_accesses)):?>
								<th><?php echo $this->lang->line('publish_label')?></th>
					<?php endif; } else { ?>
								<th><?php echo $this->lang->line('publish_label')?></th>
					<?php } ?>
				</tr>
				<?php
					if(!$count=$this->uri->segment(3))
						$count = 0;
					if(isset($categories) && count($categories->result())>0):
						foreach($categories->result() as $category):					
				?>
						<tr>
							<td><?php echo ++$count;?></td>
							<td><?php echo $category->name;?></td>
							<?php 
								if(!$this->session->userdata('is_shop_admin')) { 
									if(in_array('edit',$allowed_accesses)):?>
										<td><a href='<?php echo site_url("dogs/edit/".$category->id);?>'><i class='glyphicon glyphicon-edit'></i></a></td>
							<?php endif; } else { ?>
										<td><a href='<?php echo site_url("dogs/edit/".$category->id);?>'><i class='glyphicon glyphicon-edit'></i></a></td>
							<?php } ?>
							<?php 
								if(!$this->session->userdata('is_shop_admin')) {
									if(in_array('delete',$allowed_accesses)):?>
										<td><a href='<?php echo site_url("dogs/delete/".$category->id);?>'><i class='glyphicon glyphicon-trash'></i></a></td>
							<?php endif; } else { ?>
										<td><a href='<?php echo site_url("dogs/delete/".$category->id);?>'><i class='glyphicon glyphicon-trash'></i></a></td>
							<?php } ?>
							<?php 
								if(!$this->session->userdata('is_shop_admin')) {
									if(in_array('publish',$allowed_accesses)):?>
										<td>
											<?php if($category->is_published == 1):?>
												<button class="btn btn-sm btn-primary unpublish" 
												catId='<?php echo $category->id;?>'>Yes</button>
											<?php else:?>
												<button class="btn btn-sm btn-danger publish" 
												catId='<?php echo $category->id;?>'>No</button><?php endif;?>
										</td>
							<?php endif; } else { ?>
										<td>
											<?php if($category->is_published == 1):?>
												<button class="btn btn-sm btn-primary unpublish" 
												catId='<?php echo $category->id;?>'>Yes</button>
											<?php else:?>
												<button class="btn btn-sm btn-danger publish" 
												catId='<?php echo $category->id;?>'>No</button><?php endif;?>
										</td>
							<?php } ?>
						</tr>
						<?php
						endforeach;
					else:
				?>
						<tr>
							<td colspan='7'>
							<span class='glyphicon glyphicon-warning-sign menu-icon'></span>
							<?php echo $this->lang->line('no_cat_data_message')?>
							</td>
						</tr>
				<?php
					endif;
				?>
			</table>
			</div>
			<?php 
				$this->pagination->initialize($pag);
				echo $this->pagination->create_links();
			?>

			<script>
			$(document).ready(function(){
				$(document).delegate('.publish','click',function(){
					var btn = $(this);
					var id = $(this).attr('catid');
					$.ajax({
						url: '<?php echo site_url('dogs/publish');?>/'+id,
						method:'GET',
						success:function(msg){
							if(msg == 'true')
								btn.addClass('unpublish').addClass('btn-primary')
									.removeClass('publish').removeClass('btn-danger')
									.html('Yes');
							else
								alert('System error occured. Please contact your system administrator.');
						}
					});
				});
				
				$(document).delegate('.unpublish','click',function(){
					var btn = $(this);
					var id = $(this).attr('catid');
					$.ajax({
						url: '<?php echo site_url('dogs/unpublish');?>/'+id,
						method:'GET',
						success:function(msg){
							if(msg == 'true')
								btn.addClass('publish').addClass('btn-danger')
									.removeClass('unpublish').removeClass('btn-primary')
									.html('No');
							else
								alert('System error occured. Please contact your system administrator.');
						}
					})
				});
			});
			</script>
