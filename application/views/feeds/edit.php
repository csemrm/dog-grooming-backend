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
                                <?php echo $this->lang->line('update_feed_label') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'feed-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url("feeds/edit/" . $feed->id), $attributes);
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
                                <input class="form-control m-input" type="text" placeholder="title" name='title' id='title' value='<?php echo $feed->title; ?>'>

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
                                <textarea class="form-control" name="description" placeholder="Description" rows="9"><?php echo $feed->description; ?></textarea>
                                <span class="m-form__help">
                                    <?php echo $this->lang->line('feed_description_tooltips') ?>
                                </span>
                            </div>
                        </div> 



                    </div>

                </div>
                <div class="m-form__seperator m-form__seperator--dashed"></div>
                <div class="m-form__section m-form__section--last">
                    <div class="m-form__heading">
                        <label class="col-lg-3 col-form-label">
                            Photo Upload 
                            <a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('cat_photo_tooltips') ?>">
                                <span class='glyphicon glyphicon-info-sign menu-icon'>
                            </a>
                        </label> <a class="btn btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage">Replace Photo</a>

                    </div> 
                    <div class="form-group m-form__group row">	

                        <div class="col-lg-9">
                            <?php
                            $images = $this->image->get_all_by_type($feed->id, 'feed')->result();
                            if (count($images) > 0):
                                ?>

                                <?php
                                $i = 0;
                                foreach ($images as $img) {
                                    if ($i > 0 && $i % 3 == 0) {
                                        echo "</div><div class='row'>";
                                    }

                                    echo '<div class="col-md-4" style="height:100"><div class="thumbnail">' .
                                    '<img src="' . base_url('uploads/thumbnail/' . $img->path) . '"><br/>' .
                                    '<p class="text-center">' .
                                    '<a data-toggle="modal" data-target="#deletePhoto" class="delete-img" id="' . $img->id . '"   
											image="' . $img->path . '">Remove</a></p>' .
                                    '</div></div>';
                                    $i++;
                                }
                                ?>


                                <?php
                            endif;
                            ?> 
                        </div>

                    </div>

                </div>
                <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions m-form__actions">
                        <div class="row">

                            <div class="col-lg-2"></div>
                            <div class="col-lg-6">
                                <input type="submit" value="<?php echo $this->lang->line('update_button') ?>" class="btn btn-primary"/>
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
<div class="modal fade"  id="uploadImage">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title"><?php echo $this->lang->line('upload_photo_label') ?></h4>
            </div>
            <?php
            $attributes = array('id' => 'upload-form', 'enctype' => 'multipart/form-data');
            echo form_open(site_url("feeds/upload/" . $feed->id), $attributes);
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
        $('#feed-form').validate({
            rules: {
                title: {
                    required: true,
                    minlength: 4
                }
            },
            messages: {
                name: {
                    required: "Please fill feed name.",
                    minlength: "The length of feed name must be greater than 4"
                }
            }
        });
        $('.delete-img').click(function (e) {
            e.preventDefault();
            var id = $(this).attr('id');
            var image = $(this).attr('image');
            var action = '<?php echo site_url('feeds/delete_image/' . $feed->id); ?>/' + id + '/' + encodeURI(image);
            $('.btn-delete-image').attr('href', action);
        });
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });


</script>