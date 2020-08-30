import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  // Connect db
  var mongo =
      '';
  var db = await Db.create(mongo);
  await db.open();
  // connect to users table
  var coll = db.collection('users');
  // select all users from db
  var users = await coll.find().toList();
  print(users);
  // find a user in user table using email
  var findUser =
      await coll.find(where.eq('email', 'billgates@example.com')).toList();
  print(findUser);
  // insert new data
  var document = {
    'username': 'Mike joke',
    'email': 'testmikke@example.com',
    'date': DateTime.now().toString()
  };
  await coll.insert(document);
  print('document added');
  //update name in document
  await coll.update(
      where.eq(
        'username',
        'Mike joke',
      ),
      modify.set('username', 'Mike Jose'));
  print('document updated');
  // remove user from table
  coll.remove(where.eq('_id', 'ObjectId("5f2aea56940eaf19a4cffae6")'));
  print('removed');
  // close db
  await db.close();
}
