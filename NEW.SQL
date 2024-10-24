CREATE OR REPLACE FUNCTION trigger_function2()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
DECLARE 
    v_productLevel3Id TEXT;
BEGIN 
    
    SELECT productLevel3Id INTO v_productLevel3Id
    FROM satish_table
    WHERE id = NEW.id;

    INSERT INTO trigger_table(
        id, data, product, base_category_id, base_category_value, storeType, 
        productlevel1_id, productlevel1_title, productlevel2_id, productlevel2_title, 
        productlevel3_id, productlevel3_title, stores, domain, hsncode, main_category_id, 
        main_category_value, sub_category1_id, sub_category1_value, sub_category2_id, 
        sub_category2_value, sub_category3_id, sub_category3_value, 
        manufacturer_profilekey, manufacturer_firstname, manufacturer_businesskey, 
        manufacturer_business_typename, manufacturer_profile_pic_url, 
        manufacturer_lat_long, manufacturer_location, manufacturer_contact_info, 
        manufacturer_district, manufacturer_state, manufacturer_country, 
        manufacturer_memberof, reseller_profilekey, reseller_firstname, 
        reseller_businesskey, reseller_businesstype_name, reseller_profilepic_url, 
        reseller_lat_long, reseller_location, reseller_contactinfo, reseller_district, 
        reseller_state, reseller_country, reseller_memberof, parentof, attachments, 
        sellertype, tenure, loanamount, presanction, postsanction, otherdocuments, 
        specialtags, revolvingtypes, shareholdermembers, isonline, isoffline, 
        shipping, shipping_details, sku_createdts, sku_lut, mrp, price_per_unit, 
        smart_elements, tax_details, isbulkorder, selected_trade_specifications, 
        master_product_type, base_product_id, base_product_name, variety_id, variety_name, 
        derivative_id, derivative_name, varietyof_id, varietyof_name, derivativeof_id, 
        derivativeof_name, variant_createdby_profilekey, variant_createdby_firstname, 
        variant_updatedby_profilekey, variant_updatedby_firstname, variant_ispublished, 
        variant_isreviewaccepted, variant_isreviewinprogress, variant_isforreview, 
        variant_createdts, variant_lut, sku_createdby_profilekey, sku_createdby_firstname, 
        sku_updatedby_profilekey, sku_updatedby_firstname, sku_isforreview, sku_ispublished, 
        sku_isreviewinprogress, sku_isreviewaccepted, appname, isunifiedstoreproduct
    ) 
    SELECT 
        OLD.id, (NEW.data - 'level3ProductsList'), 
        jsonb_array_elements(NEW.data->'level3ProductsList'), 
        NEW.data->'baseCategory'->'id', NEW.data->'baseCategory'->'value', 
        NEW.data->'storeType', NEW.data->'productLevel1Id', NEW.data->'productLevel1Title', 
        NEW.data->'productLevel2Id', NEW.data->'productLevel2Title', 
        elem->>'productLevel3Id', elem->>'productLevel3Title', 
        NEW.data->'stores', NEW.data->'domain', elem->'hsncode', 
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'mainCategory'->'id', 
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'mainCategory'->'value',
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory1'->'id', 
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory1'->'value', 
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory2'->'id',
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory2'->'value',
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory3'->'id', 
        jsonb_array_elements(NEW.data->'unifiedStore'->'categories')->'subCategory3'->'value', 
        COALESCE(NEW.data->'manufacturerDetails'->'profileKey', '0'),
        
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
    new.data ->'attachments',
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
    elem->'shippingDetails'->'dimension'->'units',
    elem->'createdTS',
    elem->'LUT',
    elem->'mrp',
    elem->'pricePerUnit',
    elem->'smartElements',
    elem->'taxDetails',
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
    elem->'createdBy'->'profileKey',
    elem->'createdBy'->'firstName',
    elem->'updatedBy'->'profileKey',
    elem->'updatedBy'->'firstName',
    (elem->'isForReview')::boolean,
    (elem->'isPublished')::boolean,
    (elem->'isReviewInProgress')::boolean,
    (elem->'isReviewAccepted')::boolean,
    Coalesce(new.data ->'appname','0'),
    (new.data ->>'isUnifiedStoreProduct')::boolean
    FROM jsonb_array_elements(NEW.data->'level3ProductsList') AS elem;

    IF NEW.actiontype = 'update' THEN

        UPDATE satish_table
        SET data = jsonb_set(
            data, 
            '{level3ProductsList}', 
            (SELECT COALESCE(jsonb_agg(elem), '[]'::jsonb)
             FROM jsonb_array_elements(data->'level3ProductsList') AS elem
             WHERE elem->>'productLevel3Id' <> v_productLevel3Id)
        )
        WHERE id = NEW.id;

        DELETE FROM trigger_table WHERE productlevel3_id = v_productLevel3Id;
    END IF;

    RETURN NEW;
END;
$$;
