class HelloWorld
  def say_hello
    'Hello World!'
  end
end

describe HelloWorld do
  it 'should print Hello World!' do
    hw = HelloWorld.new
    msg = hw.say_hello
    expect(msg).to eq('Hello World!')
  end
end
