using {
    cuid,
    managed
} from '@sap/cds/common';

namespace tutorial.dB;


entity Books : cuid, managed {
    Title       : String;
    //Association example
    Author      : Association to Authors;
    genre       : String;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    //Composition example
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.Author = $self;
}

entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
}
