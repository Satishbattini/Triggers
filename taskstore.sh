create  or replace function trigger_function()
returns trigger 
language plpgsql

as 
$$

declare 
t_id text;
t_data jsonb;
t_product jsonb;

begin 
    t_id:=(new.id);
    t_data :=(new.data-'level3ProductsList');
  t_product :=(new.data->>'level3ProductsList' );

 insert into trigger_table(id , data , product,base_category_id,base_category_value,storeType,productlevel1_id,productlevel1_title,productlevel2_id,productlevel2_title,productlevel3_id,productlevel3_title,stores,domain,hsncode,main_category_id,main_category_value,sub_category1_id,sub_category1_value,sub_category2_id,sub_category2_value,sub_category3_id,sub_category3_value,manufacturer_profilekey,manufacturer_firstname,manufacturer_businesskey,manufacturer_business_typename,manufacturer_profile_pic_url,manufacturer_lat_long,manufacturer_location,manufacturer_contact_info,manufacturer_district,manufacturer_state,manufacturer_country,manufacturer_memberof,
 reseller_profilekey,reseller_firstname,reseller_businesskey,reseller_businesstype_name,reseller_profilepic_url,reseller_lat_long,reseller_location,reseller_contactinfo,reseller_district,reseller_state,reseller_country,reseller_memberof,parentof,attachments,sellertype,tenure,loanamount,presanction,postsanction,otherdocuments,specialtags,revolvingtypes,shareholdermembers,isonline,isoffline,
shipping,
shipping_details,
sku_createdts,
sku_lut,
mrp,
price_per_unit,
smart_elements,
tax_details,
isbulkorder,
selected_trade_specifications,
master_product_type,
base_product_id,
base_product_name,
variety_id,
variety_name,
derivative_id,
derivative_name,
varietyof_id,
varietyof_name,
derivativeof_id,
derivativeof_name,
variant_createdby_profilekey,
variant_createdby_firstname,
variant_updatedby_profilekey,
variant_updatedby_firstname,
variant_ispublished,
variant_isreviewaccepted,
variant_isreviewinprogress,
variant_isforreview,
variant_createdts,
variant_lut,
sku_createdby_profilekey,
sku_createdby_firstname,
sku_updatedby_profilekey,
sku_updatedby_firstname,
sku_isforreview,
sku_ispublished,
sku_isreviewinprogress,
sku_isreviewaccepted,
appname,
isunifiedstoreproduct
 ) values(t_id,t_data,t_product,
   new.data->'baseCategory' ->'id',
   new.data->'baseCategory' -> 'value' ,
   new.data ->'storeType',
   new.data -> 'productLevel1Id',
   new.data ->'productLevel1Title',
   new.data ->'productLevel2Id',
   new.data ->'productLevel2Title',
   jsonb_array_elements(new.data ->'level3ProductsList')->'productLevel3Id',
   jsonb_array_elements(new.data ->'level3ProductsList')->'productLevel3Title',
   new.data ->'stores',
   new.data ->'domain',
   Coalesce( new.data ->'level3ProductsList'->0->'hsncode','0'),
   Coalesce( new.data ->'unifiedStore'->'categories'->0->'mainCategory'->'id','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'mainCategory'->'value','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory1'->'id','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory1'->'value','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory2'->'id','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory2'->'value','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory3'->'id','0'),
   Coalesce(new.data ->'unifiedStore'->'categories'->0->'subCategory3'->'value','0'),
   Coalesce(new.data ->'manufacturerDetails'->'profileKey','0'),
   Coalesce(new.data ->'manufacturerDetails'->'firstName','0'),
   Coalesce(new.data ->'manufacturerDetails'->'businessKey','0'),
   Coalesce(new.data ->'manufacturerDetails'->'businessTypeName','0'),
   Coalesce(new.data ->'manufacturerDetails'->'profilePicURL','0'),
   Coalesce(new.data ->'manufacturerDetails'->'latLong','0'),
   Coalesce(new.data ->'manufacturerDetails'->'location','0'),
   Coalesce(new.data ->'manufacturerDetails'->'Contactinfo','0'),
   Coalesce(new.data ->'manufacturerDetails'->'district','0'),
   Coalesce(new.data ->'manufacturerDetails'->'state','0'),
   Coalesce(new.data ->'manufacturerDetails'->'country','0'),
   Coalesce(new.data ->'manufacturerDetails'->'memberOf'->0,'0'),
   Coalesce(new.data ->'resellerDetails'->'profileKey','0'),
   Coalesce(new.data ->'resellerDetails'->'firstName','0'),
   Coalesce(new.data ->'resellerDetails'->'businessKey','0'),
   Coalesce(new.data ->'resellerDetails'->'businessTypeName','0'),
   Coalesce(new.data ->'resellerDetails'->'profilePicURL','0'),
   Coalesce(new.data ->'resellerDetails'->'latLong','0'),
   Coalesce(new.data ->'resellerDetails'->'location','0'),
   Coalesce(new.data ->'resellerDetails'->'Contactinfo','0'),
   Coalesce(new.data ->'resellerDetails'->'district','0'),
   Coalesce(new.data ->'resellerDetails'->'state','0'),
   Coalesce(new.data ->'resellerDetails'->'country','0'),
   Coalesce(new.data ->'resellerDetails'->'memberOf'->0,'0'),
    Coalesce(new.data ->'parentof','0'),
    Coalesce(new.data ->'attachments'->0->'attachments'->0->'url','0'),
    Coalesce(new.data ->'sellerType','0'),
    Coalesce(new.data ->'tenure','0'),
    Coalesce(new.data ->'loanamount','0'),
    Coalesce(new.data ->'presanction','0'),
    Coalesce(new.data ->'postsanction','0'),
    Coalesce(new.data ->'otherdocuments','0'),
    Coalesce(new.data ->'specialtags','0'),
    Coalesce(new.data ->'revolvingtypes','0'),
    Coalesce(new.data ->'shareholdermembers','0'),
    Coalesce((new.data ->> 'isonline')::boolean, FALSE),
    Coalesce((new.data ->> 'isoffline')::boolean, FALSE),
    Coalesce(new.data ->'shipping','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'shippingDetails'->'dimension'->'units','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'createdTS','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'LUT','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'mrp','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'pricePerUnit','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'smartElements','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'taxDetails','0'),
    Coalesce((new.data ->> 'isBulkOrder')::boolean, FALSE),
    Coalesce(new.data ->'selectedTrSpecsQuery','0'),
    Coalesce(new.data ->'productType','0'),
    Coalesce(new.data ->'baseProduct'->'productId','0'),
    Coalesce(new.data ->'baseProduct'->'productName','0'),
    Coalesce(new.data ->'variety'->'VProductId','0'),
    Coalesce(new.data ->'variety'->'VProductName','0'),
    Coalesce(new.data ->'derivative'->'VProductId','0'),
    Coalesce(new.data ->'derivative'->'VProductName','0'),
    Coalesce(new.data ->'varietyOf'->'VProductId','0'),
    Coalesce(new.data ->'varietyOf'->'VProductName','0'),
    Coalesce(new.data ->'derivativeOf'->'VProductId','0'),
    Coalesce(new.data ->'derivativeOf'->'VProductName','0'),
    Coalesce(new.data ->'createdBy'->'profileKey','0'),
    Coalesce(new.data ->'createdBy'->'firstName','0'),
    Coalesce(new.data ->'updatedBy'->'profileKey','0'),
    Coalesce(new.data ->'updatedBy'->'firstName','0'),
    Coalesce((new.data ->>'isPublished')::boolean, FALSE),
    Coalesce((new.data ->>'isReviewAccepted')::boolean,FALSE),
    Coalesce((new.data ->>'isReviewInProgress')::boolean,TRUE),
    Coalesce((new.data ->>'isForReview')::boolean,TRUE),
    Coalesce(new.data ->'createdTS','0'),
    Coalesce(new.data ->'LUT','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'createdBy'->'profileKey','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'createdBy'->'firstName','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'updatedBy'->'profileKey','0'),
    Coalesce(new.data ->'level3ProductsList'->0->'updatedBy'->'firstName','0'),
    Coalesce((new.data ->'level3ProductsList'->0->>'isForReview')::boolean,false),
    Coalesce((new.data ->'level3ProductsList'->0->>'isPublished')::boolean,TRUE),
    Coalesce((new.data ->'level3ProductsList'->0->>'isReviewInProgress')::boolean,TRUE),
    Coalesce((new.data ->'level3ProductsList'->0->>'isReviewAccepted')::boolean,TRUE),
    Coalesce(new.data ->'appname','0'),
    Coalesce((new.data ->'isUnifiedStoreProduct')::boolean,TRUE)


   );


return new;

end;

$$;

create or replace trigger trigger_name
  before update
  ON satish_table
  for each row
  execute procedure trigger_function();

update satish_table set data=jsonb_set(data,'{crop}','"paddy"') where id='3tgs';

update satish_table set data= data-'level3ProductsList' as level3ProductsList where id ='3tef';

-----
 3tgs
 3uqj
 3xxe
new.data ->'level3ProductsList'->0->'productLevel3Title',

#update data set address =address - 'street' where id=3;
# update metro set metro =jsonb_set(metro,'{routes,0,schedule,0,status}','"active"') where id ='3t8p';