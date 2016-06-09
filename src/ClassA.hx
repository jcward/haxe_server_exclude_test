package;

class ClassA
{
  public function new() {
    // Use some standard libs
    trace(Reflect.fields(this));
    trace("Does ClassB exist now? "+Type.resolveClass('ClassB'));
    trace("Base64.encode: "+haxe.crypto.Base64.encode);
  }

  public static function greet() {
    trace("Hello from ClassA!");
  }
}
