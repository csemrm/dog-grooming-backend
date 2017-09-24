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
                                <?php echo $this->lang->line('update_resv_label') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'reserve-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('reservations/edit/' . $reservation->id.'/'.$redirect), $attributes);
                ?>
                <div class="m-portlet__body">
                    <div class="m-form__section m-form__section--first">
                        <div class="m-form__heading">
                            <h3 class="m-form__heading-title">
                                <?php echo $this->lang->line('resv_info_lable') ?>:
                            </h3>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('cat_label') ?>
                            </label>
                            <div class="col-lg-9">  
                                <?php
                                $images = $this->image->get_all_by_type($reservation->dog_id, 'category')->result();
                                if (count($images) > 0):
                                    ?>

                                    <?php
                                    $i = 0;
                                    foreach ($images as $img) {

                                        echo ' 
                                <div class="col-md-4" style="height:100">
                                    <div class="thumbnail">' .
                                        '<img src="' . base_url('uploads/thumbnail/' . $img->path) . '"><br/>' .
                                        '</div>
                                </div>';
                                        $i++;
                                    }
                                endif;
                                ?>
                                <label class="col-lg-3 col-form-label">
                                    <?php echo $reservation->dog->name; ?>
                                </label>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_note') ?>
                            </label>
                            <div class="col-lg-9">
                                <ul>
                                    <?php
                                    $notes = explode(',', $reservation->note);

                                    foreach ($notes as $key => $value) {
                                        ?>
                                        <li><?php echo $value; ?></li>
                                        <?php
                                    }
                                    ?>
                                </ul>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_date_label') ?>
                            </label>
                            <div class="col-lg-9">  <label class="col-lg-3 col-form-label">
                                    <?php echo english_date_verbose( $reservation->resv_date); ?>
                                </label>
                            </div>
                        </div> 

                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_time_label') ?>
                            </label>
                            <div class="col-lg-9">  <label class="col-lg-3 col-form-label">
                                    <?php echo $reservation->resv_time; ?>
                                </label>
                            </div>
                        </div> 


                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('reserved_by') ?>
                            </label>
                            <div class="col-lg-9">  <label class="col-lg-3 col-form-label">
                                    <?php echo $reservation->user_name . "(" . $reservation->user_email . ")"; ?>
                                </label>
                            </div>
                        </div> 


                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_date_label') ?>
                            </label>
                            <div class="col-lg-9">  
                                <label class="col-lg-3 col-form-label">
                                    <?php echo $reservation->resv_date; ?>
                                </label>
                            </div>
                        </div> 
                        
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Phone#
                            </label>
                            <div class="col-lg-9">  
                                <label class="col-lg-3 col-form-label">
                                    <?php echo $reservation->user_phone_no; ?>
                                </label>
                            </div>
                        </div> 
                        
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                <?php echo $this->lang->line('resv_status') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <select  name="resv_status" id="resv_status">
                                    <?php
                                    $status = $this->reservation_status->get_all();
                                    foreach ($status->result() as $status) {
                                        echo "<option value='" . $status->id . "'";
                                        if ($reservation->status_id == $status->id) {
                                            echo " selected ";
                                        }
                                        echo ">" . $status->title . "</option>";
                                    }
                                    ?>
                                </select>
                            </div> 
                        </div> 
                    </div>


                    <div class="m-form__seperator m-form__seperator--dashed"></div>

                    <div class="m-portlet__foot m-portlet__foot--fit">
                        <div class="m-form__actions m-form__actions">
                            <div class="row">

                                <div class="col-lg-2"></div>
                                <div class="col-lg-6">
                                    <button type="submit" class="btn btn-primary"><?php echo $this->lang->line('update_button') ?></button>
                                    <a href="<?php echo site_url('reservations'); ?>" class="btn btn-secondary"><?php echo $this->lang->line('cancel_button') ?></a>
                                    <input type="hidden" id="resv_status_hidden" name="resv_status_hidden" value="<?php echo $reservation->status_id; ?>">
                                    <input type="hidden" id="resv_date_hidden" name="resv_date_hidden" value="<?php echo $reservation->resv_date; ?>">
                                    <input type="hidden" id="resv_time_hidden" name="resv_time_hidden" value="<?php echo $reservation->resv_time; ?>">
                                    <input type="hidden" id="resv_id_hidden" name="resv_id_hidden" value="<?php echo $reservation->id; ?>">

                                    <input type="hidden" id="resv_user_id_hidden" name="resv_user_id_hidden" value="<?php echo $reservation->user_id; ?>">
                                    <input type="hidden" id="resv_user_email_hidden" name="resv_user_email_hidden" value="<?php echo $reservation->user_email; ?>">
                                    <input type="hidden" id="resv_user_name_hidden" name="resv_user_name_hidden" value="<?php echo $reservation->user_name; ?>">
                                    <input type="hidden" id="resv_user_phone_hidden" name="resv_user_phone_hidden" value="<?php echo $reservation->user_phone_no; ?>">
                                    <input type="hidden" id="resv_shop_id_hidden" name="resv_shop_id_hidden" value="<?php echo $reservation->shop_id; ?>">
                                    <input type="hidden" id="resv_shop_id_hidden" name="resv_shop_id_hidden" value="<?php echo $reservation->shop_id; ?>">
                                    <input type="hidden" id="resv_promo_id_hidden" name="resv_promo_id_hidden" value="<?php echo $reservation->promo_id; ?>">
                                    <input type="hidden" id="resv_note_hidden" name="resv_note_hidden" value="<?php echo $reservation->note; ?>">


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

<script>

    $(document).ready(function () {
        $('#reserve-form').validate({
            rules: {
                resv_date: {
                    required: true
                }
            },
            messages: {
                resv_date: {
                    required: "Please fill reservation date."
                }
            }
        });

    });

</script>

