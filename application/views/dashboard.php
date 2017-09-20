<?php
$this->lang->load('ps', 'english');
?>
<!-- BEGIN: Subheader -->
<div class="m-subheader ">
    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title ">
                Dashboard
            </h3>
        </div>

    </div>
</div>



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

<!-- END: Subheader -->
<div class="m-content">
    <!--Begin::Main Portlet-->
    <div class="row">

        <div class="col-sm-3">
            <a href="<?php echo site_url('reservations') ?>">

                <span class="badge badge-important">
                    <?php echo $this->reservation->count_all($this->shop->get_current_shop()->id); ?>
                </span>

                <div class="hero-widget">
                    <div class="icon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <div class="text">

                        <label class="text-muted">Reservation Counts</label>
                    </div>
                </div>
            </a>
        </div>



    </div>
    <hr/>

    <?php
    $all_discounts = $this->discount_type->get_all($this->shop->get_current_shop()->id, 3);
    $all_discounts_count = $this->discount_type->count_all($this->shop->get_current_shop()->id);
    ?>
    <div class="row">


        <div class="col-lg-8">
            <div class="row">

                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <?php
                        $all_feeds = $this->feed->get_all($this->shop->get_current_shop()->id, 3);
                        $all_feeds_count = $this->feed->count_all($this->shop->get_current_shop()->id);
                        ?>
                        <div class="ibox-title">
                            <h5><?php echo $this->lang->line('feed_list_label') ?></h5>
                            <div class="ibox-tools">
                                <span class="label label-warning-light">Total : <?php echo $all_feeds_count; ?> Feeds</span>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <div>
                                <div class="feed-activity-list">

                                    <?php
                                    foreach ($all_feeds->result() as $feed) {
                                        $feed_all = $this->image->get_all_by_type($feed->id, 'feed')->result();

                                        if (count($feed_all) < 1) {
                                            $feed_image = "feedDefault.png";
                                        } else {
                                            $feed_image = $feed_all[0]->path;
                                        }


                                        echo "<div class='feed-element'>" .
                                        "<img class='img-circle pull-left' src='" . base_url('uploads/thumbnail/' . $feed_image) . "'>" .
                                        "<div class='media-body '>" .
                                        "<small class='pull-right'>" . $this->inquiry->ago($feed->added) . "</small>" .
                                        "<strong>" . $feed->title . "</strong><br>" .
                                        "<small class='text-muted'>" . $this->feed->read_more_text($feed->description) . "</small>" .
                                        "</div>" .
                                        "</div>";
                                    }
                                    ?>

                                </div>

                                <small class="pull-right text-navy"><a href='<?php echo site_url('feeds'); ?>'>View All</a></small>


                            </div>
                        </div>

                    </div>
                </div>


            </div>


        </div>
    </div>
</div>


