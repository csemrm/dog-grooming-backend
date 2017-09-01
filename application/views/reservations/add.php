<?php
$this->lang->load('ps', 'english');
?>
<ul class="breadcrumb">
    <li><a href="<?php echo site_url('shops'); ?>"><?php echo $this->lang->line('shops_list_label') ?></a> <span class="divider"></span></li>
    <li><?php echo $this->lang->line('shop_info_label') ?></li>
</ul>

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

<?php
$attributes = array('id' => 'shop-form', 'enctype' => 'multipart/form-data');
echo form_open(site_url("reservations/create"), $attributes);
?>
<div class="row">


    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="shopinfo">
            <div class="form-group">
                <label class="control-label">For A:</label>
                <?php
                $works = array('Dog Walk', 'Wash', 'Hair Cut', 'Nail Trimming', 'Flea Treatment', 'Over night vacation');
                foreach ($works as $work) {
                    echo "<label class='checkbox'>";
                    echo form_checkbox("note[]", $work, $work, true);
                    echo $work . "</label>";
                }
                ?>
            </div>
            <br>
            <div class="form-group">
                <label><?php echo $this->lang->line('cat_label') ?>
                    <a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('cat_tooltips') ?>">
                        <span class='glyphicon glyphicon-info-sign menu-icon'>
                    </a>
                </label>
                <select class="form-control" name="dog_id" id="dog_id">
                    <option><?php echo $this->lang->line('select_cat_message') ?></option>
                    <?php
                    $categories = $this->category->get_all($this->shop->get_current_shop()->id);
                    foreach ($categories->result() as $cat)
                        echo "<option value='" . $cat->id . "'>" . $cat->name . "</option>";
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label><?php echo $this->lang->line('reserved_by') ?></label> <br>
                <select class="form-control" name='user_id' id='user_id'>
                    <?php
                    foreach ($this->appuser->get_all()->result() as $appuser)
                        echo "<option value='" . $appuser->id . "'>" . $appuser->username . "</option>";
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label><?php echo $this->lang->line('feed_list_label') ?></label> <br>
                <select class="form-control" name='promo_id' id='promo_id'>
                    <option value="0"><?php echo $this->lang->line('feed_list_label') ?></option>
                    <?php
                    foreach ($this->feed->get_all($this->shop->get_current_shop()->id)->result() as $feed)
                        echo "<option value='" . $feed->id . "'>" . $feed->title . "</option>";
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label><?php echo $this->lang->line('resv_date_label') ?>
                    
                </label>
                <input class="form-control" type="text" placeholder="DD/MM/YYYY" name='resv_date' id='resv_date'>
            </div>

            <div class="form-group">
                <label><?php echo $this->lang->line('resv_time_label') ?>
                </label>
                <input class="form-control" type="text" placeholder="HH:MM" name='resv_time' id='resv_time' >
            </div>

            
        </div>
    </div>		
</div>

<hr/>

<button type="submit" class="btn btn-primary"><?php echo $this->lang->line('save_button') ?></button>

<a href="<?php echo site_url('shops'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button') ?></a>
</form>
<script>
    $(document).ready(function () {
        $(function () {
            $("[data-toggle='tooltip']").tooltip();
        });
    });

    $('#shop-form').validate({
        rules: {
            name: {
                required: true
            },
            description: {
                required: true
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: {
                required: "Please Fill Shop Name."
            },
            description: {
                required: "Please Fill Shop Description."
            },
            email: {
                email: "Email format is wrong.",
                required: "Please Fill Shop Email."
            }
        }
    });
</script>