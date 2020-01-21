class MainView < UIView
  attr_accessor :button
  def init
    super
    self.backgroundColor = UIColor.whiteColor

    @button = UIButton.new
    @button.setTitle('Buttono', forState: UIControlStateNormal)
    @button.setTitleColor(UIColor.redColor, forState: UIControlStateNormal)
    @button.frame = [[20, 200], [250, 30]]

    addSubview(@button)

    label = UILabel.new
    label.text = 'Labelo'
    label.textColor = UIColor.blueColor
    label.frame = [[20, 150], [250, 30]]

    addSubview(label)

    field = UITextField.new
    field.placeholder = 'Enter stuff'
    field.backgroundColor = UIColor.grayColor
    field.frame = [[20, 250], [250, 30]]

    addSubview(field)
  end
end
