var TodoView = {
	TODO_FORM: ".new_form",
	BTN_ADD_ITEM: ".btn-add-item",
	IMG_LOADER: "http://upload.wikimedia.org/wikipedia/commons/d/de/Ajax-loader.gif"
};

TodoView.hideBtn = function(btn){
	btn.hide();
};

TodoView.makeFormItem = function(todo_list_id){
	var fields = TodoView.addListItem();
	var init_form = "<form action='/todo_lists/"+todo_list_id+"/list_item' method='POST'>";
	var end_form = "</form>";
	var form_item = init_form + fields + end_form;

	$(this.TODO_FORM).append(form_item);
};

TodoView.addListItem = function(){
	var item_input = TodoView.createInputField();
	var add_item_btn = TodoView.createSubmitBtn();
	return item_input + add_item_btn;
};

TodoView.createInputField = function(){
	return "<input id='description' name='todo_list_item[description]'></input>";
};

TodoView.createSubmitBtn = function(){
	return "<input class='btn-submit-item' type='submit' value='Add'>";
};

TodoView.displayLoading = function(){};