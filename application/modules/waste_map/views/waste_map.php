
<!--<legend>Waste Map</legend>-->
<div id="wasteMapContainer">

</div>
<!--Custome Style-->
<style>
    .leaflet-popup-content{
        margin:0px!important;
    }
    .leaflet-popup-content .panel{
        margin:0px!important;
        box-shadow: none;
    }
    .leaflet-popup-content-wrapper{
        border-radius : 0!important;
        padding :0px!important;
    }
    .panel-dumping-location .panel-heading {
        background-color :#FAD432;
    }
    .leaflet-popup-content p{
        margin:0px!important;
    }
    /*Panels*/
    .btn-dumping-location{
        background-color :#FAD432!important;
        color : white!important;
    }
    .panel-illegal-dumping .panel-heading {
        background-color :#F65177;
    }
    .btn-illegal-dumping{
        background-color :#F65177!important;
        color : white!important;
    }
    .panel-own-waste .panel-heading[form="true"] {
        background-color :#50C14E;
    }
    .panel-own-waste .primary-head{
        background-color :#50C14E;
        background-color :#50C14E;color:white; 
    }
    .panel-own-waste .primary-head th{
        text-align: center;
        
    }
    .panel-own-waste .panel-body{
        font-size: 16px!important;
    }
    .leaflet-popup-content {
        min-width: 300px!important;
        width:auto !important;
    }
</style>
<!-- footer container-->
<div id="wl-footer-content" class="wl-footer-map">
    <div class="row form-inline">
        <div class="col-md-7">
            <a class="btn btn-default capitalize wl-map-filter wl-active" filter_type="1"  data-toggle="tooltip" data-placement="top" title="" data-original-title="Click to display Garbages"><span class="circle"></span>Garbage</a>
            <a class="btn btn-default capitalize wl-map-filter wl-active" filter_type="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Click to display Services"><span class="circle"></span>Services</a>
            <a class="btn btn-default capitalize wl-map-filter wl-active" filter_type="3" data-toggle="tooltip" data-placement="top" title="" data-original-title="Click to display Reports"><span class="circle"></span>Garbage Report</a>
            <a class="btn btn-default capitalize wl-map-filter wl-active" filter_type="4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Click to display Dumping Locations"><span class="circle"></span>Dumping Area</a>
        </div>
        <div class="col-md-5 wasteMapLGUFilter" style="display: none">
            <a class="btn btn-default capitalize wl-map-filter wl-active" filter_type="5" data-toggle="tooltip" data-placement="top" title="" data-original-title="Click to display Heat Map"><span class="circle" style="background-color:red"></span>Heat Map</a>
            <input type="text" filter_type="6" class="wasteMapDateFilter form-control floating-label wl-map-date wl-datetimepicker" placeholder="Start Date">
            <span>to</span>
            <input type="text" filter_type="7" class="wasteMapDateFilter form-control floating-label wl-map-date wl-datetimepicker" placeholder="End Date">
        </div>
    </div>
</div>
<div class="prototype" style="display:none">
    <div class="illegalDumping panel panel-illegal-dumping">
        <div class="panel-heading">
            <h3 class="panel-title">Report Illegal Dumping</h3>
        </div>
        <div class="panel-body">
            <form class="illegalDumpingForm" method="POST" >
                <input name="report_ID" value="0" type="hidden">
                <input name="map_marker_ID" value="0" type="hidden">
                <input name="associated_ID" value="0" type="hidden">
                <input name="report_type_ID" value="3" type="hidden">
                <input name="longitude" type="hidden">
                <input name="latitude" type="hidden">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" style="margin-top:0px">
                            <div class="col-md-12">
                                <textarea input_name="detail" class="form-control capitalize" rows="4" placeholder="Write the details or leave a note" ></textarea>
                                
                            </div>
                        </div>
                        <div class="form-group " style="margin-top:0px">
                            <p class="wasteMapIllegalDumpingDetail form-control capitalize" style="margin-top:0px"></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="text-align: center">
                        <button type="submit" button_action="1" class="wasteMapSubmitIllegalDumpingReport btn btn-illegal-dumping">Submit</button>
                        <button type="button" button_action="3" class="wasteMapSubmitIllegalDumpingReport btn btn-primary " style="display:none">Resolve</button>
                        <button type="button" button_action="2" class="wasteMapSubmitIllegalDumpingReport btn btn-illegal-dumping ">Remove</button>
                        
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="wasteMapDumpingLocation panel panel-dumping-location">
        <div class="panel-heading">
            <h3 class="panel-title">Dumping Location</h3>
        </div>
        <div class="panel-body">
            <form class="wasteMapDumpingLocationForm" method="POST" >
                <input name="map_marker_ID" value="0" type="hidden">
                <input name="associated_ID" value="0" type="hidden">
                <input name="longitude" type="hidden">
                <input name="latitude" type="hidden">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group label-floating  is-empty " style="margin-top:0px">
                            <label class="control-label" for="focusedUsername">Dumping Description</label>
                            <input input_name="description" class="form-control" type="text" required="true">
                            <p class="help-block wl-c-gray-1">Just a label for this location</p>
                            <span class="material-input"></span>
                        </div>
                        <div class="form-group label-floating  is-empty " style="margin-top:0px">
                            <label class="control-label" for="focusedUsername">Instruction/Note</label>
                            <textarea input_name="detail" class="form-control capitalize" rows="2" required="true" ></textarea>
                            
                            <p class="help-block wl-c-gray-1">Make things clear</p>
                            <span class="material-input"></span>
                        </div>
                        <div class="form-group " style="margin-top:0px">
                            <p class="wasteMapDumpingLocationDetail form-control capitalize" style="margin-top:0px"></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="text-align: center">
                        <button type="submit" button_action="1" class="wasteMapSubmitDumpingLocationReport btn btn-dumping-location">Place Dumping Location</button>
                        <button type="button" button_action="2" class="wasteMapSubmitDumpingLocationReport btn btn-dumping-location">Remove Dumping Location</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="wasteMapOwnWaste panel panel-own-waste" >
        <div class="panel-heading" form="true">
            <h3 class="panel-title">John Enrick Plenos</h3>
        </div>
        <div class="panel-body">
            <form class="wasteMapOwnWasteForm" method="POST" >
                <div class="row">
                    <div class="col-md-12" style="text-align: center">
                        <p class="">plenosjohn@yahoo.com</p>
                        <p class="wl-slogan-edit">09275835504/125478563</p>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr class="primary-head">
                            <th colspan="2">Own Waste</th>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Tasdajsodjsaiodjoasjdasdjiojasd</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>Tasdajsodjsaiodjoasjdasdjiojasd</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>Tasdajsodjsaiodjoasjdasdjiojasd</td>
                            <td>12</td>
                        </tr>
                    </tbody>
                </table>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Waste Accepted</h3>
                    </div>
                    <div class="panel-body">
                        asdasdsad
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Waste Service</h3>
                    </div>
                    <div class="panel-body">
                        asdasdsad
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
