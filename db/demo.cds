namespace shivadb;
using { shivadb.commons as common  } from './commons';
using { cuid, temporal, managed } from '@sap/cds/common';


context master {
    entity Student : common.address {
        key ID : common.id_type;
        NAME : String(20);
        CLASS : Association to one Standards;
        GENDER : String(1);
        CITY : String(25);
    }
    entity Standards {
        key ID : common.id_type;
        CLASSNAME : String(35);
        SECTIONS : Int16;
        CLASSTEACHER : String(35);
        
    }
    entity Books {
        key ID : common.id_type;
        BOOKNAME : String(30);
        AUTHOR : String(25);
    }
}

context trans {
    entity rentals : cuid, temporal, managed {
        student : Association to master.Student;
        book : Association to master.Books;
    }
}