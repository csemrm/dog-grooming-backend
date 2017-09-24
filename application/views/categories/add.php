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
                                <?php echo $this->lang->line('add_new_cat_button') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'category-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('dogs/add'), $attributes);
                ?> 
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                <?php echo $this->lang->line('cat_info_lable') ?>:
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('username_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <select class="form-control" name='appuser_id' id='appuser_id'>
                                    <?php
                                    foreach ($this->appuser->get_all()->result() as $appuser)
                                        echo "<option value='" . $appuser->id . "'>" . $appuser->username . "</option>";
                                    ?>
                                </select>
                                <span class="m-form__help">
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('category_name_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control" type="text" name="name" placeholder="Name" id="name" />
                            </div>
                        </div> 
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Type
                            </label>
                            <div class="col-lg-9"> 
                                <div class="m-radio-list">
                                    <label class="m-radio"> 
                                        <input type="radio" name="type" value="Dog" >
                                        Dog 
                                        <span></span>
                                    </label>
                                    <label class="m-radio">
                                        <input type="radio" name="type"  value="Cat">
                                        Cat
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Sex
                            </label>
                            <div class="col-lg-9"> 
                                <div class="m-radio-list">
                                    <label class="m-radio"> 
                                        <input type="radio" name="gender" value="Male" >
                                        Male 
                                        <span></span>
                                    </label>
                                    <label class="m-radio">
                                        <input type="radio" name="gender"  value="Female">
                                        Female
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Weight
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control" type="text" name="weight" placeholder="Weight" id="weight" />
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">Bread
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control" type="text" name="bread" placeholder="bread" id="bread" />

                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('cat_photo_label') ?>
                            </label>
                            <div class="col-lg-9">

                                <input class="btn" type="file" name="images1"/>
                                <br/>
                                <span class="m-form__help">
                                    <?php echo $this->lang->line('cat_photo_tooltips') ?>
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
                                <button type="submit" class="btn btn-primary"><?php echo $this->lang->line('save_button') ?></button>
                                <a href="<?php echo site_url('dogs'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button') ?></a>
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
        $('#category-form').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 3,
                }
            },
            messages: {
                name: {
                    required: "Please fill pet name.",
                    minlength: "The length of pet name must be greater than 3",
                }
            }
        });
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>
