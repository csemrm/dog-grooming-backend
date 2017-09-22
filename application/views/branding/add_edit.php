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
                                <?php echo $this->lang->line('slugon_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="slugon" name='slugon' id='slugon' value='<?php echo $branding->slugon; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('slugon_label') ?>
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
                                <?php echo $this->lang->line('about_us_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="about us" name='about_us' id='about_us' value='<?php echo $branding->about_us; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('about_us_label') ?>
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
                                <?php echo $this->lang->line('contact_address_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="contact address" name='contact_address' id='contact_address' value='<?php echo $branding->contact_address; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('contact_address_label') ?>
                                </span>
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
                                <?php echo $this->lang->line('contact_address_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="contact address" name='contact_address' id='contact_address' value='<?php echo $branding->contact_address; ?>'>

                                <span class="m-form__help">
                                    <?php echo $this->lang->line('contact_address_label') ?>
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
                    </div>
                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions">
                        <div class="row">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-6">
                                <button type="reset" class="btn btn-primary">
                                    Submit
                                </button>
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



<div class="modal fade"  id="deletePhoto">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"><?php echo $this->lang->line('delete_cover_photo_label') ?></h4>
            </div>
            <div class="modal-body">
                <p><?php echo $this->lang->line('delete_photo_confirm_message') ?></p>
            </div>
            <div class="modal-footer">
                <a type="button" class="btn btn-primary btn-delete-image"><?php echo $this->lang->line('yes_button') ?></a>
                <a type="button" class="btn btn-primary" data-dismiss="modal"><?php echo $this->lang->line('cancel_button') ?></a>
            </div>
        </div>
    </div>			
</div>
<script>
    $(document).ready(function () {
        $('#category-form').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 4,
                    remote: '<?php echo site_url('categories/exists/' . $branding->id); ?>'
                }
            },
            messages: {
                name: {
                    required: "Please fill category name.",
                    minlength: "The length of category name must be greater than 4",
                    remote: "Category name is already existed in the system"
                }
            }
        });

        $('.delete-img').click(function (e) {
            e.preventDefault();
            var id = $(this).attr('id');
            var image = $(this).attr('image');
            var action = '<?php echo site_url('configs/delete_image/' . $branding->id); ?>/' + id + '/' + image;
            $('.btn-delete-image').attr('href', action);
        });
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>

