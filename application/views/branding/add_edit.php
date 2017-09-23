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
                                <?php echo $this->lang->line('branding_label') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'category-form', "class" => "m-form m-form--label-align-right");
                echo form_open(site_url('configs/edit/1'), $attributes);
                ?> 
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                Company Info:
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('company_name_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Company Name" name='company_name' id='company_name' value='<?php echo $branding->company_name; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('company_name_label') ?>
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('contact_email_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="contact email address" name='contact_email' id='contact_email' value='<?php echo $branding->contact_email; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('contact_email_label') ?>
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('contact_address_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="contact address" name='contact_address' id='contact_address' value='<?php echo $branding->contact_address; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('contact_address_label') ?>
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Company Phone
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Company Phone" name='company_phone' id='company_phone' value='<?php echo $branding->company_phone; ?>'>
                            </div>
                        </div>

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Website
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Company Website" name='website' id='website' value='<?php echo $branding->website; ?>'>
                            </div>
                        </div>

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Facebook Page URL
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Facebook" name='facebook' id='facebook' value='<?php echo $branding->facebook; ?>'>
                            </div>
                        </div>

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Twitter Page URL
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Twitter" name='twitter' id='twitter' value='<?php echo $branding->twitter; ?>'>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Photo Upload 
                            </label>  
                            <div class="col-lg-9">
                                <a class="btn btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage">Replace Photo</a>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">

                            </label>
                            <div class="col-lg-9">
                                <?php
                                $images = $this->image->get_all_by_type($branding->id, 'branding')->result();
                                if (count($images) > 0):
                                    ?>

                                    <?php
                                    $i = 0;
                                    foreach ($images as $img) {


                                        echo '<div class="col-md-4" style="height:100">'
                                        . '<div class="thumbnail">' .
                                        '<img src="' . base_url('uploads/thumbnail/' . $img->path) . '">' .
                                        '</div>'
                                        . '</div>';
                                        $i++;
                                    }
                                    ?>


                                    <?php
                                endif;
                                ?> 
                            </div>

                        </div>
                    </div>
                    <div class="m-form__seperator m-form__seperator--dashed"></div>
                    <div class="m-form__section">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                Email Info:
                            </h3>
                        </div> 

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Email Address
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Email Address" name='email_address' id='email_address' value='<?php echo $branding->email_address; ?>'>

                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Username
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Username" name='email_username' id='email_username' value='<?php echo $branding->email_username; ?>'>


                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Password
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="password" placeholder="Password" name='email_password' id='email_password' value='<?php echo $branding->email_password; ?>'>


                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                SMTP Server
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="SMTP Server" name='email_smtpserver' id='email_smtpserver' value='<?php echo $branding->email_smtpserver; ?>'>


                            </div>
                        </div>

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                SMTP Port
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Port" name='email_smtp_port' id='email_smtp_port' value='<?php echo $branding->email_smtp_port; ?>'>


                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Security
                            </label>
                            <div class="col-lg-9">
                                <div class="">
                                    <label class="m-radio">
                                        <?php $email_ssl = $branding->email_ssl; ?>
                                        <input type="radio" name="email_ssl" value="0"  <?php echo ($branding->email_ssl == 0) ? 'checked=""' : ''; ?> >
                                        Unencrypted 
                                        <span></span>
                                    </label>
                                    <label class="m-radio">
                                        <input type="radio" name="email_ssl" <?php echo ($branding->email_ssl == 1) ? 'checked=""' : ''; ?> value="1">
                                        SSL/TLS (Recommended) 
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="m-form__seperator m-form__seperator--dashed"></div>
                    <div class="m-form__section ">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                Mailchimp Info:
                            </h3>
                        </div> 

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Username
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="Mailchimp Username" name='mailchimp_username' id='mailchimp_username' value='<?php echo $branding->mailchimp_username; ?>'>

                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                API Key
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="API Key" name='mailchimp_apikey' id='mailchimp_apikey' value='<?php echo $branding->mailchimp_apikey; ?>'>


                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Enable
                            </label>
                            <div class="col-lg-9">
                                <span class="m-switch">
                                    <label>
                                        <input type="checkbox" value="1" <?php echo ($branding->mailchimp_enable == 1) ? 'checked' : ''; ?> name="mailchimp_enable">
                                        <span></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                    </div>
                    <div class="m-form__seperator m-form__seperator--dashed"></div>
                    <div class="m-form__section m-form__section--last">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                Services/Menu Offered:
                            </h3>
                        </div> 

                        <div class="form-group m-form__group row">
                            
                            <div class="col-lg-6">

                                <table class="table table-striped table-bordered">
                                    <tr>
                                        <th><?php echo $this->lang->line('no_label') ?></th>
                                        <th> Service Name</th>
                                        <th><?php echo $this->lang->line('delete_label') ?></th>



                                    </tr>
                                    <?php
                                    $count = 0;
                                    $services = explode(',', $branding->services);
                                    foreach ($services as $service):
                                        if ($service):
                                            ?>
                                            <tr>
                                                <td><?php echo ++$count; ?></td>
                                                <td><?php echo $service; ?></td>
                                                <td><a class='btn-delete' data-toggle="modal" data-target="#myModal" title="<?php echo $service; ?>"class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete"><i class="la la-trash"></i></a></td>
                                            </tr>
                                            <?php
                                        endif;
                                    endforeach;
                                    ?>
                                    <tr>
                                        <td colspan='3'>
                                            <a data-toggle="modal" data-target="#addServices" id="newservice" class="m-portlet__nav-link btn m-btn m-btn--icon m-btn--icon-only m-btn--pill" title="Add">Add Service</a>
                                        </td>
                                    </tr> 
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions">
                        <div class="row">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-6">
                                <input type="submit" value="Save" class="btn btn-primary" />
                                <button type="reset" class="btn btn-secondary">
                                    Cancel
                                </button>
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
<div class="modal fade"  id="uploadImage">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title"><?php echo $this->lang->line('replace_photo_button') ?></h4>
            </div>
            <?php
            $attributes = array('id' => 'upload-form', 'enctype' => 'multipart/form-data');
            echo form_open(site_url("configs/upload/" . $branding->id), $attributes);
            ?>
            <div class="modal-body">
                <div class="form-group">
                    <label><?php echo $this->lang->line('upload_photo_label') ?></label>
                    <input type="file" name="images1">
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" value="Upload" class="btn btn-primary"/>
                <a type="button" class="btn btn-primary" data-dismiss="modal"><?php echo $this->lang->line('cancel_button') ?></a>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade"  id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Delete Service</h4>
            </div>
            <div class="modal-body">
                <p><?php echo $this->lang->line('delete_confirm_message') ?></p>  
            </div>
            <div class="modal-footer"> 
                <a type="button" class="btn btn-primary btn-yes" href='<?php echo site_url('configs/delete_service/' . $branding->id); ?>'>
                    <?php echo $this->lang->line('yes_all_label') ?></a>
                <a type="button" class="btn btn-secondary" data-dismiss="modal">
                    <?php echo $this->lang->line('cancel_button') ?></a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade"  id="addServices">
    <div class="modal-dialog">
        <?php
        $attributes = array('id' => 'add_service-form', "class" => "m-form m-form--label-align-right");
        echo form_open(site_url('configs/add_service'), $attributes);
        ?> 
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">New Service</h4>
            </div>
            <div class="form-group">
                <label class="col-lg-12 col-form-label">Service Name</label>
                <div class="col-lg-12">
                    <input type="text" id="service" required="" name="service">
                    <input type="hidden"required="" value="<?= $branding->id ?>" name="brandingid">
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="<?php echo $this->lang->line('yes_button') ?>"/>
                <a type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo $this->lang->line('cancel_button') ?></a>
            </div>
        </div>
         <?php echo form_close(); ?>
    </div>			
</div>
<script>
    $(document).ready(function () {
        $('#category-form').validate({
            rules: {
                company_name: {
                    required: true,
                    minlength: 3,
                }
            },
            messages: {
                company_name: {
                    required: "Please fill category name.",
                    minlength: "The length of name must be greater than 4"
                }
            }
        });


        $('.btn-delete').click(function (e) {
            e.preventDefault();
            var title = $(this).attr('title');
            var btnYes = $('.btn-yes').attr('href');
            $('.btn-yes').attr('href', btnYes + "/" + title);

        });

    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>

