package;

class ClassB
{
  public function new() {
    // Use some standard libs
    trace(Reflect.fields(this));
    trace("Does ClassA exist now? "+Type.resolveClass('ClassA'));
    trace("Base64.decode: "+haxe.crypto.Base64.decode);
  }

  public static function greet() {
    trace("Hello from ClassB!");
  }
}
