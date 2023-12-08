// person class created
import 'interface.dart';

class Person implements Role {
  // person class attributes
  String _name;
  int _age;
  String _address;
  Role _role;

  // this is constructor
  Person(this._name, this._age, this._address, this._role);

  // getter methods
  String get getName {
    return _name;
  }

  int get getAge {
    return _age;
  }

  String get getAddress {
    return _address;
  }

  // Role interface methods
  @override
  void displayRole() {
    _role.displayRole();
  }
}
