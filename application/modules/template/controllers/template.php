<?php

class Template extends FE_Controller{
    public function index(){
        $this->load->view('design_1');
    }
    public function design(){
        $this->load->view('design_2');
    }
    public function map(){
    	$this->load->view('map');
    }
}