
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




    UPDATE satish_table
    SET data = jsonb_set(
        data, 
        '{level3ProductsList}', 
        (SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(data->'level3ProductsList') AS elem
        WHERE elem->>'productLevel3Id' <> OLD.productLevel3Id)
    )
    WHERE id = NEW.id;

    UPDATE trigger_table
    SET product = (
        SELECT jsonb_agg(elem)
        FROM jsonb_array_elements(product) AS elem
        WHERE elem->>'productLevel3Id' <> OLD.productLevel3Id
    )
    WHERE id = NEW.id;


drop trigger trigger_name2 on satish_table ;

DROP FUNCTION IF EXISTS delete_function();

DROP FUNCTION IF EXISTS trigger_function2() CASCADE;

ALTER TABLE satish_table ADD COLUMN productLevel3Id text;

\d satish_table