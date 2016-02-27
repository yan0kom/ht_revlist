<?php
require 'revlist.php';

echo "Run list reverse tests\n";

$passedCount = 0;
$passedCount += testList([45,87,64,3,75], [75,3,64,87,45]);
$passedCount += testList([61,29,10,6], [6,10,29,61]);
$passedCount += testList([3,5], [5,3]);
$passedCount += testList([23], [23]);
$passedCount += testList([], []);

if ($passedCount == 5) {
	echo "All tests passed\n";
}

function testList(Array $src, Array $res) {
	$srcList = make_list($src);
	$resList = make_list($res);
	$reversedList = revlistReverse($srcList);
	echo '  source list ';
	print_list($srcList);
	echo "\n";
	echo '  reversed list ';
	print_list($reversedList);
	echo "\n";
	if ($reversedList->serialize() == $resList->serialize()) {
		echo "  test ok\n";
		return 1;
	}else {
		echo "  test failed\n";		
	}
	return 0;
}

function make_list(Array $listArr) {
	$list = new SplDoublyLinkedList();
	foreach ($listArr as $item) {
		$list->push($item);
	}
	return $list;
}

function print_list(SplDoublyLinkedList $list) {
	$list->rewind();
	echo '[';
	while ($list->valid()) {
		echo $list->current();
		$list->next();
		if ($list->valid()) {
			echo ',';
		}
	}
	echo ']';
}
?>