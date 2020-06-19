Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C116F20030F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jun 2020 09:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbgFSH4K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jun 2020 03:56:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:18240 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgFSH4H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Jun 2020 03:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592553364;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=18ONaUBQhht/14iks5F30BPfZhp33kyzoR1NlaCpUtw=;
        b=eHZnI8KuNPtFLq6b8Td3hd1Q2Z87VovqOYD8HShmzhMIDw5F5mVCG0EZETdKZCH0Qx
        h41Zssg3LPfVrFC/Ve8GYCjyvsOUR9kM+RPkX9ndAPIZ9fGkiYvgew7im+c+S+C87lH0
        oyyM2xARfbWlaPAYfCYXwKkz6PM5xKcZGUTwxMamR/9pfaMaD+YK3RA/umEVzUhPUZt/
        Bsj+bcJi8DTe11PW3K1W2N75l68m+6vbVwYGTXAYH3F0SJx3CB7+Jz/6te982vZE98XF
        /jammrQI0BIBductWUUhG+UXb1PxTYFFujpBedSv+BF5dOumWZyFQK+Wa2x0+R25hNM5
        88uw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWeXA4EzKk="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id j05c09w5J7tvSBL
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 19 Jun 2020 09:55:57 +0200 (CEST)
Subject: Re: WL1271 on CM-T3730
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
Date:   Fri, 19 Jun 2020 09:55:57 +0200
Cc:     linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD238A83-22FC-458D-9180-F715AD6A5237@goldelico.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
To:     Oskar Enoksson <enok@lysator.liu.se>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 15.06.2020 um 23:04 schrieb Oskar Enoksson <enok@lysator.liu.se>:
>=20
> Hello all, sorry to bother, I'm urgently in need of some help/hints.
>=20
> I'm trying to make wifi work on an Compulab CM-T3730, an old OMAP3 =
board with WL1271 Wifi chip connected to an mmc via SDIO.

I managed to boot the PandaBoard ES with v5.8-rc1 and there, the wl1271 =
works.

So it may be an omap3 or board specific issue.

BR,
Nikolaus

>=20
> Everything works with the kernel supported by Texas Instruments 3.0.87 =
but I need a newer kernel. There is a device tree file =
omap3-cm-t3730.dts in the Linux mainline sourcees, but it doesn't work =
for me, the Wifi chip is not detected on the SDIO bus. I'm using =
mainline linux 5.6.18, but I also tried 4.14, 4.9 and 3.16 with similar =
results.
>=20
> What could be the problem?
>=20
> When I boot I can see (by enabling various verbose printouts) that the =
appropriate mmc is bound to the right driver omap_hsmmc, but no device =
is detected on the SDIO bus. Some power pin messages look worrying but =
maybe it's ok?:
>=20
> [    4.584228] platform 480b4000.mmc: Retrying from deferred list
> [    4.584808] bus: 'platform': driver_probe_device: matched device =
480b4000.mmc with driver omap_hsmmc
> [    4.584838] bus: 'platform': really_probe: probing driver =
omap_hsmmc with device 480b4000.mmc
> [    4.585083] omap_hsmmc 480b4000.mmc: no init pinctrl state
> [    4.585144] omap_hsmmc 480b4000.mmc: no sleep pinctrl state
> [    4.585174] omap_hsmmc 480b4000.mmc: no idle pinctrl state
> [    4.585571] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
> [    4.585571] omap_hsmmc 480b4000.mmc: using device tree for GPIO =
lookup
> [    4.585662] of_get_named_gpiod_flags: can't parse 'wp-gpios' =
property of node '/ocp@68000000/mmc@480b4000[0]'
> [    4.585723] of_get_named_gpiod_flags: can't parse 'wp-gpio' =
property of node '/ocp@68000000/mmc@480b4000[0]'
> [    4.585754] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO =
lookup
> [    4.585784] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
> [    4.586669] omap_hsmmc 480b4000.mmc: Looking up vmmc-supply from =
device tree
> [    4.587097] devices_kset: Moving 480b4000.mmc to end of list
> [    4.587127] omap_hsmmc 480b4000.mmc: Linked as a consumer to =
regulator.9
> [    4.587158] omap_hsmmc 480b4000.mmc: Looking up vqmmc-supply from =
device tree
> [    4.587615] devices_kset: Moving 480b4000.mmc to end of list
> [    4.587646] omap_hsmmc 480b4000.mmc: Linked as a consumer to =
regulator.6
> [    4.587677] omap_hsmmc 480b4000.mmc: Looking up pbias-supply from =
device tree
> [    4.587738] omap_hsmmc 480b4000.mmc: Looking up pbias-supply =
property in node /ocp@68000000/mmc@480b4000 failed
> [    4.587860] device: 'mmc1': device_add
> [    4.613861] driver: 'omap_hsmmc': driver_bound: bound to device =
'480b4000.mmc'
> [    4.614105] bus: 'platform': really_probe: bound device =
480b4000.mmc to driver omap_hsmmc
>=20
>=20
>=20
> When I manually modprobe wlcore, then wlcore_sdio, then wl12xx, dmesg =
shows:
>=20
> [   49.467132] device class 'rfkill': registering
> [   49.467376] device: 'rfkill': device_add
> [   50.070983] device class 'ieee80211': registering
> [   50.072143] Registering platform device 'regulatory.0'. Parent at =
platform
> [   50.072174] device: 'regulatory.0': device_add
> [   50.072235] bus: 'platform': add device regulatory.0
> [   50.072906] cfg80211: Loading compiled-in X.509 certificates for =
regulatory database
> [   50.173675] cfg80211: Loaded X.509 cert 'sforshee: =
00b28ddf47aef9cea7'
> [   54.470794] bus: 'sdio': add driver wl1271_sdio
> [   59.017272] bus: 'platform': add driver wl12xx_driver
>=20
>=20
>=20
> Still, no wlan0 interface visible with "ifconfig -a"
>=20
> Is something wrong/missing in the devicetree? cap-sdio-irq? =
mmc-pwrseq? Or is the pin configuration in the device tree wrong? Did =
anyone ever try the device tree on a board with wl1271 wifi (it is =
optional)? I don't even have a schematic so I can't double check the =
pins.
>=20
> Hints much appreciated!! Device tree file is attached (from mainline =
kernel 5.6.18)
> <omap3-cm-t3730.dts>

