# My NeoVim Configuration

This configuration uses NvChad and is built for NeoVim 0.10.4

Mostly for Python and C++

---

### Installation

Clone to the `~/.config/` directory

Open using `nvim` command

Run `:MasonInstallAll` to install all the LSPs and Formatters

---

### autopep8 python formatter
Besides the nvim folder located at: 

`~/.config/nvim/`

a pep8 configuration file must also be created at:

`~/.config/pep8`

with the following content:
```
[pep8]
indent-size = 2
```

This changes the indentation size used by autopep8 from 4 spaces to 2 spaces. However, it **does not** affect the continuation (hanging) indentation. As a result, constructs such as multiline dictionaries, lists, or function arguments will still be indented with 4 spaces, because this behavior is fixed in autopep8 according to PEP 8. (Maybe I will switch to another formatter in the future)
