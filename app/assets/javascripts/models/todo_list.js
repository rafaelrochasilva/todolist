var TodoList = {
	BTN_ADD_ITEM: ".btn-add-item"
};

TodoList.addItemListener = function(){

	$(this.BTN_ADD_ITEM).click(function(e){
		e.preventDefault();

		var id = $(".title").attr('id');
		TodoView.hideBtnAddItem();
		TodoView.makeFormItem(id);
	});
};

