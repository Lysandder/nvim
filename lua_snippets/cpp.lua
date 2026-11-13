local ls = require("luasnip")

return {
  ls.parser.parse_snippet(
    { trig = "code_base", name = "Competitive programming template" },
    [[
#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ull = unsigned long long;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    ll t;
    cin >> t;
    for (ll i = 0; i < t; i++) {
        $0
    }

    return 0;
}]]
  ),
}
