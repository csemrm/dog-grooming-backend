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
                                Add New Appointment
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'shop-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('reservations/create'), $attributes);
                ?> 
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                Appointment :
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                For A:
                            </label>
                            <div class="col-lg-9">
                                <ul>
                                    <?php
                                    $works = array('Dog Walk', 'Wash', 'Hair Cut', 'Nail Trimming', 'Flea Treatment', 'Over night vacation');
                                    foreach ($works as $work) {

                                        echo "<li><label class='checkbox'>";
                                        echo form_checkbox("note[]", $work, $work, true);
                                        echo $work . "</label></li>";
                                    }
                                    ?>
                                </ul>
                            </div>
                        </div> 
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('feed_list_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <select class="form-control" name='promo_id' id='promo_id'>
                                    <option value='' ><?php echo $this->lang->line('feed_list_label') ?></option>
                                    <?php
                                    foreach ($this->feed->get_all($this->shop->get_current_shop()->id)->result() as $feed)
                                        echo "<option value='" . $feed->id . "'>" . $feed->title . "</option>";
                                    ?>
                                </select>
                            </div>
                        </div> 

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Email Address
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control m-input" type="text" placeholder="Email" name='user_email' id='user_email'>
                            </div>
                        </div>

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Phone number
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control m-input" type="text" placeholder="Phone number" name='user_phone_no' id='user_phone_no'>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_date_label') ?>
                            </label>
                            <div class="col-lg-9">
                                <div class='input-group date' id='m_datepicker_1_validate'>
                                    <input class="form-control m-input" type="date" readonly placeholder="MM/DD/YYYY" name='resv_date' id='resv_date'>
                                    <span class="input-group-addon">
                                        <i class="la la-calendar-check-o"></i>
                                    </span>
                                </div>
                            </div>
                        </div> 
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_time_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control m-input" type="time" placeholder="HH:MM" name='resv_time' id='m_timepicker_1' >

                            </div>
                        </div> 
                    </div>
                    <div class="m-portlet__foot m-portlet__foot--fit">
                        <div class="m-form__actions m-form__actions">
                            <div class="row">

                                <div class="col-lg-2"></div>
                                <div class="col-lg-6">
                                    <input type="hidden"  name="dog_id" id="dog_id" value="<?php echo $category->id ?>"/> 
                                    <input type="hidden"  name="user_id" id="user_id" value="<?php echo $category->appuser_id ?>"/> 
                                    <input type="hidden"  name="redirect" id="redirect" value="<?php echo site_url('appusers/detail/' . $category->appuser_id); ?>"/> 
                                    <input type="submit" name="save" value="<?php echo $this->lang->line('save_button') ?>" class="btn btn-primary"/>
                                    <a href="<?php echo site_url('appusers/detail/' . $category->appuser_id); ?>" class="btn btn-secondary"><?php echo $this->lang->line('cancel_button') ?></a>

                                </div>
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
<script src="<?php echo base_url('/theme/assets/default/custom/components/forms/widgets/bootstrap-datepicker.js') ?>" type="text/javascript"></script>
<script src="<?php echo base_url('/theme/assets/default/custom/components/forms/widgets/bootstrap-timepicker.js') ?>" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $(function () {
            $("[data-toggle='tooltip']").tooltip();
        });
    });
    $("#m_datepicker_1_validate").datepicker({
        todayHighlight: !0,
        dateFormat: "YYYY-MM-DD"
    });
    $("#m_timepicker_1").timepicker({
        'minTime': 'now',
        'timeFormat': 'H:m:s'
    });
    $('#shop-form').validate({
        rules: {
            dog_id: {
                required: true
            },
            resv_date: {
                required: true
            },
            m_timepicker_1: {
                required: true
            },
            user_phone_no: {
                required: true,
            },
            user_email: {
                required: true,
                email: true
            }
        },
        messages: {
            dog_id: {
                required: "Please Fill pet."
            },
            resv_date: {
                required: "Please Fill date."
            },
            m_timepicker_1: {
                required: "Please Fill time."
            },
            user_phone_no: {
                required: "Please Fill phone."
            }, user_email: {
                required: "Please Fill email",
                email: "Email format is wrong"
            }
        }
    });
</script>