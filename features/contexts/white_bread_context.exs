defmodule WhiteBreadContext do
  use WhiteBread.Context

  given_ ~r/^the products are listed$/, fn state ->
    {:ok, state}
  end

  and_ ~r/^a product is selected to rate$/, fn state ->
    {:ok, state}
  end

  and_ ~r/^in the rating page I enter the email address and rating$/, fn state ->
    {:ok, state}
  end

  when_ ~r/^I click on the "(?<argument_one>[^"]+)" button$/,
        fn state, %{argument_one: _argument_one} ->
          {:ok, state}
        end

  then_ ~r/^I am taken back to the product list page and the average rating is updated$/, fn state ->
    {:ok, state}
  end


end
