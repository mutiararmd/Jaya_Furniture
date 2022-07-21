<?php

class Model_kategori extends CI_Model{
	public function data_freestandingfurniture(){
		return $this->db->get_where("tb_barang",array('kategori' => 'Free Standing Furniture'));
	}

	public function data_kockdownfurniture(){
		return $this->db->get_where("tb_barang",array('kategori' => 'Knock Down Furniture'));
	}

	public function data_inflatablefurniture(){
		return $this->db->get_where("tb_barang",array('kategori' => 'InflaTable Furniture'));
	}
}