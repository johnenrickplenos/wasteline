<script>
    /* global wasteMap*/
    /**
     * Create a Report form when map is clicked
     * @param {type} latlng
     * @returns {undefined}
     */
    wasteMap.openIllegalDumpingReport = function(latlng){
        wasteMap.webMap.addMarker(-1, 3, 0, "Illegal Dumping", latlng.lng, latlng.lat, false, wasteMap.createIllegalDumpingForm(0));
        wasteMap.bindIllegalDumpingFormAction(-1);
        wasteMap.webMap.markerList[-1].on("popupclose",function(e){
            wasteMap.webMap.removeMarkerList(e.target.options.map_marker_ID);
        });
        wasteMap.webMap.markerList[-1].fireEvent("click");
    };
    /**
     * Bind events to the html in PopUp since it recreates the popup eveytime it is viewed so events will have to be rebinded
     * @param {type} markerListID
     * @returns {undefined}
     */
    wasteMap.bindIllegalDumpingFormAction = function(markerListID){
        wasteMap.webMap.markerList[markerListID].on("click",function(e){
            if(e.target._popup._isOpen){
                $(e.target._popup._contentNode).find("[name=longitude]").val(e.target._latlng.lng);
                $(e.target._popup._contentNode).find("[name=latitude]").val(e.target._latlng.lat);
                $(e.target._popup._contentNode).find("[name=detail]").autoResize();//bind autoresize on detail field
                /*Removing a Report*/
                $(e.target._popup._contentNode).find("button[button_action=2]").click(function(){
                    var mapMarkerID = $(this).parent().parent().parent().find("input[name=map_marker_ID]").val();
                    $.post(api_url("C_report/deleteReport"), {ID : wasteMap.webMap.markerList[mapMarkerID].options.associated_ID}, function(data){
                        var response = JSON.parse(data);
                        if(!response["error"].length){
                            wasteMap.webMap.removeMarkerList(mapMarkerID);
                        }
                    });
                });
                /*Submit the report form*/
                $(e.target._popup._contentNode).find("form").ajaxForm({
                    beforeSubmit : function(data){
                        if(data[6]["value"] === ""){//default value for detail
                            data[6]["value"] = "Illegal Dumping";
                        }
                        
                    },
                    success : function(data){
                        var response = JSON.parse(data);
                        if(!response["error"].length){
                            $.post(api_url("C_report/retrieveReport"), {ID: response["data"]}, function(data){
                                var response = JSON.parse(data);
                                if(!response["error"].length){
                                    wasteMap.webMap.removeMarkerList(-1);//delete the report form
                                    /*Add the report to the map*/
                                    var datetime = new Date(response["data"]["datetime"]*1000);
                                    var detail  = response["data"]["detail"]+"<br> <i>Reported on "+datetime.getDate()+"/"+datetime.getMonth()+"/"+datetime.getFullYear()+"</i>";
                                    wasteMap.webMap.addMarker(response["data"]["map_marker_ID"], response["data"]["map_marker_type_ID"], response["data"]["ID"], response["data"]["detail"], response["data"]["longitude"], response["data"]["latitude"], false, wasteMap.createIllegalDumpingForm(response["data"]["map_marker_ID"], detail));
                                    wasteMap.bindIllegalDumpingFormAction(response["data"]["map_marker_ID"]);
                                }else{
                                    console.log(response);
                                }
                            });
                            
                        }
                    }
                })
            }
        });
    };
    /*
        Adding a Prototype to the report popup
     * @param {int} mapMarkerID
     * @param {string} detail
     * @returns {unresolved}     */
    wasteMap.createIllegalDumpingForm = function(mapMarkerID, detail){
        var popupContent  = $(".prototype .illegalDumping").clone();
        popupContent.find("[name=map_marker_ID]").val(mapMarkerID);
        if(mapMarkerID){
            popupContent.find("[input_name=detail]").hide();
            popupContent.find("button[button_action=1]").hide();
            popupContent.find(".wasteMapIllegalDumpingDetail").html(detail);
        }else{
            popupContent.find("[input_name=detail]").attr("name", "detail");
            popupContent.find(".wasteMapIllegalDumpingDetail").hide();
            popupContent.find("button[button_action=2]").hide();
            popupContent.find(".illegalDumpingForm").attr("action",api_url("C_report/createReport"));
        }
        return popupContent.prop("outerHTML");//converts the html to string since popup only accept string
    };
    wasteMap.retrieveUserReportMapMarker = function(){
        var condition = {
            status : 1,
            report_type_ID : 3
        };
        
        $.post(api_url("C_report/retrieveReport"), {condition: condition}, function(data){
            var response = JSON.parse(data);
            if(!response["error"].length){
                for(var x =0 ; x < response["data"].length;x++){
                    var datetime = new Date(response["data"][x]["datetime"]*1000);
                    var detail  = response["data"][x]["detail"]+"<br> <i>Reported on "+datetime.getDate()+"/"+datetime.getMonth()+"/"+datetime.getFullYear()+"</i>";
                    wasteMap.webMap.addMarker(response["data"][x]["map_marker_ID"], response["data"][x]["map_marker_type_ID"], response["data"][x]["ID"], response["data"][x]["detail"], response["data"][x]["longitude"]*1, response["data"][x]["latitude"]*1, false, wasteMap.createIllegalDumpingForm(response["data"][x]["map_marker_ID"], detail));
                    wasteMap.bindIllegalDumpingFormAction(response["data"][x]["map_marker_ID"]);
                }
            }
        });
    };
    wasteMap.changeUserSelectMap = function(){
        
        wasteMap.webMap.selectLocation(wasteMap.openIllegalDumpingReport);//open a report if the map is clicked)
    }
    $(document).ready(function(){
        add_refresh_call("waste_map", wasteMap.retrieveUserReportMapMarker);
        wasteMap.initFunction.push(wasteMap.changeUserSelectMap);
    });


</script>
