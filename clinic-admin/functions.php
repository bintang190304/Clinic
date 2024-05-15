<?php

$koneksi = mysqli_connect("localhost", "root", "", "clinic");

function update($data) {
    global $koneksi;
    $id_appointment = $data["id_appointment"];
    $status = $data["status"];

    mysqli_query($koneksi, "UPDATE appointment SET status = '$status' WHERE id_appointment = '$id_appointment'");

    return mysqli_affected_rows($koneksi);
}

?>
