<?php
  include("db_con.php");
  $sql="SELECT * FROM data";
  $result=mysqli_query($conn,$sql);
  foreach($result as $row){
    echo '<tr>
    <td>'.$row['time'].'</td>
    <td>'.$row['temp'].'</td>
    <td>'.$row['humi'].'</td>
    <td>'.$row['light'].'</td>
    <td>'.$row['move'].'</td>
    <td>'.$row['gas'].'</td>
    <td>'.$row['secur'].'</td>
    <td>'.$row['water'].'</td>
    <td>'.$row['air'].'</td>
    <td>'.$row['airat'].'</td>
    <td>'.$row['mois'].'</td>
    <td>'.$row['moisat'].'</td>
    <td>'.$row['lightout'].'</td>
    <td>'.$row['lightat'].'</td>
    <td>'.$row['door'].'</td>
    <td>'.$row['led'].'</td>
    <td>'.$row['sensor'].'</td>
    </tr>';
  }
?>