<?php

class Kategori extends CI_Controller{
	public function freestandingfurniture(){

		$data['freestandingfurniture'] = $this->model_kategori->data_freestandingfurniture()->result();
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('freestandingfurniture', $data);
		$this->load->view('templates/footer');		

	}

	public function kockdownfurniture(){
		$data['kockdownfurniture'] = $this->model_kategori->data_kockdownfurniture()->result();
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('kockdownfurniture', $data);
		$this->load->view('templates/footer');		

	}

	public function inflatablefurniture(){
		$data['inflatablefurniture'] = $this->model_kategori->data_inflatablefurniture()->result();
		$this->load->view('templates/header');
		$this->load->view('templates/sidebar');
		$this->load->view('inflatablefurniture', $data);
		$this->load->view('templates/footer');		

	}
}