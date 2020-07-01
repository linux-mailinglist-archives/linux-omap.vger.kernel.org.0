Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0ED21039F
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 08:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgGAGHe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jul 2020 02:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGAGHe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jul 2020 02:07:34 -0400
Received: from mail.lysator.liu.se (mail.lysator.liu.se [IPv6:2001:6b0:17:f0a0::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CA9C061755
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 23:07:33 -0700 (PDT)
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
        by mail.lysator.liu.se (Postfix) with ESMTP id AEFFE4004C;
        Wed,  1 Jul 2020 08:07:27 +0200 (CEST)
Received: from [192.168.82.172] (c-7a4fe655.06-290-73746f71.bbcust.telenor.se [85.230.79.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.lysator.liu.se (Postfix) with ESMTPSA id 74DEE40049;
        Wed,  1 Jul 2020 08:07:26 +0200 (CEST)
Subject: Re: WL1271 on CM-T3730
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <AD238A83-22FC-458D-9180-F715AD6A5237@goldelico.com>
 <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
 <5166bacd-428d-168c-edf4-a322274deac6@lysator.liu.se>
 <20200622152825.GK37466@atomide.com>
From:   Oskar Enoksson <enok@lysator.liu.se>
Message-ID: <c9c7fdbb-3f2b-ecf3-342a-179a9980beaf@lysator.liu.se>
Date:   Wed, 1 Jul 2020 08:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622152825.GK37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks for the hints. I did some experiments with increasing the 
startup-delay-us of wl12xx_vmmc2 but couldn't notice any effect.

I also tried other changes in the device tree, kernel command line 
arguments and kernel configuration, but I can't see any pattern in the 
result. Whatever I try the initialization very often still fails with 
errors as before. Occasionally I even get crashes such as:

> [    7.188934] mmc1: tried to HW reset card, got error -110
> sysctl: cannot stat /proc/sys/net/ipv4/tcp_syncookies: No such file or directory
> [    7.410125] ------------[ cut here ]------------
> [    7.414825] WARNING: CPU: 0 PID: 10 at drivers/net/wireless/ti/wlcore/sdio.c:131 wl12xx_sdio_raw_write+0xa3/0x104 [wlcore_sdio]
> [    7.426422] Modules linked in: wl12xx wlcore mac80211 libarc4 omapdrm sha256_generic libsha256 drm_kms_helper sha256_arm cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea cfg80211 joydev mousedev evdc
> [    7.506774] CPU: 0 PID: 10 Comm: kworker/0:1 Not tainted 5.4.28-pte-g6f3bf13d53 #1
> [    7.514465] Hardware name: Generic OMAP36xx (Flattened Device Tree)
> [    7.520812] Workqueue: events request_firmware_work_func
> [    7.526214] [<c010c0c5>] (unwind_backtrace) from [<c0109863>] (show_stack+0xb/0xc)
> [    7.533905] [<c0109863>] (show_stack) from [<c0122541>] (__warn+0xb5/0xb8)
> [    7.540893] [<c0122541>] (__warn) from [<c01227a9>] (warn_slowpath_fmt+0x41/0x7c)
> [    7.548461] [<c01227a9>] (warn_slowpath_fmt) from [<bfa0a217>] (wl12xx_sdio_raw_write+0xa3/0x104 [wlcore_sdio])
> [    7.558807] [<bfa0a217>] (wl12xx_sdio_raw_write [wlcore_sdio]) from [<bfaf9e9b>] (wlcore_set_partition+0x83/0x340 [wlcore])
> [    7.570220] [<bfaf9e9b>] (wlcore_set_partition [wlcore]) from [<bfaf402d>] (wl12xx_set_power_on+0x4d/0xd4 [wlcore])
> [    7.580841] [<bfaf402d>] (wl12xx_set_power_on [wlcore]) from [<bfaf5ea9>] (wlcore_nvs_cb+0xdd/0x804 [wlcore])
> [    7.590942] [<bfaf5ea9>] (wlcore_nvs_cb [wlcore]) from [<c04328ad>] (request_firmware_work_func+0x35/0x64)
> [    7.600708] [<c04328ad>] (request_firmware_work_func) from [<c0132efb>] (process_one_work+0x117/0x30c)
> [    7.610168] [<c0132efb>] (process_one_work) from [<c01331d7>] (worker_thread+0xe7/0x388)
> [    7.618316] [<c01331d7>] (worker_thread) from [<c0136f89>] (kthread+0xed/0xf4)
> [    7.625640] [<c0136f89>] (kthread) from [<c01010f9>] (ret_from_fork+0x11/0x38)
> [    7.632965] Exception stack(0xcd199fb0 to 0xcd199ff8)
> [    7.638061] 9fa0:                                     00000000 00000000 00000000 00000000
> [    7.646331] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    7.654602] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    7.661285] ---[ end trace 09a18993a63ecdda ]---
> [    7.665954] wl1271_sdio mmc1:0001:2: sdio write failed (-110)



On 6/22/20 5:28 PM, Tony Lindgren wrote:
> * Oskar Enoksson <enok@lysator.liu.se> [200621 22:01]:
>> Correction: occasionally wl1271_sdio initialization still fails with error
>> messages such as
>>
>> [   46.961364] wl1271_sdio: probe of mmc1:0001:1 failed with error -16
>> [   46.967834] wl1271_sdio: probe of mmc1:0001:2 failed with error -16
>>
>> other times
>>
>> [   27.302215][  T903] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
>> to get_sync(-22)
>>
>> or
>> root@pte2000:~# ifup wlan0
>> [   53.799468][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
>> to get_sync(-110)
>> [   53.840118][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
>> to get_sync(-22)
>> [   53.879882][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
>> to get_sync(-22)
>> [   53.888610][ T2420] wlcore: ERROR firmware boot failed despite 3 retries
>> RTNETLINK answers: Invalid argument
>> ifup: failed to bring up wlan0
> 
> Maybe try changing the wl12xx_vmmc2 startup-delay-us to something
> higher like 70000 we usually have?
> 
> Regards,
> 
> Tony
> 
