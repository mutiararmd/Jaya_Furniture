<?php 
class Data_user extends CI_Controller{

	public function index(){
		$data['user'] = $this->model_barang->tampil_datauser()->result();
		$this->load->view('templates_admin/header');
		$this->load->view('templates_admin/sidebar');
		$this->load->view('admin/data_user', $data);
		$this->load->view('templates_admin/footer');
	} 
}