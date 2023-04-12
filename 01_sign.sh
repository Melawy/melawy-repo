#!/bin/bash

for i in x86_64/*.zst;
do
    echo "Удаление подписи $i.sig"
    rm -f $i.sig
    echo "Добавление подписи $i.sig"
    gpg --detach-sign --local-user 95F48000540A4DB146583A47C49B5E77FD80302D --output "$i.sig" "$i"
done

for i in x86_64/*.xz;
do
    echo "Удаление подписи $i.sig"
    rm -f $i.sig
    echo "Добавление подписи $i.sig"
    gpg --detach-sign --local-user 95F48000540A4DB146583A47C49B5E77FD80302D --output "$i.sig" "$i"
done
