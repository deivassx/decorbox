<?php
session_start();
include 'connect.php';

$sel_item_id = $_SESSION['sel_item_id']; //turi gauti id is addtocart.php
echo $sel_item_id; //!!!nieko neatspaudsdina

$display_block = "<h1>Your Shopping Cart</h1>";
//check for cart items based on user session id
$get_cart_sql = "SELECT st.id, si.item_title, si.item_price, st.sel_item_qty FROM
store_shoppertrack AS st LEFT JOIN store_items AS si ON si.id = st.sel_item_id WHERE session_id ='".$_COOKIE['PHPSESSID']."'";
$get_cart_res = mysqli_query($mysqli, $get_cart_sql) or die(mysqli_error($mysqli));
if (mysqli_num_rows($get_cart_res) < 1) {
//print message
$display_block .= "<p>You have no items in your cart.
Please <a href=\"displayCategories.php\">continue to shop</a>!</p>";
} else {
//get info and build cart display
	
$display_block .= <<<END_OF_TEXT
<table>
<tr>
<th>Title</th>
<th>Price</th>
<th>Qty</th>
<th>Total Price</th>
<th>Action</th>
</tr>
END_OF_TEXT;

$full_price=0; 
while ($cart_info = mysqli_fetch_array($get_cart_res)) {
$id = $cart_info['id'];
$item_title = stripslashes($cart_info['item_title']);
$item_price = $cart_info['item_price'];
$item_qty = $cart_info['sel_item_qty'];
$total_price = sprintf("%.02f", $item_price * $item_qty); 
$full_price = sprintf("%.02f", $full_price+$total_price); //galutine kaina



$select_item_id_sql = "SELECT sel_item_id FROM store_shoppertrack WHERE id = '".$id."'";
$item_id = mysqli_query($mysqli, $select_item_id_sql) or die($mysqli_query($mysqli));//
//$safe_item_id = mysqli_real_escape_string($mysqli, $_GET['sel_item_id']);

$display_block .= <<<END_OF_TEXT
<tr>
<td>$item_title <br></td>
<td>\$ $item_price <br></td>
<td>$item_qty <br></td>
<td>\$ $total_price</td>
<td><a href="removefromcart.php?id=$id">remove</a></td>
</tr>

END_OF_TEXT;
}

$display_block .= "</table>";

}
$display_block .= $full_price;
$display_block .= <<<END_OF_TEXT
<form method="post" action="checkout.php">
END_OF_TEXT;
//send to db 
// JEIGU ISKOMENTUOCIAU SITA RODYTU KLAIDA: "Column count doesn't match value count at row 1"
// speju del to kad $sel_item_id negauna nieko. Nors kai irasau ir paprasta skaiciu vietoj $sel_item_id vistie meta

//NULL reiksme zemiau nes duomenu bazej padaryta AUTO INCREASE NUMBER - turbut veikia
/*
$addto_order_items_sql = "INSERT INTO store_orders_items
(id, order_id, sel_item_id, sel_item_price, sel_item_qty) VALUES (
'".$id."',
NULL,
'".$sel_item_id."',
'".$item_price."',
'".$item_qty."', now())";
$addto_order_items_res = mysqli_query($mysqli, $addto_order_items_sql) or die(mysqli_error($mysqli));
*/

$display_block .= <<<END_OF_TEXT
<button type="submit" name="submit" value="submit"> Checkout </button>

</form>
END_OF_TEXT;


//free result
mysqli_free_result($get_cart_res);



//close connection to MySQL
mysqli_close($mysqli);
?>
<!DOCTYPE html>
<html>
<head>
<title>My Store</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
	}
	th {
	border: 1px solid black;
	padding: 6px;
	font-weight: bold;
	background: #ccc;
	text-align: center;
	}
	td {
	border: 1px solid black;
	padding: 6px;
	vertical-align: top;
	text-align: center;
	}
</style>
</head>
<body>
<?php echo $display_block; ?>
</body>
</html>