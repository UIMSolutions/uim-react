module uim.react.apps.app;

import uim.react;

class DReactApp : DH5App {
	this() { super(); }
	this(string aName) { super(aName); }
	this(string aName, string aRootPath) { super(aName, aRootPath); this.layout(ReactLayout); }
// 	this(string aName, string aRootPath, string[string] someParameters) { super(aName, aRootPath, parameters); }

  override void init() {
    this.libraries(
      ["src":"/lib/react/last/react.production.min.js"], 
      ["src":"/lib/react-dom/last/react-dom.prod(uction.min.js"]);
  }

  bool _jsxMode;
  @safe bool jsxMode() { return _jsxMode; }
  @safe O jsxMode(this O)(bool newMode) { _jsxMode = newMode; return cast(O)this; }
  unittest {
    assert(!ReactApp.jsxMode);
    assert(ReactApp.jsxMode(true).jsxMode);
  }

  DReactComponent[] _components;
  O components(this O)(DReactComponent[] addComponents...) { this.components(addComponents); return cast(O)this; }
  O components(this O)(DReactComponent[] addComponents) { _components ~= addComponents; return cast(O)this; }

  override string toString() {
    string result;

    foreach (component; _components) { result ~= component.toString; }

    return result;
  }
}
auto ReactApp() { return new DReactApp; }
auto ReactApp(string aName) { return new DReactApp(aName); }
auto ReactApp(string aName, string aRootPath) { return new DReactApp(aName, aRootPath); }
// auto ReactApp(string aName, string aRootPath, string[string] someParameters) { super(aName, aRootPath, parameters); }

unittest {
  writeln(ReactApp);
}