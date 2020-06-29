# Rsync SSH Commands

Action to rsync file to a remote server using SSH.

## Example

```yml
- name: Run remote command
  uses: itk-dev/actions-rsync@master
  with:
    src: web/themes/aarhus_theme/build
    dest: ${{ secrets.PATH }}/web/themes/aarhus_theme/build
    host: ${{ secrets.HOST }}
    key: ${{ secrets.PRIVATE_KEY }}
    cert: ${{ secrets.PUBLIC_KEY_CERT }}
```

You should use GitHub secrest to store the host and private ssh key and the key should be without password.

## Secrets

These options should be create using secrets.

* HOST
* PRIVATE_KEY
* PUBLIC_KEY_CERT

## Options

* src: Source directory (default: $GITHUB_WORKSPACE).
* dest: Remote destionation directory
* host: FQDN - Server hostname
* user: Remote SSH username (default: deploy)
* port: Remote port number (default 22)
* key: File Location or string that contains a private key
* cert: Public signed certificate
* args: Extra SSH parameters