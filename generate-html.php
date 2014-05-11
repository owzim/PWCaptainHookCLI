<?php

require_once "classes/CaptainHookSearch.php";

$PW_REPO_DIR=$argv[1];

if($PW_REPO_DIR) {
	
	$rootPath = "$PW_REPO_DIR/wire";
	
	$excludedFilenames = array("AdminTheme.php");

	$hooks = CaptainHookSearch::getHooks($rootPath, $excludedFilenames);


	echo "<pre>";
	print_r($hooks);
	echo "</pre>";
}

