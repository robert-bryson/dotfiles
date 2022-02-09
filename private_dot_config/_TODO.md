misc things that I still need to do

- [ ] probably should be `update.sh` instead of `update.fish`

- [ ] auto set fish as default shell shell

    Put something like this in `.profile` or `.bashrc` or something

    ```sh
    [ -n $(which fish) ] && [ -z $(grep fish /etc/shells) ] && echo which fish > /etc/shell
    chsh -s $(which fish)
    ```

- [ ] make sure `fisher` handles plugin install/update correctly in
  `update.sh`

