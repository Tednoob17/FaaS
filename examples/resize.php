<?php
$raw = file_get_contents("php://stdin");
$input = json_decode($raw ?: "{}", true);
$width = 0;
if (is_array($input) && isset($input["width"]) && is_numeric($input["width"])) {
    $width = (int)$input["width"];
}

echo json_encode([
    "ok" => true,
    "note" => "Demo resize handler placeholder",
    "requested_width" => $width
]);
