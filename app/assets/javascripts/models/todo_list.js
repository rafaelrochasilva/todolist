var TodoList = {
	BTN_ADD_ITEM: ".btn-add-item",
	BTN_SUBMIT_ITEM: ".btn-submit-item"
};

TodoList.grabTodoID = function(){
	this.id = $(".title").attr('id');
};

TodoList.addItemListener = function(){

	$(this.BTN_ADD_ITEM).click(function(e){
		e.preventDefault();

		TodoList.grabTodoID();
		TodoView.hideBtn($(this));

		TodoView.makeFormItem(TodoList.id);
	});
};

TodoList.submitItemListener = function(){
	$(this.BTN_SUBMIT_ITEM).click(function(e){
		e.preventDefault();

		TodoView.hideBtn($(this));
		TodoView.displayLoading();

		$.ajax({
			type: "POST",
			url: '/todo_lists/:todo_list_id/list_item',
			dataType: 'json'
		}).done(function(data){
			alert("sent");
		}).fail(function(data){
			alert("Can't create a new Item");
		});
	});
};



