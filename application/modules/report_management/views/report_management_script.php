<script>
    var reportManagement = {};
    reportManagement.retrieveAccount = function(data){
        //loop result
    }
    reportManagement.initializeReportManagementTable = function(){
        var config = {
            api_link : api_url("C_account/retrieveAccount"),
            filter : [{
                    name : "test",
                    label : "ID",
                    placeholder : "ID",
                    type : "select",
                    select_option : {
                        1 : "Testing",
                        5 : "Hahasula"
                    },
                    default_value : 1
            }, {
                    name : "like__account_basic_information__first_name",
                    label : "First Name",
                    placeholder : "First Name",
                    type : "text"
            }],
            header : [{
                column_name: "ID",
                sort : 1
            },{
                column_name: "First Column"
            }],
            result_callback : reportManagement.retrieveAccount
        };
        var reportManagementTable = new TableComponent("#reportTableContainer", config);
        
    };
    $(document).ready(function(){
        load_page_component("table_component", reportManagement.initializeReportManagementTable);
    });

    
</script>
