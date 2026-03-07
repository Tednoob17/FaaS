<?php
$raw = file_get_contents("php://stdin");
$input = json_decode($raw ?: "{}", true);
$name = "world";
if (is_array($input) && isset($input["name"]) && is_string($input["name"]) && $input["name"] !== "") {
    $name = $input["name"];
}

echo json_encode([
    "message" => "Hello, " . $name,
    "runtime" => "php",
    "endpoint" => "/api/hello"
]);
