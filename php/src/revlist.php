<?php

function revlistReverse(SplDoublyLinkedList $list) {	
	$mode = $list->getIteratorMode();
	$list->setIteratorMode(SplDoublyLinkedList::IT_MODE_LIFO | SplDoublyLinkedList::IT_MODE_KEEP);
	
	$res = new SplDoublyLinkedList();
	$list->rewind();
	while ($list->valid()) {
		$res->push($list->current());
		$list->next();
	}	
	
	$list->setIteratorMode($mode);
	return $res;
}

?>