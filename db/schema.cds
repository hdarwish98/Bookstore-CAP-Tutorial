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
    stock       : Integer;
    status      : Association to Bookstatus;
    //Composition example
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Bookstatus {
    key code        : BookStatusCode;
        criticality : Integer;
        displayText : String;
}

type BookStatusCode : String(1) enum {
    Available = 'A';
    LowStock = 'L';
    Unavailable = 'U';
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
