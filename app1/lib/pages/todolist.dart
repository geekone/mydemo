import "package:flutter/material.dart";



//https://www.jianshu.com/p/052bdb7349c2
//TODOList
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  // List<String> _todoItems = List.generate(20, (i)=>'item ${i}');
    List<String> _todoItems = [];
  
  Widget TodoListView(){
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context,index){
        return TodoItem(index);
      }
    );
  }

  //因为事项单独的事件，最好再起一个widget
  Widget TodoItem(int i){
    return ListTile(
      title: Text(_todoItems[i]),
    );
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: Text('待办清单'),
            ),
            body: Center(
              child: _todoItems.length == 0 ? Text('点击开始添加',style: TextStyle(fontSize: 20.0,color: Colors.grey)) : TodoListView(),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'add todoitem',
              child: Icon(Icons.add,size: 25.0,),
              onPressed: ()=>_todoEdit()
            ),
          );

    }

    //点击右下角的按钮后，将新的路由页面推入栈中，该页面包含一个文本编辑控件，用于用户编辑内容。
  void _todoEdit() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('添加待办事项'),
          // leading: new BackButton(),
        ),
        body: new TextField(
          decoration: new InputDecoration(
            hintText: '编辑待办事项',
            contentPadding: const EdgeInsets.all(10.0),
          ),
          onSubmitted: (text) {
            if (text.length == 0) {
              Navigator.of(context).pop();
            } else {
              _todoItemsChanged(text);
              Navigator.of(context).pop();
            }
          },
        ),
      );
    }));
  }
   
    //待办事项列表有新的变化，通过setState重绘页面UI
  _todoItemsChanged(String text) {
    setState(() {
      _todoItems.add(text);
    });
  }


}