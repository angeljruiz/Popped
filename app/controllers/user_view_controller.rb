class UserViewController < UIViewController
  extend IB

  attr_accessor :name, :id, :messages, :table

  outlet :nameLabel, UILabel
  outlet :table, UITableView

  def viewDidLoad
    super
    nameLabel.text = @name
    nameLabel.sizeToFit
    loadMessages do
      @table.delegate = self
      @table.dataSource = self
      @table.reloadData
    end
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier('uMesg')
    cell.name.text = @name
    cell.name.sizeToFit
    cell.message.text = @messages[indexPath.row][:messages]
    cell.message.sizeToFit


    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @messages.count
  end

  def loadMessages(&block)
    BW::HTTP.get("http://localhost/getMessages", payload: {id: @id}) do |response|
      @messages = BW::JSON.parse(response.body.to_str())
      block.call
    end
  end
end
