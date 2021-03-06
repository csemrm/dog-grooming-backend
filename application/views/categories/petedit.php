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
                                <?php echo $this->lang->line('update_cat_label') ?>
                            </h3>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <?php
                $attributes = array('id' => 'category-form', "class" => "m-form m-form--label-align-right", 'enctype' => 'multipart/form-data');
                echo form_open(site_url('appusers/petedit/' . $category->id), $attributes);
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
                                <?php echo $this->lang->line('category_name_label') ?>
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control" type="text" name="name" placeholder="Name" id="name" value='<?php echo $category->name; ?>' />
                                <span class="m-form__help">
                                </span>
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">
                                Type
                            </label>
                            <div class="col-lg-9"> 
                                <div class="m-radio-list">
                                    <?php $type = $category->type; ?>
                                    <label class="m-radio"> 
                                        <input type="radio" name="type" value="Dog"  <?php echo ($type == 'Dog') ? 'checked=""' : ''; ?> >
                                        Dog 
                                        <span></span>
                                    </label>
                                    <label class="m-radio">
                                        <input type="radio" name="type"  value="Cat"  <?php echo ($type == 'Cat') ? 'checked=""' : ''; ?>>
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
                                <?php $gender = $category->gender; ?>
                                <div class="m-radio-list">
                                    <label class="m-radio"> 
                                        <input type="radio" name="gender" value="Male"  <?php echo ($gender == 'Male') ? 'checked=""' : ''; ?> >
                                        Male 
                                        <span></span>
                                    </label>
                                    <label class="m-radio">
                                        <input type="radio" name="gender"  value="Female"  <?php echo ($gender == 'Female') ? 'checked=""' : ''; ?> >
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
                                <input class="form-control" type="text" name="weight" placeholder="Weight" id="weight" value='<?php echo $category->weight; ?>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group row">
                            <label class="col-lg-3 col-form-label">Bread
                            </label>
                            <div class="col-lg-9"> 
                                <input class="form-control" type="text" name="bread" placeholder="bread" id="bread" value='<?php echo $category->bread; ?>' />

                            </div>
                        </div>
                    </div>


                    <div class="m-form__seperator m-form__seperator--dashed"></div>
                    <div class="m-form__section m-form__section--last">

                        <div class="m-form__heading">
                            <div class="row align-items-center">
                                <div class="col-xl-8 order-2 order-xl-1">
                                    <label class="col-form-label">
                                        Photo Upload 
                                        <a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('cat_photo_tooltips') ?>">
                                            <span class='glyphicon glyphicon-info-sign menu-icon'>
                                        </a>
                                    </label>  
                                </div>

                                <div class="col-xl-4 order-1 order-xl-2 m--align-right">
                                    <a class="btn btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage">Replace Photo</a>

                                </div>

                            </div>
                        </div> 
                        <div class="form-group m-form__group row">	
                            <div class="col-lg-12">
                                <?php
                                $images = $this->image->get_all_by_type($category->id, 'category')->result();
                                if (count($images) > 0):
                                    ?>

                                    <?php
                                    $i = 0;
                                    foreach ($images as $img) {


                                        echo '<div class="col-md-4" style="height:100"><div class="thumbnail">' .
                                        '<img src="' . base_url('uploads/thumbnail/' . $img->path) . '"><br/>' .
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
                                    <input type="hidden" name="appuser_id" value="<?php echo $category->appuser_id; ?>" />
                                    <button type="submit" class="btn btn-primary"><?php echo $this->lang->line('save_button') ?></button>
                                    <a href="<?php echo site_url('appusers/detail/' . $category->appuser_id); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button') ?></a>
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
            echo form_open(site_url("dogs/upload/" . $category->id), $attributes);
            ?>
            <div class="modal-body">
                <div class="form-group">
                    <label><?php echo $this->lang->line('upload_photo_label') ?></label>
                    <input type="file" name="images1">
                    <input type="hidden" name="redirect" value="<?php echo site_url('appusers/petedit/' . $category->id); ?>">
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

<script>
    $(document).ready(function () {
        $('#category-form').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 4,
                    //remote: '<?php echo site_url('dogs/exists/' . $category->id); ?>'
                }
            },
            messages: {
                name: {
                    required: "Please fill dog name.",
                    minlength: "The length of dog name must be greater than 4",
                    //remote: "dog name is already existed in the system"
                }
            }
        });

        $('.delete-img').click(function (e) {
            e.preventDefault();
            var id = $(this).attr('id');
            var image = $(this).attr('image');
            var action = '<?php echo site_url('dogs/delete_image/' . $category->id); ?>/' + id + '/' + image;
            $('.btn-delete-image').attr('href', action);
        });
    });

    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>

