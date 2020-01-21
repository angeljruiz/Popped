class CityViewController < UIViewController
  extend IB

  attr_accessor :table, :users, :uid, :selected_user

  outlet :table, UITableView
  ib_action :test


  def viewDidLoad
    super
    loadUsers do
      @table.delegate = self
      @table.dataSource = self
      @table.reloadData
    end
  end

  def test(sender)
    cell = sender.center
    @selected_user = sender.currentTitle
    root = sender.superview.convertPoint(cell, toCoordinateSpace: @table)
    path = @table.indexPathForRowAtPoint(root)
    temp = tableView(@table, cellForRowAtIndexPath: path)
    @uid = temp.hid.text
    performSegueWithIdentifier('showUser', sender: self)
  end

  def prepareForSegue(segue, sender: sender)
    super
    userController = segue.destinationViewController
    userController.name = @selected_user
    userController.id = @uid
  end


  def alert_controller
    @alert_controller = UIAlertController.alertControllerWithTitle('Mah buddy', message: 'you did the thing', preferredStyle: UIAlertControllerStyleAlert)
    ok_action = UIAlertAction.actionWithTitle('Ok', style: UIAlertActionStyleDefault, handler: nil)
    @alert_controller.addAction ok_action
    self.presentViewController(@alert_controller, animated: true, completion: nil)
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)

    cell = tableView.dequeueReusableCellWithIdentifier('cPost')
    cell.pimage.image = UIImage.imageNamed('df.png')
    cell.name.setTitle(@users[indexPath.row][:name], forState: UIControlStateNormal)
    cell.name.sizeToFit
    cell.hid.text = @users[indexPath.row][:id]

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @users.count
  end


end

def loadUsers(&block)
  BW::HTTP.get("http://localhost/getUsers") do |response|
    @users = BW::JSON.parse(response.body.to_str())
    block.call
  end
end
