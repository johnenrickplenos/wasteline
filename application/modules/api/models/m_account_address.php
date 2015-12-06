<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of m_account_address
 *
 * @author johnenrick
 */
class M_account_address extends API_Model{
    public function __construct() {
        parent::__construct();
        $this->TABLE = "account_address";
    }
    public function createAccountAddress($accountID, $barangayID, $description, $longitude, $latitude, $status = 1){
        $newData = array(
            "account_ID" => $accountID,
            "barangay_ID" => $barangayID,
            "description" => $description,
            "longitude" => $longitude,
            "latitude" => $latitude,
            "status" => $status
        );
        return $this->createTableEntry($newData);
    }
    public function retrieveAccountAddress($retrieveType = false, $limit = NULL, $offset = 0, $sort = array(), $ID = NULL, $condition = NULL) {
        $joinedTable = array(
            
        );
        $selectedColumn = array(
            "account_address.*"
        );
        
        return $this->retrieveTableEntry($retrieveType, $limit, $offset, $sort, $ID, $condition, $selectedColumn, $joinedTable);
    }
    public function updateAccountAddress($ID = NULL, $condition = array(), $newData = array()) {
        return $this->updateTableEntry($ID, $condition, $newData);
    }
    public function deleteAccountAddress($ID = NULL, $condition = array()){
        return $this->deleteTableEntry($ID, $condition);
    }
}
