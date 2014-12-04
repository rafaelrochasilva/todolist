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
		TodoView.hideElement($(this));

		TodoView.makeFormItem(TodoList.id);
	});
};

TodoList.submitItemListener = function(){
	$(".new_form").delegate('form', 'submit', function(e){
		e.preventDefault();
		var $this = $(this);

		var data = $this.serialize();
		var url = "/todo_lists/"+TodoList.id+"/list_item";

		TodoView.hideElement($this);
		TodoView.displayLoading();

		$.post(url, data)
			.done(function(data){
				//TodoView.displayNewListItem();
				TodoView.hideLoading();
			}).fail(function(data){
				alert("Can't create a new Item");
				TodoView.hideLoading();
				TodoView.showElement($this);
			});
	});
};



