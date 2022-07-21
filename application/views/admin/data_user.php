<div class="container-fluid">
	
	<table class="table table-bordered">
		<tr>
			<th>ID</th>
			<th>Nama User</th>
			<th>Username</th>
			<th>passowrd</th>
            <th>Role</th>
		</tr>
		
		<?php
		$no=1;
		foreach($user as $usr) : ?>
      
      <tr>
       <td><?php echo $usr->id ?></td>
       <td><?php echo $usr->nama ?></td>
       <td><?php echo $usr->username ?></td>
       <td><?php echo $usr->password ?></td>
       <td><?php echo $usr->role_id ?></td>
     </tr>

   <?php endforeach; ?>


 </table>
