<?php

$con=mysqli_connect ('localhost', 'root', '', 'bet');
mysqli_set_charset($con, 'utf8');

if ($con == false) {
    $error="Ошибка подключения: ".mysqli_connect_error();
}
else {
    $error="Соединение установлено";
}