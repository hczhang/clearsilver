
Start of File

<?cs if:Blah == "wow" ?>
  Blah == wow
<?cs else ?>
  Blah != wow
<?cs /if ?>


<?cs  if:!#0 ?>

<?cs if:arg1 ?>
wow (true)
<?cs else ?>
other (false)
<?cs /if ?>

<?cs if:#5 ?>
  This is True
<?cs /if ?>

<?cs if:Blah == Foo ?>
<?cs /if ?>

<?cs if:Blah < #5 ?>
  <?cs var:Blah ?>
<?cs /if ?>

<?cs include:"test2.cs" ?>

<?cs each: x=Foo.Bar.Baz ?>
  x = <?cs var:x ?>
  x.num = <?cs var:x.num ?>

<?cs if:#1 ?>
  This is True.
<?cs /if ?>
wow
<?cs /each ?>
<?cs /if ?>

<?cs if:#Wow.Foo ?>
  This is False.
<?cs /if ?>

<?cs each:x=Outside ?>
  Outside <?cs name:x ?>
  <?cs each:y=x.Inside ?>
    Inside = <?cs var:y ?>
  <?cs /each ?>
<?cs /each ?>

<?cs if:TestIf == "0" ?>
  TestIf == 0
<?cs elif:TestIf == "1" ?>
  <?cs var:TestIf ?>
  TestIf == 1
<?cs else ?>
  TestIf == else
<?cs /if ?>

More?
