<?php

function include_template($name, array $data = []) {
    $name = 'templates/' . $name;//
    $result = '';//

    if (!is_readable($name)) {//
        return $result;//
    }

    ob_start();//
    extract($data);//
    require $name;//

    $result = ob_get_clean();//

    return $result;//
}


/**
  * ЗАПРОС ЛОТ
  *Запрос из базы данных лотов, возвращает при помощи SELECT данные по лотам из БД yetycave и возвращает массив с данными 
  */
  function get_arrays_lot ($connection) {
    $sql = "SELECT lot.lot_image, lot.category_id, category.category_name, lot.lot_name, lot.lot_price_start, lot.lot_date_end 
    FROM lot 
    JOIN category 
    ON  lot.category_id=category.id 
    ORDER BY lot.lot_date_registration DESC
    LIMIT 6" ; 
    $db_result_lot = mysqli_query($connection, $sql);
    if(!$db_result_lot){
        $error = mysqli_error($connection);
        print("Ошибка MySQL: ".$error);
    }
    $result_lot=mysqli_fetch_all($db_result_lot, MYSQLI_ASSOC);
    return $result_lot;}

 
 
 
 
 
 
/**
  *ЗАПРОС КАТЕГОРИИ 
  *Запрос из базы данных категорий, возвращает при помощи SELECT данные по категориям из БД yetycave и возвращает массив с данными 
  */
  function get_array_category($connection) {
    $sql="SELECT category.category_symbol_code, category.category_name  
    FROM category"; 
    $db_result_category = mysqli_query($connection, $sql);
    if(!$db_result_category){
        $error = mysqli_error($connection);
        print("Ошибка MySQL: ".$error);
    }
    $result_category = mysqli_fetch_all($db_result_category, MYSQLI_ASSOC);
    return $result_category;}