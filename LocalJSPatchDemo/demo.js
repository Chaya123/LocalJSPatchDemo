require('UIButton,UIScreen,UIColor');

defineClass('ViewController', {
            handleBtn: function(sender) {
            var tableViewCtrl = LCJTableViewController.alloc().init()
            self.navigationController().pushViewController_animated(tableViewCtrl, YES)
        },
//            viewDidLoad: function() {
//            self.super().viewDidLoad();
//            self.setTitle("lcjvc");
//            var screenBounds = UIScreen.mainScreen().bounds();
//            var btnFrame = {x:0, y:200, width:screenBounds.width, height:50};
//            var btn = UIButton.alloc().initWithFrame(btnFrame);
//            btn.setTitle_forState("Push LCJTableViewController", 0);
//            btn.addTarget_action_forControlEvents(self, 'handleBtn:', 1111111);
//            btn.setBackgroundColor(UIColor.redColor());
//            self.view().addSubview(btn);
//        }
    })

defineClass('LCJTableViewController : UITableViewController <UIAlertViewDelegate>', ['data'], {
  dataSource: function() {
    var data = self.data();
    if (data) return data;
    var data = [];
    for (var i = 0; i < 20; i ++) {
      data.push("cell from js " + i);
    }
    self.setData(data)
    return data;
  },
  numberOfSectionsInTableView: function(tableView) {
    return 1;
  },
  tableView_numberOfRowsInSection: function(tableView, section) {
    return self.dataSource().length;
  },
  tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") 
    if (!cell) {
      cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
    }
    cell.textLabel().setText(self.dataSource()[indexPath.row()])
    return cell
  },
  tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
    return 60
  },
  tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
     //tableView.deselectRowAtIndexPath_animated(indexPath, YES);
     var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource()[indexPath.row()], self, "OK",  null);
     alertView.show()
  },
  alertView_willDismissWithButtonIndex: function(alertView, idx) {
    console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
  }
})
