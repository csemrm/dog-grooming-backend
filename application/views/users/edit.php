<?php
$this->lang->load('ps', 'english');
?>
<div class="m-content">
    <!--Begin::Main Portlet-->
    <div class='row'>
        <!-- Message -->
        <?php if ($this->session->flashdata('success')): ?>
            <div class="alert alert-success fade in">
                <?php echo $this->session->flashdata('success'); ?>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            </div>
        <?php elseif ($this->session->flashdata('error')): ?>
            <div class="alert alert-danger fade in">
                <?php echo $this->session->flashdata('error'); ?>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            </div>
        <?php endif; ?>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <!--begin::Portlet-->
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <?php echo $this->lang->line('update_user_label') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'user-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('users/edit/'.$user->user_id), $attributes);
                ?> 
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                <?php echo $this->lang->line('user_info_label') ?>:
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('username_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="username" name='user_name' id='user_name' value='<?php echo $user->user_name;?>'>

                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('email_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control m-input" type="text" placeholder="Email" name='user_email' id='user_email' value='<?php echo $user->user_email;?>'>

                            </div>
                        </div> 
                    </div>
                    <div class="form-group m-form__group row">
                        <label class="col-lg-3 col-form-label">
                            <?php echo $this->lang->line('password_label') ?>
                        </label>
                        <div class="col-lg-9"> 
                            <input class="form-control m-input" type="password" placeholder="Password" name='user_password' id='user_password'>

                        </div>
                    </div> 
                    <div class="form-group m-form__group row">
                        <label class="col-lg-3 col-form-label">
                            <?php echo $this->lang->line('confirm_password_label') ?>
                        </label>
                        <div class="col-lg-9"> 
                            <input class="form-control m-input" type="password" placeholder="Confirm Password" name='conf_password' id='conf_password'>

                        </div>
                    </div>




                    <div class="form-group m-form__group row">
                        <label class="col-lg-3 col-form-label">
                            <?php echo $this->lang->line('user_role_label') ?>
                        </label>
                        <div class="col-lg-9"> 
                            <select class="form-control" name='role_id' id='role_id'>
                                <?php
										foreach($this->role->get_all()->result() as $role){
											echo "<option value='".$role->role_id."' ";
											echo ($role->role_id == $user->role_id)? "selected":"";
											echo ">".$role->role_desc."</option>";
										}
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group m-form__group row">
                        <label class="col-lg-3 col-form-label">
                            <?php echo $this->lang->line('allowed_modules_label') ?>
                        </label>
                        <div class="col-lg-9"> 
                            <?php
									foreach($this->module->get_all()->result() as $module)
									{
										echo "<label class='checkbox'>";
										echo form_checkbox("permissions[]",$module->module_id,$this->user->has_permission($module->module_name,$user->user_id));
										echo $module->module_desc."</label><br/>";						
									}
                            ?>   
                        </div>
                    </div>


                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions">
                        <div class="row">

                            <div class="col-lg-2"></div>
                            <div class="col-lg-6">
                                <button type="submit" class="btn btn-primary"><?php echo $this->lang->line('update_button')?></button>
                                <a href="<?php echo site_url('users'); ?>" class="btn btn-secondary"><?php echo $this->lang->line('cancel_button') ?></a>

                            </div>
                        </div>
                    </div>
                </div>

                <?php echo form_close(); ?>
                <!--end::Form-->
            </div>

            <!--end::Portlet-->
        </div>
    </div>
</div> 	 
<script>
    $(document).ready(function () {
        $('#user-form').validate({
            rules: {
                user_name: {
                    required: true,
                    minlength: 4,
                    remote: '<?php echo site_url('users/exists/' . $user->user_id); ?>'
                },
                user_email: {
                    required: true,
                    email: true
                },
                user_password: {
                    minlength: 4
                },
                conf_password: {
                    equalTo: '#user_password'
                }
            },
            messages: {
                user_name: {
                    required: "Please fill user name.",
                    minlength: "The length of username must be greater than 4",
                    remote: "Username is already existed in the system"
                },
                user_email: {
                    required: "Please fill email address",
                    email: "Please provide valid email address"
                },
                user_password: {
                    minlength: "The length of password must be greater than 4"
                },
                conf_password: {
                    equalTo: "Password and confirm password do not match."
                }
            }
        });
    });
</script>
