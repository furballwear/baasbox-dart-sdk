import 'package:baasbox/baasbox.dart';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'dart:async';

void main() {
  useHtmlConfiguration();

  group('OO BaasBox Dart SDK User ', () {
    BaasBoxContext bbCtxt;

    setUp(() {
      bbCtxt = new BaasBoxContext();

    });

    test('Create User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("Giovanni");
      Future result = aBBUser.signup();

      expect(result, completes);

    });

    test('Login User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future result = aBBUser.login();
      result.then((value) => print("Current User " + bbCtxt.getCurrentUser().toString()));

      expect(result, completes);
    });

    test('Fetch User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future result = aBBUser.login();
      result.then((value) => aBBUser.fetch('test').then((onValue) => print("Fetch User $onValue")));

      expect(result, completes);
    });

    test('Current User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future result = aBBUser.login();
      result.then((value) => aBBUser.current().then((onValue) => print("Current User $onValue")));

      expect(result, completes);
    });


    test('Change Password ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future result = aBBUser.login();
      result.then((value) => aBBUser.changePassword('test').then((onValue) {
        print("Change Password $onValue");

      }));
      aBBUser.changePassword('test');

      expect(result, completes);
    });


    test('Follow User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      Future result = loginFuture.then((value) => aBBUser.follow('Giovanni'));

      expect(result, completes);

    });


    test('Followers User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      Future result = loginFuture.then((value) => aBBUser.followers().then((onValue) => print('Followers ' + aBBUser.followersList.toString())));

      expect(result, completes);

    });

    test('Unfollow', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      Future result = loginFuture.then((value) => aBBUser.unfollow('Giovanni'));

      expect(result, completes);

    });

    test('Logout User ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      Future result = loginFuture.then((value) => aBBUser.logout());

      expect(result, completes);

    });

  });
  group('OO BaasBox Dart SDK Document ', () {
    BaasBoxContext bbCtxt;

    setUp(() {
      bbCtxt = new BaasBoxContext();

    });


    test('Create Document ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      BaasBoxDocument bbDocument = new BaasBoxDocument();
      Future<Map> result = loginFuture.then((value) {
        bbDocument.create("testcollection", {
          'text': 'ciao da giovanni'
        }).then((createResponse) => print("Documento creato " + bbDocument.id));

      });

      expect(result, completes);

    });


    test('Delete Document ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      BaasBoxDocument bbDocument = new BaasBoxDocument();
      Future<Map> result = loginFuture.then((value) {
        bbDocument.create("testcollection", {
          'text': 'da cancellare'
        }).then((createResponse) => bbDocument.delete('testcollection').then((onValue) => print('Delete Document $onValue')));

      });

      expect(result, completes);

    });


    test('Count Documents ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      BaasBoxDocument bbDocument = new BaasBoxDocument();
      Future<Map> result = loginFuture.then((value) {
        bbDocument.count("testcollection").then((onValue) => print("Count $onValue"));

      });
      expect(result, completes);

    });



    test('Update Document field ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      BaasBoxDocument bbDocument = new BaasBoxDocument();
      Future<Map> result = loginFuture.then((value) {
        bbDocument.create("testcollection", {
          'text': 'ciao da giovanni'
        }).then((createResponse) {
          bbDocument.updateField('text', bbDocument.id, 'testcollection', {
            'data': 'edited field'
          }).then((onValue) => print("Edit field $onValue"));
        });

      });

      expect(result, completes);

    });
  });

  group('OO BaasBox Dart SDK Collection ', () {
    BaasBoxContext bbCtxt;

    setUp(() {
      bbCtxt = new BaasBoxContext();

    });


    test('Create Collection ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("admin");
      aBBUser.password = 'admin';
      Future loginFuture = aBBUser.login();
      BaasBoxCollection bbCollection = new BaasBoxCollection('collectionnew');
      Future<Map> result = loginFuture.then((value) {
        bbCollection.create().then((createResponse) => print("Collection created $createResponse"));

      });

      expect(result, completes);

    });

    test('Delete Collection ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("admin");
      aBBUser.password = 'admin';
      Future loginFuture = aBBUser.login();
      BaasBoxCollection bbCollection = new BaasBoxCollection('collectionnew');
      Future<Map> result = loginFuture.then((value) {
        bbCollection.delete().then((createResponse) => print("Collection deleted $createResponse"));

      });

      expect(result, completes);

    });

    test('Load Documents ', () {
      BaasBoxUser aBBUser = new BaasBoxUser.withUserName("test");
      aBBUser.password = 'test';
      Future loginFuture = aBBUser.login();
      BaasBoxCollection bbCollection = new BaasBoxCollection('testcollection');
      Future<Map> result = loginFuture.then((value) {
        bbCollection.loadDocuments().then((onValue) => print("Load Documents $onValue"));

      });


      expect(result, completes);

    });
  });

}
