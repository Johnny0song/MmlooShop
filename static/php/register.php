<?php

//支持跨域访问
header('Access-Control-Allow-Origin: *');

//接收到前端提交过来的参数
$username = $_POST["username"];
$pwd = $_POST["pwd"];
//$age = $_POST["age"];


//连接数据库MySql
$conn = new mysqli("127.0.0.1", "root", "", "mydb") or die("连接失败");

//判断用户名是否已经存在
$sql = "select * from leekindb where username='$username'";
$result = $conn->query($sql);
if ($result && $result->num_rows>0) {
    $arr = array("status"=>0, "msg"=>"用户名已经存在");
    echo  json_encode($arr);
}
else {
    //插入数据， 注册
    $sql = "insert into leekindb(username, password) values('$username', '$pwd')";
	//易出错username，password
    $result = $conn->query($sql);
    if ($result) {
        $arr = array("status"=>1, "msg"=>"注册成功");
        echo  json_encode($arr);
    } else {
        $arr = array("status"=>0, "msg"=>"注册失败");
        echo  json_encode($arr);
    }
}
$conn->close();







