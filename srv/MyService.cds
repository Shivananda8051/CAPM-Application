using { shiva.view } from '../db/CDSViews';
using { shiva.db.master } from '../db/data-model';



service MyService @(path:'MyService') {
  function shiva(name: String(20)) returns String;
  entity ProductOrderSet as projection on view.CDSViews.ProductOrders{
    *,
    ProductOrders,
  };
  entity ReadEmployeSrv as projection on master.Employee{
    *
  };


}
