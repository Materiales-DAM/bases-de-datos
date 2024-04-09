# Funciones



Creación de funciones

<pre class="language-plsql"><code class="lang-plsql"><strong>CREATE
</strong>    FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

func_parameter:
    param_name type

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
}

routine_body:
    SQL routine
</code></pre>
