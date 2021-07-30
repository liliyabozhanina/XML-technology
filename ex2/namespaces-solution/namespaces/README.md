### Пространства от имена (XML Namespaces)

Изтеглете архива и отворете проекта в IntelliJ Idea.

1.  Отворете `map.kml` за редактиране
2.  Поставете елементите в правилните пространства от имена
    (namespaces):
    -   `author` и вложените в него елементи -
        `http://www.w3.org/2005/Atom`
    -   `link` - `http://www.w3.org/2005/Atom`
    -   `AddressDetails` и вложените в него елементи -
        `urn:oasis:names:tc:ciq:xsdschema:xAL:2.0`
    -   всички останали елементи - `http://www.opengis.net/kml/2.2`
3.  `map.kml` трябва да преминава успешно валидацията

Пространствата от имена, дадени по-горе, са част съответно от
[Atom], [eXtensible Address Language] и [KML].

  [Atom]: https://validator.w3.org/feed/docs/atom.html
  [eXtensible Address Language]: https://www.oasis-open.org/committees/ciq/ciq.shtml#6
  [KML]: https://developers.google.com/kml/

