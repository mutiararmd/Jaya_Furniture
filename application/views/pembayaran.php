<div class="container-fluid">
	<div class="row">

		<div class="col-md-2">
			
		</div>

		<div class="col-md-8">
			<div class="btn btn-sm btn-success">
			<?php 

			$grand_total = 0;
			if ($keranjang = $this->cart->contents())
			{
				foreach ($keranjang as $item)
				{
					$grand_total = $grand_total + $item['subtotal'];
				}

				echo "<h4>Total Belanja Anda: Rp ".number_format($grand_total, 0, ',','.');

			 ?>
		</div><br><br>
			<h3>Input Alamat Pengiriman dan Pembayaran</h3>

			<form method="post" action="<?php echo base_url() ?>dashboard/proses_pesanan">
				<div class="form-group">
					<label>Nama Lengkap</label>
					<input type="text" name="nama" placeholder="Nama Lengkap Anda" class="form-control" required="">
				</div>

				<div class="form-group">
					<label>Alamat Lengkap</label>
					<input type="text" name="alamat" placeholder="Alamat Lengkap Anda" class="form-control" required="">
				</div>

				<div class="form-group">
					<label>No. Telp</label>
					<input type="text" name="no_telp" placeholder="No. Telp" class="form-control" required="">
				</div>

				<div class="form-group">
					<label>Jasa Pengiriman</label>
					<select class="form-control" name="jasa_pengiriman">
						<option>J&E</option>
						<option>J&T</option>
						<option>GOJEK</option>
						<option>GRAB</option>
					</select>
				</div>

				<div class="form-group">
					<label>Pilihan Pembayaran</label>
					<select class="form-control">
						<option>BCA   - 92739273 </option>
						<option>BNI   - 83747283</option>
						<option>GOPAY - 028182736212</option>
						<option>OVO   - 037283642345</option>
					</select>
				</div>
				
				<button type="submit" class="btn btn-sm btn-primary mb-4" >Pesan</button>

			</form>

			<?php
		}else
		{
			echo "<h4>Pesananan Anda Kosong!</h4>";
		}

			 ?>


		<div class="col-md-2">
			

		</div>
	</div>
	
</div>