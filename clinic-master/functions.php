<?php

$koneksi = mysqli_connect("localhost", "root", "", "clinic");

function registrasi($data)
{
	global $koneksi;

	$name_patient = strtolower(stripcslashes($data['name_patient']));
	// $address = strtolower(stripcslashes($data['address']));
	$email = strtolower(stripcslashes($data['email']));
	$password = mysqli_real_escape_string($koneksi, $data['password']);

	// cek email yang sudah ada
	$result = mysqli_query($koneksi, "SELECT email FROM patient WHERE email = '$email'");

	if (mysqli_fetch_assoc($result)) {
		echo "<script>
					alert ('Email Already Available');
				</script> ";
		return false;
	}

	// cek konfirmasi password
	// if ($password !== $password2) {
	// 	echo "<script>
	// 				alert ('passwords are not the same');
	// 			</script> ";
	// 	return false;
	// }

	// enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);

	// menambah akun ke database
	// untuk '' di awal dan akhir untuk mendefinisikan baris id agar tidak eror
	mysqli_query($koneksi, "INSERT INTO patient VALUES('','$name_patient', '', '$email', '$password')");

	return mysqli_affected_rows($koneksi);
}

function appointment($data){
    global $koneksi;

    $id_patient = $_SESSION["id_patient"]; // Anda perlu menyesuaikan ini sesuai dengan bagaimana Anda menyimpan id_patient saat login

    $id_doctor = $data['id_doctor'];
    $date_appointment = $data['date_appointment'];
    $time_appointment = $data['time_appointment'];
    $message = $data['message'];

    $Booked = "Booked";

    // Insert appointment baru ke dalam database
    mysqli_query($koneksi, "INSERT INTO appointment (id_patient, id_doctor, date_appointment, time_appointment, status, message) values ('$id_patient', '$id_doctor', '$date_appointment', '$time_appointment', '$Booked', '$message')");

    // Mengambil ID appointment yang baru saja dibuat
    $new_appointment_id = mysqli_insert_id($koneksi);

    // Perhatikan penggunaan variabel yang sesuai untuk update status
    mysqli_query($koneksi, "UPDATE appointment SET status = '$Booked' WHERE id_appointment = $new_appointment_id");

    return mysqli_affected_rows($koneksi);
}


?>


