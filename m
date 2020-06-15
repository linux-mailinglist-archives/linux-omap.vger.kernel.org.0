Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564B41FA296
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 23:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731562AbgFOVOE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 17:14:04 -0400
Received: from mail.lysator.liu.se ([130.236.254.3]:52061 "EHLO
        mail.lysator.liu.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgFOVOE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 17:14:04 -0400
X-Greylist: delayed 587 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jun 2020 17:14:01 EDT
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
        by mail.lysator.liu.se (Postfix) with ESMTP id 09EF240004
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 23:04:13 +0200 (CEST)
Received: from [192.168.82.193] (c-7a4fe655.06-290-73746f71.bbcust.telenor.se [85.230.79.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.lysator.liu.se (Postfix) with ESMTPSA id DE55B40002
        for <linux-omap@vger.kernel.org>; Mon, 15 Jun 2020 23:04:12 +0200 (CEST)
To:     linux-omap@vger.kernel.org
From:   Oskar Enoksson <enok@lysator.liu.se>
Subject: WL1271 on CM-T3730
Message-ID: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
Date:   Mon, 15 Jun 2020 23:04:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------1A73C3F3AF6940242D2B5DA5"
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is a multi-part message in MIME format.
--------------1A73C3F3AF6940242D2B5DA5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all, sorry to bother, I'm urgently in need of some help/hints.

I'm trying to make wifi work on an Compulab CM-T3730, an old OMAP3 board 
with WL1271 Wifi chip connected to an mmc via SDIO.

Everything works with the kernel supported by Texas Instruments 3.0.87 
but I need a newer kernel. There is a device tree file 
omap3-cm-t3730.dts in the Linux mainline sourcees, but it doesn't work 
for me, the Wifi chip is not detected on the SDIO bus. I'm using 
mainline linux 5.6.18, but I also tried 4.14, 4.9 and 3.16 with similar 
results.

What could be the problem?

When I boot I can see (by enabling various verbose printouts) that the 
appropriate mmc is bound to the right driver omap_hsmmc, but no device 
is detected on the SDIO bus. Some power pin messages look worrying but 
maybe it's ok?:

[    4.584228] platform 480b4000.mmc: Retrying from deferred list
[    4.584808] bus: 'platform': driver_probe_device: matched device 
480b4000.mmc with driver omap_hsmmc
[    4.584838] bus: 'platform': really_probe: probing driver omap_hsmmc 
with device 480b4000.mmc
[    4.585083] omap_hsmmc 480b4000.mmc: no init pinctrl state
[    4.585144] omap_hsmmc 480b4000.mmc: no sleep pinctrl state
[    4.585174] omap_hsmmc 480b4000.mmc: no idle pinctrl state
[    4.585571] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
[    4.585571] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup
[    4.585662] of_get_named_gpiod_flags: can't parse 'wp-gpios' property 
of node '/ocp@68000000/mmc@480b4000[0]'
[    4.585723] of_get_named_gpiod_flags: can't parse 'wp-gpio' property 
of node '/ocp@68000000/mmc@480b4000[0]'
[    4.585754] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup
[    4.585784] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
[    4.586669] omap_hsmmc 480b4000.mmc: Looking up vmmc-supply from 
device tree
[    4.587097] devices_kset: Moving 480b4000.mmc to end of list
[    4.587127] omap_hsmmc 480b4000.mmc: Linked as a consumer to regulator.9
[    4.587158] omap_hsmmc 480b4000.mmc: Looking up vqmmc-supply from 
device tree
[    4.587615] devices_kset: Moving 480b4000.mmc to end of list
[    4.587646] omap_hsmmc 480b4000.mmc: Linked as a consumer to regulator.6
[    4.587677] omap_hsmmc 480b4000.mmc: Looking up pbias-supply from 
device tree
[    4.587738] omap_hsmmc 480b4000.mmc: Looking up pbias-supply property 
in node /ocp@68000000/mmc@480b4000 failed
[    4.587860] device: 'mmc1': device_add
[    4.613861] driver: 'omap_hsmmc': driver_bound: bound to device 
'480b4000.mmc'
[    4.614105] bus: 'platform': really_probe: bound device 480b4000.mmc 
to driver omap_hsmmc



When I manually modprobe wlcore, then wlcore_sdio, then wl12xx, dmesg shows:

[   49.467132] device class 'rfkill': registering
[   49.467376] device: 'rfkill': device_add
[   50.070983] device class 'ieee80211': registering
[   50.072143] Registering platform device 'regulatory.0'. Parent at 
platform
[   50.072174] device: 'regulatory.0': device_add
[   50.072235] bus: 'platform': add device regulatory.0
[   50.072906] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[   50.173675] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   54.470794] bus: 'sdio': add driver wl1271_sdio
[   59.017272] bus: 'platform': add driver wl12xx_driver



Still, no wlan0 interface visible with "ifconfig -a"

Is something wrong/missing in the devicetree? cap-sdio-irq? mmc-pwrseq? 
Or is the pin configuration in the device tree wrong? Did anyone ever 
try the device tree on a board with wl1271 wifi (it is optional)? I 
don't even have a schematic so I can't double check the pins.

Hints much appreciated!! Device tree file is attached (from mainline 
kernel 5.6.18)

--------------1A73C3F3AF6940242D2B5DA5
Content-Type: audio/vnd.dts;
 name="omap3-cm-t3730.dts"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="omap3-cm-t3730.dts"

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLyoKICogU3VwcG9ydCBmb3Ig
Q29tcHVMYWIgQ00tVDM3MzAKICovCi9kdHMtdjEvOwoKI2luY2x1ZGUgIm9tYXAzNnh4LmR0
c2kiCiNpbmNsdWRlICJvbWFwMy1jbS10M3gzMC5kdHNpIgoKLyB7Cgltb2RlbCA9ICJDb21w
dUxhYiBDTS1UMzczMCI7Cgljb21wYXRpYmxlID0gImNvbXB1bGFiLG9tYXAzLWNtLXQzNzMw
IiwgInRpLG9tYXAzNjMwIiwgInRpLG9tYXAzNnh4IiwgInRpLG9tYXAzIjsKCgl3bDEyeHhf
dm1tYzI6IHdsMTJ4eF92bW1jMiB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQi
OwoJCXJlZ3VsYXRvci1uYW1lID0gInZ3MTI3MSI7CgkJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKCQlwaW5jdHJsLTAgPSA8JndsMTJ4eF9ncGlvPjsKCQlyZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9IDwxODAwMDAwPjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAw
MDAwPjsKCQlncGlvID0gPCZncGlvMyA5IEdQSU9fQUNUSVZFX0hJR0g+OyAgIC8qIGdwaW83
MyAqLwoJCXN0YXJ0dXAtZGVsYXktdXMgPSA8NzAwMDA+OwogICAgICAgICAgICAgICAgcmVn
dWxhdG9yLWFsd2F5cy1vbjsKCQllbmFibGUtYWN0aXZlLWhpZ2g7Cgl9OwoKCXdsMTJ4eF92
YXV4Mjogd2wxMnh4X3ZhdXgyIHsKCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7
CgkJcmVndWxhdG9yLW5hbWUgPSAidndsMTI3MV92YXV4MiI7CgkJcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSA8MTgwMDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgw
MDAwMD47CgkJdmluLXN1cHBseSA9IDwmdmF1eDI+OwogICAgICAgICAgICAgICAgcmVndWxh
dG9yLWFsd2F5cy1vbjsKCX07Cn07Cgomb21hcDNfcG14X3drdXAgewoJZHNzX2RwaV9waW5z
X2NtX3QzNzMwOiBwaW5tdXhfZHNzX2RwaV9waW5zX2NtX3QzNzMwIHsKCQlwaW5jdHJsLXNp
bmdsZSxwaW5zID0gPAoJCQlPTUFQM19XS1VQX0lPUEFEKDB4MmEwOCwgUElOX09VVFBVVCB8
IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDAuZHNzX2RhdGExOCAqLwoJCQlPTUFQM19XS1VQ
X0lPUEFEKDB4MmEwYywgUElOX09VVFBVVCB8IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDEu
ZHNzX2RhdGExOSAqLwoJCQlPTUFQM19XS1VQX0lPUEFEKDB4MmExMCwgUElOX09VVFBVVCB8
IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDMuZHNzX2RhdGEyMCAqLwoJCQlPTUFQM19XS1VQ
X0lPUEFEKDB4MmExMiwgUElOX09VVFBVVCB8IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDQu
ZHNzX2RhdGEyMSAqLwoJCQlPTUFQM19XS1VQX0lPUEFEKDB4MmExNCwgUElOX09VVFBVVCB8
IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDUuZHNzX2RhdGEyMiAqLwoJCQlPTUFQM19XS1VQ
X0lPUEFEKDB4MmExNiwgUElOX09VVFBVVCB8IE1VWF9NT0RFMykgICAvKiBzeXNfYm9vdDYu
ZHNzX2RhdGEyMyAqLwoJCT47Cgl9Owp9OwoKJm9tYXAzX3BteF9jb3JlIHsKCgltbWMyX3Bp
bnM6IHBpbm11eF9tbWMyX3BpbnMgewoJCXBpbmN0cmwtc2luZ2xlLHBpbnMgPSA8CgkJCU9N
QVAzX0NPUkUxX0lPUEFEKDB4MjE1OCwgUElOX0lOUFVUX1BVTExVUCB8IE1VWF9NT0RFMCkJ
Lyogc2RtbWMyX2Nsay5zZG1tYzJfY2xrICovCgkJCU9NQVAzX0NPUkUxX0lPUEFEKDB4MjE1
YSwgUElOX0lOUFVUX1BVTExVUCB8IE1VWF9NT0RFMCkJLyogc2RtbWMyX2NtZC5zZG1tYzJf
Y21kICovCgkJCU9NQVAzX0NPUkUxX0lPUEFEKDB4MjE1YywgUElOX0lOUFVUX1BVTExVUCB8
IE1VWF9NT0RFMCkJLyogc2RtbWMyX2RhdDAuc2RtbWMyX2RhdDAgKi8KCQkJT01BUDNfQ09S
RTFfSU9QQUQoMHgyMTVlLCBQSU5fSU5QVVRfUFVMTFVQIHwgTVVYX01PREUwKQkvKiBzZG1t
YzJfZGF0MS5zZG1tYzJfZGF0MSAqLwoJCQlPTUFQM19DT1JFMV9JT1BBRCgweDIxNjAsIFBJ
Tl9JTlBVVF9QVUxMVVAgfCBNVVhfTU9ERTApCS8qIHNkbW1jMl9kYXQyLnNkbW1jMl9kYXQy
ICovCgkJCU9NQVAzX0NPUkUxX0lPUEFEKDB4MjE2MiwgUElOX0lOUFVUX1BVTExVUCB8IE1V
WF9NT0RFMCkJLyogc2RtbWMyX2RhdDMuc2RtbWMyX2RhdDMgKi8KCQk+OwoJfTsKCgl3bDEy
eHhfZ3BpbzogcGlubXV4X3dsMTJ4eF9ncGlvIHsKCQlwaW5jdHJsLXNpbmdsZSxwaW5zID0g
PAoJCQlPTUFQM19DT1JFMV9JT1BBRCgweDIwZTIsIFBJTl9PVVRQVVQgfCBNVVhfTU9ERTQp
CS8qIGRzc19kYXRhMy5ncGlvXzczICovCgkJCU9NQVAzX0NPUkUxX0lPUEFEKDB4MjE2NCwg
UElOX0lOUFVUIHwgTVVYX01PREU0KQkvKiBzZG1tYzJfZGF0NC5ncGlvXzEzNiAqLwoJCT47
Cgl9Owp9OwoKJm1tYzIgewoJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCXBpbmN0cmwt
MCA9IDwmbW1jMl9waW5zPjsKCXZtbWMtc3VwcGx5ID0gPCZ3bDEyeHhfdm1tYzI+OwoJdnFt
bWMtc3VwcGx5ID0gPCZ3bDEyeHhfdmF1eDI+OwoJbm9uLXJlbW92YWJsZTsKCWJ1cy13aWR0
aCA9IDw0PjsKCWNhcC1wb3dlci1vZmYtY2FyZDsKCWNhcC1zZGlvLWlycTsKCS8vbm8tc2Q7
Cglwb3N0LXBvd2VyLW9uLWRlbGF5LW1zID0gPDEwPjsKCS8va2VlcC1wb3dlci1pbi1zdXNw
ZW5kOwoJc3RhdHVzID0gIm9rIjsKCgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNl
bGxzID0gPDA+OwoJd2xjb3JlOiB3bGNvcmVAMiB7CgkJY29tcGF0aWJsZSA9ICJ0aSx3bDEy
NzEiOwoJCXJlZyA9IDwyPjsKCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvNT47CgkJaW50
ZXJydXB0cyA9IDw4IElSUV9UWVBFX0VER0VfUklTSU5HPjsgLyogZ3BpbyAxMzYgKi8KCQly
ZWYtY2xvY2stZnJlcXVlbmN5ID0gPDM4NDAwMDAwPjsKCQlzdGF0dXMgPSAib2siOwoJfTsK
fTsKCiZkc3MgewoJc3RhdHVzID0gIm9rIjsKCglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwoJcGluY3RybC0wID0gPAoJCSZkc3NfZHBpX3BpbnNfY29tbW9uCgkJJmRzc19kcGlfcGlu
c19jbV90MzczMAoJPjsKfTsKCg==
--------------1A73C3F3AF6940242D2B5DA5--
