package;

class Main
{

  public function new() {
    trace("Hello from main()");
    var a = new ClassA();
    ClassA.greet();
    var b = new ClassB();
    ClassB.greet();
  }

  @:keep
  public static function main()
  {
    new Main();
  }
}
