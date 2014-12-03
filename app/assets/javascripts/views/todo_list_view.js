var TodoView = {
	TODO_FORM: ".new_form",
	BTN_ADD_ITEM: ".btn-add-item"
};

TodoView.hideBtnAddItem = function(){
	$(this.BTN_ADD_ITEM).hide();
};

TodoView.makeFormItem = function(todo_list_id){
	var fields = TodoView.addListItem();
	var init_form = "<form action='/todo_lists/"+todo_list_id+"/list_item/new' method='POST'>";
	var end_form = "</form>";
	var form_item = init_form + fields + end_form;

	$(this.TODO_FORM).append(form_item);
};

TodoView.addListItem = function(){
	var item_input = TodoView.createInputField();
	var add_item_btn = TodoView.createAddItemBtn();
	return item_input + add_item_btn;
};

TodoView.createInputField = function(){
	return "<input name='todo_list_item[description]'></input>";
};

TodoView.createAddItemBtn = function(){
	return "<button class='add-item'>Add</button>";
};