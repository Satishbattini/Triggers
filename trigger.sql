create  or replace function trigger_function2()
returns trigger 
language plpgsql

as 
$$

declare 
t_id text;
t_data jsonb;
v_productLevel3Id text;

begin 


    SELECT productLevel3Id INTO v_productLevel3Id
    FROM satish_table
    WHERE id = NEW.id;
    
    delete from trigger_table12 where id = new.id;
    
    t_id:=(OLD.id);
    t_data :=(new.data-'level3ProductsList');
 insert into trigger_table12(id , data , product,base_category_id,base_category_value,storeType,productlevel1_id,productlevel1_title,productlevel2_id,productlevel2_title,productlevel3_id,productlevel3_title,stores,domain,hsncode,main_category_id,main_category_value,sub_category1_id,sub_category1_value,sub_category2_id,sub_category2_value,sub_category3_id,sub_category3_value,manufacturer_profilekey,manufacturer_firstname,manufacturer_businesskey,manufacturer_business_typename,manufacturer_profile_pic_url,manufacturer_lat_long,manufacturer_location,manufacturer_contact_info,manufacturer_district,manufacturer_state,manufacturer_country,manufacturer_memberof,
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
 ) values(t_id,t_data,
  jsonb_array_elements(new.data->'level3ProductsList'),
   new.data->'baseCategory' ->'id',
   new.data->'baseCategory' -> 'value' ,
   new.data ->'storeType',
   new.data -> 'productLevel1Id',
   new.data ->'productLevel1Title',
   new.data ->'productLevel2Id',
   new.data ->'productLevel2Title',
   jsonb_array_elements(new.data ->'level3ProductsList')->>'productLevel3Id',
   jsonb_array_elements(new.data ->'level3ProductsList')->>'productLevel3Title',
   new.data ->'stores',
   new.data ->'domain',
  jsonb_array_elements(new.data ->'level3ProductsList')->'hsncode',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'mainCategory'->'id',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'mainCategory'->'value',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory1'->'id',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory1'->'value',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory2'->'id',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory2'->'value',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory3'->'id',
  jsonb_array_elements( new.data ->'unifiedStore'->'categories')->'subCategory3'->'value',
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
    jsonb_array_elements(new.data ->'attachments'),
    Coalesce(new.data ->'sellerType','0'),
    Coalesce(new.data ->'tenure','0'),
    Coalesce(new.data ->'loanamount','0'),
    Coalesce(new.data ->'presanction','0'),
    Coalesce(new.data ->'postsanction','0'),
    Coalesce(new.data ->'otherdocuments','0'),
    Coalesce(new.data ->'specialtags','0'),
    Coalesce(new.data ->'revolvingtypes','0'),
    Coalesce(new.data ->'shareholdermembers','0'),
    (new.data ->> 'isonline')::boolean, 
    (new.data ->> 'isoffline')::boolean,
    Coalesce(new.data ->'shipping','0'),
    jsonb_array_elements(new.data ->'level3ProductsList')->'shippingDetails'->'dimension'->'units',
    jsonb_array_elements(new.data ->'level3ProductsList')->'createdTS',
    jsonb_array_elements(new.data ->'level3ProductsList')->'LUT',
    jsonb_array_elements(new.data ->'level3ProductsList')->'mrp',
    jsonb_array_elements(new.data ->'level3ProductsList')->'pricePerUnit',
    jsonb_array_elements(new.data ->'level3ProductsList')->'smartElements',
    jsonb_array_elements(new.data ->'level3ProductsList')->'taxDetails',
    (new.data ->> 'isBulkOrder')::boolean,
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
    (new.data ->>'isPublished')::boolean,
    (new.data ->>'isReviewAccepted')::boolean,
    (new.data ->>'isReviewInProgress')::boolean,
    (new.data ->>'isForReview')::boolean,
    Coalesce(new.data ->'createdTS','0'),
    Coalesce(new.data ->'LUT','0'),
    jsonb_array_elements(new.data ->'level3ProductsList')->'createdBy'->'profileKey',
    jsonb_array_elements(new.data ->'level3ProductsList')->'createdBy'->'firstName',
    jsonb_array_elements(new.data ->'level3ProductsList')->'updatedBy'->'profileKey',
    jsonb_array_elements(new.data ->'level3ProductsList')->'updatedBy'->'firstName',
    (jsonb_array_elements(new.data ->'level3ProductsList')->'isForReview')::boolean,
    (jsonb_array_elements(new.data ->'level3ProductsList')->'isPublished')::boolean,
    (jsonb_array_elements(new.data ->'level3ProductsList')->'isReviewInProgress')::boolean,
    (jsonb_array_elements(new.data ->'level3ProductsList')->'isReviewAccepted')::boolean,
    Coalesce(new.data ->'appname','0'),
    (new.data ->>'isUnifiedStoreProduct')::boolean


   );

    IF new.actiontype='delete' THEN

    DELETE FROM trigger_table WHERE productlevel3_id = (v_productLevel3Id);

    end if;

   
return new;

end;

$$;

create or replace trigger trigger_name2
  after update
  ON satish_table
  for each row
  execute procedure trigger_function2();


   UPDATE satish_table
SET data = jsonb_set(
    data, 
    '{level3ProductsList}', 
    (SELECT jsonb_agg(elem)
     FROM jsonb_array_elements(data->'level3ProductsList') AS elem
     WHERE elem->>'productLevel3Id' <> '3zrh')  
)
WHERE id = '3xxe' AND actiontype = 'delete';

UPDATE satish_table
SET data = jsonb_set(
    data,
    '{level3ProductsList}',
    (
      SELECT jsonb_agg(
        CASE
          WHEN elem->>'productLevel3Id' = '3yv7'
          THEN jsonb_set(elem, '{productLevel3ShortTitle}', '"ShortTitle"')
          ELSE elem
        END
      )
      FROM jsonb_array_elements(data->'level3ProductsList') AS elem
    )
)
WHERE id='3xxe' and actiontype = 'update';

