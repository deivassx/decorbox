<?php 
session_start();
include 'connect.php';

//not working yet



/*if(isset($_POST['add'])){
	$safe_sel_item_authorization = $_COOKIE['PHPSESSID']; //reikia vartotojo login
	$safe_sel_item_total= 21; //$_POST['item_total'];
	$safe_order_address = $_POST['order_address'];
	$safe_order_city =	$_POST['order_city'];
	$safe_order_email = $_POST['order_email'];
	$safe_order_name = $_POST['order_name'];
	$safe_order_tel = $_POST['order_tel'];
	$safe_order_zip = $_POST['order_zip'];
	$safe_shipping_total = 4; //
	$safe_shipping_status = "pending"; //
	$id='';
// ir sql pakeist i login id
	$sql = "INSERT INTO store_orders (session_id,'', item_total, order_address, order_city, order_email,
	order_name, order_tel, order_zip, shipping_total, status) VALUES ('".$_COOKIE['PHPSESSID']."', 
	'".$id."',										
	'".$safe_sel_item_total."',
	'".$safe_order_address."',
	'".$safe_order_city."',
	'".$safe_order_email."',
	'".$safe_order_name."',
	'".$safe_order_tel."',
	'".$safe_order_zip."',
	'".$safe_shipping_total."',
	'".$safe_shipping_status."', now())";

$write_in_db = mysqli_query($mysqli, $sql) or die(mysqli_error($mysqli));
mysql_close($mysqli);
}
?>
<form method="post" action="<?php $_PHP_SELF ?>">
	<table width="400px" border="0">
		<tr>
			<td>Vardas ir Pavardė</td>
			<td><input name="order_name" type="text" id="order_name"></td>
			<td>adresas</td>
			<td><input name="order_address" type="text" id="order_address"></td>
			<td>miestas</td>
			<td><input name="order_city" type="text" id="order_city"></td>
			<td>email</td>
			<td><input name="order_email" type="text" id="order_email"></td>
			<td>tel</td>
			<td><input name="order_tel" type="text" id="order_tel"></td>
			<td>zip</td>
			<td><input name="order_zip" type="text" id="order_zip"></td>


			<input name="add" type="submit" id="add" value="Add Person">
			</td>
		</tr>
		</table>

</form> */