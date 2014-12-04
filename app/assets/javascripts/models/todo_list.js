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

		var form_data = $this.serialize();
		var url = "/todo_lists/"+TodoList.id+"/list_item";

		TodoView.hideElement($this);
		TodoView.displayLoading();

		$.ajax({
			type: 'POST',
			url: url,
			data: form_data,
			dataType: 'json'
		}).done(function(data){
			TodoList.submitItemSuccess($this, data);
		}).fail(function(data){
				alert("Can't create a new Item");

			TodoList.submitItemFail();
		});

	});
};

TodoList.submitItemSuccess = function(form, data){
	TodoView.hideLoading();
	TodoView.showElement(form);

	$("#description").val('');
	TodoView.displayNewListItem(data);
};

TodoList.submitItemFail = function(){
	alert("Can't create a new Item");
	TodoView.hideLoading();
	TodoView.showElement($this);
};







TodoList.deleteItemListener = function(){
	$(".list_items ul").delegate('delete_item', 'click', function(e){
		e.preventDefault();

		alert("deleteItemListener click");

		var $this = $(this).parent();
		var url = $this.attr("href");

		TodoView.hideElement($this);

		$.ajax({
			type: 'DELETE',
			url: url,
			dataType: 'json'
		}).done(function(data){
			alert("deleted");
		}).fail(function(data){
			// alert("Can't delete"+ data);
			console.log(data);
			TodoView.showElement($this);
		});

	});
};
