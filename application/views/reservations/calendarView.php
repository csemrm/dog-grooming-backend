<?php
$ci = get_instance();
?>
<div id="wrapper">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInDown">

            <div class="col-lg-12">
                <div class="ibox float-e-margins">

                    <div class="ibox-content">
                        <a class="btn" style="padding-top: 15px;border-radius: 10px;background-color: <?php echo $ci->config->item('pending_color'); ?>;" href="#"></a>  Pending 
                        <a class="btn" style="margin-left: 20px;padding-top: 15px; border-radius: 10px;background-color: <?php echo $ci->config->item('confirm_color'); ?>;" href="#"></a>  Confirm 
                        <a class="btn" style="margin-left: 20px;padding-top: 15px;;border-radius: 10px;background-color: <?php echo $ci->config->item('cancel_color'); ?>;" href="#"></a>  Cancel 
                        <a class="btn" style="margin-left: 20px;padding-top: 15px;;border-radius: 10px;background-color: <?php echo $ci->config->item('complete_color'); ?>;" href="#"></a>  Complete
                        <hr>
                        <div id="calendar"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<?php

function getDateTime($d, $t) {
    $ds = explode("/", $d);
    $ts = explode(":", $t);

    return $d.' '.$t;
}

function getLabelColor($status) {

    $ci = get_instance();
    switch ($status) {
        case 1:
            return $ci->config->item('pending_color');
            break;

        case 2:
            return $ci->config->item('cancel_color');
            break;

        case 3:
            return $ci->config->item('confirm_color');
            break;

        case 4:
            return $ci->config->item('complete_color');
            break;

        default:
            return $ci->config->item('pending_color');
    }
}

$reserve_array = array();
foreach ($reservations as $resv) {
    $reserve_array[] = array(
        'id' => $resv->id,
        'title' => 'Reserve ID # ' . $resv->id,
        'start' => getDateTime($resv->resv_date, $resv->resv_time),
        'url' => site_url('reservations') . "/edit/" . $resv->id,
        'color' => getLabelColor($resv->status_id),
    );
}

$reserves = json_encode($reserve_array);
	
?>

<script>

    $(document).ready(function () {


        /* initialize the external events
         -----------------------------------------------------------------*/


        $('#external-events div.external-event').each(function () {

            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1111999,
                revert: true, // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });


        /* initialize the calendar
         -----------------------------------------------------------------*/
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: ''
            },
            editable: false,
            droppable: false, // this allows things to be dropped onto the calendar
            drop: function () {
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },
            events:
<?php
echo $reserves;
?>


            ,
        });


    });

</script>