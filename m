Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C194F1FCB31
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 12:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgFQKoT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 06:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgFQKoS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jun 2020 06:44:18 -0400
X-Greylist: delayed 135601 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 Jun 2020 03:44:17 PDT
Received: from mail.lysator.liu.se (mail.lysator.liu.se [IPv6:2001:6b0:17:f0a0::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852B0C061573
        for <linux-omap@vger.kernel.org>; Wed, 17 Jun 2020 03:44:17 -0700 (PDT)
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
        by mail.lysator.liu.se (Postfix) with ESMTP id C571640015;
        Wed, 17 Jun 2020 12:44:03 +0200 (CEST)
Received: from [192.168.82.193] (c-7a4fe655.06-290-73746f71.bbcust.telenor.se [85.230.79.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.lysator.liu.se (Postfix) with ESMTPSA id 6FDDA40008;
        Wed, 17 Jun 2020 12:44:03 +0200 (CEST)
Subject: Re: WL1271 on CM-T3730
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <20200616153921.GA37466@atomide.com>
From:   Oskar Enoksson <enok@lysator.liu.se>
Message-ID: <a002d6ed-526a-bf82-b698-6182f9bb126e@lysator.liu.se>
Date:   Wed, 17 Jun 2020 12:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616153921.GA37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/16/20 5:39 PM, Tony Lindgren wrote:
> * Oskar Enoksson <enok@lysator.liu.se> [200615 21:15]:
>> Hello all, sorry to bother, I'm urgently in need of some help/hints.
>>
>> I'm trying to make wifi work on an Compulab CM-T3730, an old OMAP3 board
>> with WL1271 Wifi chip connected to an mmc via SDIO.
>>
>> Everything works with the kernel supported by Texas Instruments 3.0.87 but I
>> need a newer kernel. There is a device tree file omap3-cm-t3730.dts in the
>> Linux mainline sourcees, but it doesn't work for me, the Wifi chip is not
>> detected on the SDIO bus. I'm using mainline linux 5.6.18, but I also tried
>> 4.14, 4.9 and 3.16 with similar results.
>>
>> What could be the problem?
> 
> Well it should work in general, maybe there's a regression somewhere.
> I can confirm that cm-t3730 works with v5.3 at least, have not bothered
> to update it for a while. Maybe you just need to update your firmware for
> /lib/firmware/ti-connectivity for it?
> 
> Regards,
> 
> Tony
> 

I tried replacing my own u-boot 2020.1 with Compulab's pre-compiled 
u-boot 2014.1, no noticeable difference, still no wlan0. I just had to 
set bootm_low, bootm_size and bootm_mapsize for the kernel bootm command 
not to hang. (I'm not sure I understand which address settings are safe 
and why, the ones below seems to work for me):

bootm_low=0x80004000
bootm_mapsize=0xf000000
bootm_size=0xf000000
...
loadaddr=0x8f000000
loadfdtaddr=0x8ff00000


I then tried re-compiling the kernel using omap2plus_defconfig without 
any modifications (CONFIG_NETFILTER=y was already set). I used Yocto 
with kernel 5.4.28. Still exactly the same results (no wlan0)

I then tried latest 5.3 kernel, to get as close as possible to Tony's 
build, this time using a crosstool-ng toolchain. Exactly the same 
results (no wlan0)


Firmware files are all there under /lib/firmware/ti-connectivity as far 
as I can tell. cfg80211 finds regulatory.db. Files wl127x-fw-5*.bin and 
wl128x-fw-5*.bin match the ones reported by "modinfo wl12xx", but there 
is nothing indicating they are loaded when I do "modprobe wl12xx".


Could someone please share a /proc/config.gz from some working board 
(with a recent kernel), just to eliminate the possibility of something 
wrong there after all?

And - are you using the omap3-cm-t3730.dtb or the omap3-sbc-t3730.dtb?


This is extract from my console output at boot:

Starting HOSTAP Daemon: Configuration file: /etc/hostapd.conf
[   15.884643] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[   16.051849] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
Could not read interface wlan0 flags: No such device
nl80211: Driver does not support authentication/association or connect 
commands
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
Could not read interface wlan0 flags: No such device
nl80211 driver initialization failed.
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED
wlan0: CTRL-EVENT-TERMINATING
hostapd_free_hapd_data: Interface wlan0 wasn't started



