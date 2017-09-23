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
                                <?php echo $this->lang->line('add_new_feed_button') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'feed-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('feeds/add'), $attributes);
                ?> 
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                <?php echo $this->lang->line('feed_info_lable') ?>:
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('feed_title_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <input class="form-control m-input" type="text" placeholder="title" name='title' id='title' value=''>
                                <span class="m-form__help">
                                    <?php echo $this->lang->line('feed_title_tooltips') ?>
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('description_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <textarea class="form-control" name="description" placeholder="Description" rows="9"></textarea>
                                <span class="m-form__help">
                                    <?php echo $this->lang->line('feed_description_tooltips') ?>
                                </span>
                            </div>
                        </div> 
                        
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Expires On
                            </label>
                            <div class="col-lg-9">
                                <div class='input-group date' id='m_datepicker_1_validate'>
                                    <input class="form-control m-input" type="date" readonly placeholder="MM/DD/YYYY" name='expired_date' id='expired_date'>
                                    <span class="input-group-addon">
                                        <i class="la la-calendar-check-o"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions">
                        <div class="row">

                            <div class="col-lg-2"></div>
                            <div class="col-lg-6">
                                <input type="submit" name="save" value="<?php echo $this->lang->line('save_button') ?>" class="btn btn-primary"/>
                                <a href="<?php echo site_url('feeds'); ?>" class="btn btn-secondary"><?php echo $this->lang->line('cancel_button') ?></a>

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
        $("#m_datepicker_1_validate").datepicker({
        todayHighlight: !0,
        dateFormat: "YYYY-MM-DD"
    });
        $('#feed-form').validate({
            rules: {
                title: {
                    required: true,
                    minlength: 4
                }
            },
            messages: {
                title: {
                    required: "Please fill title.",
                    minlength: "The length of title must be greater than 4"
                }
            }
        });
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });

</script>

