<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_account_contact_information extends API_Controller {
    /*
     * Access Control List
     * 1    - createAccountContactInformation
     * 2    - retrieveAccountContactInformation
     * 4    - updateAccountContactInformation
     * 8    - deleteAccountContactInformation
     * 16   - batchCreateAccountContactInformation
     */
    public function __construct() {
        parent::__construct();
        $this->load->model("m_account_contact_information");
        $this->APICONTROLLERID = 2;
    }
    public function createAccountContactInformation(){
        $this->accessNumber = 1;
        if($this->checkACL()){
            $this->form_validation->set_rules('type', 'Contact Information Type', 'required');
            $this->form_validation->set_rules('detail', 'Detail', 'required');
            if($this->form_validation->run()){
                $result = $this->m_account_contact_information->createAccountContactInformation(
                        user_id(),
                        $this->input->post("type"),
                        $this->input->post("detail")
                        );
                if($result){
                    $this->actionLog($result);
                    $this->responseData($result);
                }else{
                    $this->responseError(3, "Failed to create");
                }
            }else{
                if(count($this->form_validation->error_array())){
                    $this->responseError(102, $this->form_validation->error_array());
                }else{
                    $this->responseError(100, "Required Fields are empty");
                }
            }
        }else{
            $this->responseError(1, "Not Authorized");
        }
        $this->outputResponse();
    }
    public function retrieveAccountContactInformation(){
        $this->accessNumber = 2;
        if($this->checkACL()){
            $result = $this->m_account_contact_information->retrieveAccountContactInformation(
                    $this->input->post("retrieve_type"),
                    $this->input->post("limit"),
                    $this->input->post("offset"), 
                    $this->input->post("sort"),
                    $this->input->post("ID"), 
                    $this->input->post("condition")
                    );
            if($this->input->post("limit")){
                $this->responseResultCount($this->m_account_contact_information->retrieveAccountContactInformation(
                    1,
                    NULL,
                    NULL,
                    NULL,
                    $this->input->post("ID"), 
                    $this->input->post("condition")
                    ));
            }
            if($result){
                $this->actionLog(json_encode($this->input->post()));
                $this->responseData($result);
            }else{
                $this->responseError(2, "No Result");
            }
        }else{
            $this->responseError(1, "Not Authorized");
        }
        $this->outputResponse();
    }
    public function updateAccountContactInformation(){
        $this->accessNumber = 4;
        if($this->checkACL()){
            
            $result = $this->m_account_contact_information->updateAccountContactInformation(
                    $this->input->post("ID"),
                    $this->input->post("condition"),
                    $this->input->post("updated_data")
                    );
            if($result){
                $this->actionLog(json_encode($this->input->post()));
                $this->responseData($result);
            }else{
                $this->responseError(3, "Failed to Update");
            }
        }else{
            $this->responseError(1, "Not Authorized");
        }
        $this->outputResponse();
    }
    public function deleteAccountContactInformation(){
        $this->accessNumber = 8;
        if($this->checkACL()){
            $result = $this->m_account_contact_information->deleteAccountContactInformation(
                    $this->input->post("ID"), 
                    $this->input->post("condition")
                    );
            if($result){
                $this->actionLog(json_encode($this->input->post()));
                $this->responseData($result);
            }else{
                $this->responseError(3, "Failed to delete");
            }
        }else{
            $this->responseError(1, "Not Authorized");
        }
        $this->outputResponse();
    }
}
