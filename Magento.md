## Magento 2 Development Tools

### [modman (Module Manager)](https://github.com/colinmollenhour/modman)
```
bash < <(curl -s -L https://raw.github.com/colinmollenhour/modman/master/modman-installer)
# It downloads the script in ~/bin/ folder

modman --help
```

### [Nginx Virtual Host Creator](https://github.com/MagePsycho/nginx-virtual-host-bash-script)
```
curl -0 https://raw.githubusercontent.com/MagePsycho/nginx-virtual-host-bash-script/master/src/vhost-nginx.sh -o vhost-nginx.sh
chmod +x vhost-nginx.sh
sudo mv vhost-nginx.sh /usr/local/bin/vhost-nginx

vhost-nginx --help
```

### [Backup Magento2 Code + Database](https://github.com/MagePsycho/magento2-db-code-backup-bash-script)
```
curl -0 https://raw.githubusercontent.com/MagePsycho/magento2-db-code-backup-bash-script/master/src/mage2-db-code-backup.sh -o m2-backup.sh
chmod +x m2-backup.sh
sudo mv m2-backup.sh /usr/local/bin/m2-backup

m2-backup --help
```

### [Simplistic Magento 2 Installer](https://github.com/MagePsycho/magento2-installer-bash-script)
```
curl -0 https://raw.githubusercontent.com/MagePsycho/magento2-installer-bash-script/master/src/magento2-installer.sh -o m2-installer.sh
chmod +x m2-installer.sh
sudo mv m2-installer.sh /usr/local/bin/m2-installer

m2-installer --help
```

### [netz98 magerun CLI tools for Magento 2](https://github.com/netz98/n98-magerun2)
```
curl -O https://files.magerun.net/n98-magerun2.phar
chmod +x ./n98-magerun2.phar
mv n98-magerun2.phar ~/bin/mr2

mr2 --help
```

### [Pestle](https://github.com/astorm/pestle)
```
curl -LO http://pestle.pulsestorm.net/pestle.phar
chmod +x pestle.phar
mv pestle.phar ~/bin/pestle

pestle --help
```

## Magento 2 Debugging Tools
- (Developer Toolbar for Magento2 - by vpietri)[https://github.com/vpietri/magento2-developer-quickdevbar]
- (Mgt Developer Toolbar for Magento 2)[https://github.com/mgtcommerce/Mgt_Developertoolbar]
- (Magento 2 Easy Template Path Hints)[https://github.com/MagePsycho/magento2-easy-template-path-hints]