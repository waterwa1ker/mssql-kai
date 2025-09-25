SELECT
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique AS IsUnique,
    c.name AS ColumnName,
    ic.key_ordinal AS ColumnOrder
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE i.type_desc <> 'HEAP'
  AND t.is_ms_shipped = 0
ORDER BY TableName, IndexName, ColumnOrder;
