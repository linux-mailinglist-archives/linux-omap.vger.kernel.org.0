Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B80D202D4D
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgFUWAq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jun 2020 18:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgFUWAq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jun 2020 18:00:46 -0400
Received: from mail.lysator.liu.se (mail.lysator.liu.se [IPv6:2001:6b0:17:f0a0::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4930C061794
        for <linux-omap@vger.kernel.org>; Sun, 21 Jun 2020 15:00:45 -0700 (PDT)
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
        by mail.lysator.liu.se (Postfix) with ESMTP id E4B254003C;
        Mon, 22 Jun 2020 00:00:41 +0200 (CEST)
Received: from [192.168.82.193] (c-7a4fe655.06-290-73746f71.bbcust.telenor.se [85.230.79.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.lysator.liu.se (Postfix) with ESMTPSA id 9009740036;
        Mon, 22 Jun 2020 00:00:41 +0200 (CEST)
Subject: Re: WL1271 on CM-T3730
From:   Oskar Enoksson <enok@lysator.liu.se>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <AD238A83-22FC-458D-9180-F715AD6A5237@goldelico.com>
 <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
Message-ID: <5166bacd-428d-168c-edf4-a322274deac6@lysator.liu.se>
Date:   Mon, 22 Jun 2020 00:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correction: occasionally wl1271_sdio initialization still fails with 
error messages such as

[   46.961364] wl1271_sdio: probe of mmc1:0001:1 failed with error -16
[   46.967834] wl1271_sdio: probe of mmc1:0001:2 failed with error -16

other times

[   27.302215][  T903] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: 
failed to get_sync(-22)

or
root@pte2000:~# ifup wlan0
[   53.799468][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: 
failed to get_sync(-110)
[   53.840118][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: 
failed to get_sync(-22)
[   53.879882][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: 
failed to get_sync(-22)
[   53.888610][ T2420] wlcore: ERROR firmware boot failed despite 3 retries
RTNETLINK answers: Invalid argument
ifup: failed to bring up wlan0





On 6/21/20 11:23 AM, Oskar Enoksson wrote:
> Yes, it turned out that when I use the omap3-sbc-3730 devicetree then 
> wifi starts up ok.
> 
> I used omap3-cm-t3730 devicetree since I just use the CM T3730 on a 
> custom carrier board which does not have any of the stuff on the T35 board
> 
> (Actually I wrote a custom device tree inheriting from 
> omap3-cm-t3730.dts adding a few things needed for my carrier board).
> 
> After some experiments I deduce that the only thing missing in 
> omap3-cm-t3730.dts is the compatible line needs to start with 
> "compulab,omap3-sbc-t3730".
> 
> There is a function "omap3_sbc_t3730_legacy_init" in 
> arch/arm/mach-omap2/pdata-quirks.c which seems to be triggered by the 
> string "compulab,omap3-sbc-t3730". My guess is that this is needed for 
> wifi to be initialized.
> 
> Maybe this should better be triggered by "compulab,omap3-cm-t3730" 
> instead, since the wifi functionality has nothing to do with the t35 board?
> 
> On 6/19/20 9:55 AM, H. Nikolaus Schaller wrote:
>> Hi,
>>
>>> Am 15.06.2020 um 23:04 schrieb Oskar Enoksson <enok@lysator.liu.se>:
>>>
>>> Hello all, sorry to bother, I'm urgently in need of some help/hints.
>>>
>>> I'm trying to make wifi work on an Compulab CM-T3730, an old OMAP3 
>>> board with WL1271 Wifi chip connected to an mmc via SDIO.
>>
>> I managed to boot the PandaBoard ES with v5.8-rc1 and there, the 
>> wl1271 works.
>>
>> So it may be an omap3 or board specific issue.
>>
>> BR,
>> Nikolaus
>>
>>>
>>> Everything works with the kernel supported by Texas Instruments 
>>> 3.0.87 but I need a newer kernel. There is a device tree file 
>>> omap3-cm-t3730.dts in the Linux mainline sourcees, but it doesn't 
>>> work for me, the Wifi chip is not detected on the SDIO bus. I'm using 
>>> mainline linux 5.6.18, but I also tried 4.14, 4.9 and 3.16 with 
>>> similar results.
>>>
>>> What could be the problem?
>>>
>>> When I boot I can see (by enabling various verbose printouts) that 
>>> the appropriate mmc is bound to the right driver omap_hsmmc, but no 
>>> device is detected on the SDIO bus. Some power pin messages look 
>>> worrying but maybe it's ok?:
>>>
>>> [    4.584228] platform 480b4000.mmc: Retrying from deferred list
>>> [    4.584808] bus: 'platform': driver_probe_device: matched device 
>>> 480b4000.mmc with driver omap_hsmmc
>>> [    4.584838] bus: 'platform': really_probe: probing driver 
>>> omap_hsmmc with device 480b4000.mmc
>>> [    4.585083] omap_hsmmc 480b4000.mmc: no init pinctrl state
>>> [    4.585144] omap_hsmmc 480b4000.mmc: no sleep pinctrl state
>>> [    4.585174] omap_hsmmc 480b4000.mmc: no idle pinctrl state
>>> [    4.585571] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
>>> [    4.585571] omap_hsmmc 480b4000.mmc: using device tree for GPIO 
>>> lookup
>>> [    4.585662] of_get_named_gpiod_flags: can't parse 'wp-gpios' 
>>> property of node '/ocp@68000000/mmc@480b4000[0]'
>>> [    4.585723] of_get_named_gpiod_flags: can't parse 'wp-gpio' 
>>> property of node '/ocp@68000000/mmc@480b4000[0]'
>>> [    4.585754] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO 
>>> lookup
>>> [    4.585784] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
>>> [    4.586669] omap_hsmmc 480b4000.mmc: Looking up vmmc-supply from 
>>> device tree
>>> [    4.587097] devices_kset: Moving 480b4000.mmc to end of list
>>> [    4.587127] omap_hsmmc 480b4000.mmc: Linked as a consumer to 
>>> regulator.9
>>> [    4.587158] omap_hsmmc 480b4000.mmc: Looking up vqmmc-supply from 
>>> device tree
>>> [    4.587615] devices_kset: Moving 480b4000.mmc to end of list
>>> [    4.587646] omap_hsmmc 480b4000.mmc: Linked as a consumer to 
>>> regulator.6
>>> [    4.587677] omap_hsmmc 480b4000.mmc: Looking up pbias-supply from 
>>> device tree
>>> [    4.587738] omap_hsmmc 480b4000.mmc: Looking up pbias-supply 
>>> property in node /ocp@68000000/mmc@480b4000 failed
>>> [    4.587860] device: 'mmc1': device_add
>>> [    4.613861] driver: 'omap_hsmmc': driver_bound: bound to device 
>>> '480b4000.mmc'
>>> [    4.614105] bus: 'platform': really_probe: bound device 
>>> 480b4000.mmc to driver omap_hsmmc
>>>
>>>
>>>
>>> When I manually modprobe wlcore, then wlcore_sdio, then wl12xx, dmesg 
>>> shows:
>>>
>>> [   49.467132] device class 'rfkill': registering
>>> [   49.467376] device: 'rfkill': device_add
>>> [   50.070983] device class 'ieee80211': registering
>>> [   50.072143] Registering platform device 'regulatory.0'. Parent at 
>>> platform
>>> [   50.072174] device: 'regulatory.0': device_add
>>> [   50.072235] bus: 'platform': add device regulatory.0
>>> [   50.072906] cfg80211: Loading compiled-in X.509 certificates for 
>>> regulatory database
>>> [   50.173675] cfg80211: Loaded X.509 cert 'sforshee: 
>>> 00b28ddf47aef9cea7'
>>> [   54.470794] bus: 'sdio': add driver wl1271_sdio
>>> [   59.017272] bus: 'platform': add driver wl12xx_driver
>>>
>>>
>>>
>>> Still, no wlan0 interface visible with "ifconfig -a"
>>>
>>> Is something wrong/missing in the devicetree? cap-sdio-irq? 
>>> mmc-pwrseq? Or is the pin configuration in the device tree wrong? Did 
>>> anyone ever try the device tree on a board with wl1271 wifi (it is 
>>> optional)? I don't even have a schematic so I can't double check the 
>>> pins.
>>>
>>> Hints much appreciated!! Device tree file is attached (from mainline 
>>> kernel 5.6.18)
>>> <omap3-cm-t3730.dts>
>>
