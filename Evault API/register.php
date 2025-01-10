        <?php
        include('connect.php');
        // Handle profile photo upload
        $target_dir = "uploads/";
        $profile_picture = null;

        if (isset($_FILES["profile_picture"]) && $_FILES["profile_picture"]["error"] == 0) {
            $file_name = basename($_FILES["profile_picture"]["name"]);
            $target_file = $target_dir . uniqid() . "_" . $file_name;

            if (move_uploaded_file($_FILES["profile_picture"]["tmp_name"], $target_file)) {
                $profile_picture = $target_file;
            } else {
                die("Error uploading profile picture.");
            }
        }

        // Gather user input
        $full_name = $_POST['full_name'];
        $email = $_POST['email'];
        $number = $_POST['number'];
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $gender = $_POST['gender'];
        $date_of_birth = $_POST['date_of_birth'];
        $pin = $_POST['SecurityPin'];
       

        // Insert query
        $sql = "INSERT INTO users (full_name, email, number, password, gender, date_of_birth, profile_picture, SecurityPin) 
        VALUES ('$full_name', '$email', '$number', '$password', '$gender', '$date_of_birth', '$profile_picture' , '$pin')";

        if ($con->query($sql) === TRUE) {
            echo "New user created successfully.";
        } else {
            echo "Error: " . $sql . "<br>" ;
        }

        $con->close();
        ?>
