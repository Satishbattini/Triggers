CREATE OR REPLACE FUNCTION delete_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN


    SELECT productLevel3Id INTO v_productLevel3Id
    FROM satish_table
    WHERE id = NEW.id;
   
    DELETE FROM trigger_table WHERE productlevel3_id = (v_productLevel3Id);

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER delete_trigger 
AFTER UPDATE or delete
ON satish_table
FOR EACH ROW
EXECUTE PROCEDURE delete_function();


UPDATE satish_table
SET data = jsonb_set(
    data, 
    '{level3ProductsList}', 
    (SELECT jsonb_agg(elem)
     FROM jsonb_array_elements(data->'level3ProductsList') AS elem
     WHERE elem->>'productLevel3Id' <> '0sfm')
)
WHERE id = '3tgs';









CREATE OR REPLACE FUNCTION delete_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    productLevel3Id TEXT; 
BEGIN
   
    productLevel3Id := (SELECT elem->>'productLevel3Id'
                        FROM jsonb_array_elements(NEW.data->'level3ProductsList') AS elem
                        WHERE elem->>'productLevel3Id' = OLD.data->>'productLevel3Id');
    
   
    UPDATE trigger_table
    SET product = (
        SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(product) AS elem
        WHERE elem->>'productLevel3Id' <> productLevel3Id  
    )
    WHERE id = NEW.id; 

    RETURN NEW;
END;
$$;





CREATE OR REPLACE FUNCTION delete_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    
    UPDATE trigger_table
    SET product = (
        SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(product) AS elem
        WHERE elem->>'productLevel3Id' <> NEW.data->'productLevel3Id'->>0 
    )
    WHERE id = NEW.id;

    RETURN NEW;
END;
$$;





CREATE OR REPLACE FUNCTION delete_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    productLevel3Id TEXT; 
BEGIN
   
    productLevel3Id := OLD.data->>'productLevel3Id';

    UPDATE trigger_table
    SET product = (
        SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(product) AS elem
        WHERE elem->>'productLevel3Id' <> productLevel3Id  
    )
    WHERE id = NEW.id; 

    RETURN NEW;
END;
$$;


create or replace trigger delete_trigger 
after update 
on satish_table
for each row
execute procedure delete_function();

UPDATE satish_table
SET data = jsonb_set(
    data, 
    '{level3ProductsList}', 
    (SELECT jsonb_agg(elem)
     FROM jsonb_array_elements(data->'level3ProductsList') AS elem
     WHERE elem->>'productLevel3Id' <> '3yv7')
)
WHERE id = '3xxe';