# Specbug

If you are dumb and you type `type` instead of `spec` elixir gives you an error message that is not
helpful, and your builds fail.

Here is how you can do that:

```elixir
defmodule Specbug do
  # This should say spec, but your brain betrays you
  @type hello(String.t()) :: String.t()
  def hello(world) do
    world
  end
end
```

To see the error:

```sh
mix test
```

```
Compiling 1 file (.ex)

== Compilation error in file lib/specbug.ex ==
** (CompileError) lib/specbug.ex: internal error in lint_module;
crash reason: badarg

  in function  atom_to_list/1
     called as atom_to_list({'.',[{line,2}],
      [{'__aliases__',[{line,2},{counter,-576460752303422973}],['String']},
       t]})
  in call from erl_lint:'-check_type/2-fun-0-'/3 (erl_lint.erl, line 2808)
  in call from dict:fold_bucket/3 (dict.erl, line 460)
  in call from dict:fold_seg/4 (dict.erl, line 456)
  in call from dict:fold_segs/4 (dict.erl, line 452)
  in call from lists:foldl/3 (lists.erl, line 1263)
  in call from erl_lint:forms/2 (erl_lint.erl, line 689)
  in call from erl_lint:module/3 (erl_lint.erl, line 534)
    (stdlib) lists.erl:1338: :lists.foreach/2
    (stdlib) erl_eval.erl:670: :erl_eval.do_apply/6
```

This won't help you find your mistake!
