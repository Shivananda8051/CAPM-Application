using { shivadb.master as master , shivadb.trans as transation } from '../db/demo';


service MyService {

    entity StudentSet as projection on master.Student;
    entity StandardSet as projection on master.Standards;
    entity BookSet as projection on master.Books;
    entity BookRenalSet as projection on transation.rentals;

}