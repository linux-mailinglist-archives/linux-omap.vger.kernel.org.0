Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB42A68D9
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfICMps (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 08:45:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45466 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICMpr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 08:45:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83Cjjkv048725;
        Tue, 3 Sep 2019 07:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567514745;
        bh=q/hLw9M8x2rM/emxO17+noK7gJVUGkoSUlHcuKDE/0k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zTzxebbZa2p7e5cqLd+Ji06JoDxQW7scdszxOJXUJsN6WN6AeCYFDHE7OorAiCici
         vcldofOzGiQIekQB6qHjFxCNBNvj+ZQvxKqk3w40M1Ck9VTME+XNup5xC8vpGBewEl
         HWKxIZZ0+jBKfuAj2+ZhNYk40VJCPvBm5NnlEx/8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83CjjpX125330
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 07:45:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 07:45:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 07:45:44 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83CjhZ1100514;
        Tue, 3 Sep 2019 07:45:43 -0500
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
To:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
Date:   Tue, 3 Sep 2019 15:45:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/09/2019 13:38, Tero Kristo wrote:
> On 03/09/2019 13:01, Grygorii Strashko wrote:
>>
>>
>> On 03/09/2019 09:04, Keerthy wrote:
>>>
>>>
>>> On 31/08/19 7:21 AM, keerthy wrote:
>>>> Hi Tony,
>>>>
>>>> https://pastebin.ubuntu.com/p/pt7b3JPgRn/
>>>>
>>>> NFS boot seems to be broken. Works well with 5.3-rc6.
>>>>
>>>> I couldn't do the bisect yet.
>>>
>>> Vignesh,
>>>
>>> Thanks for the clue.
>>>
>>> Tony,
>>>
>>> [    2.457707] gmac-clkctrl:0000:0: failed to enable
>>> [    2.462570] cpsw: probe of 48484000.ethernet failed with error -16
>>>
>>> seems like gmac clkctrl failing to enable.
>>>
>>> commit 1faa415c9c6e41a5350d3067307e7985b546ac3a
>>> Author: Tony Lindgren <tony@atomide.com>
>>> Date:   Mon Aug 26 08:41:14 2019 -0700
>>>
>>> ARM: dts: Add fck for cpsw mdio for omap variants
>>>
>>> The above commit seems to be causing that. I tried experimenting
>>> with removing the patch changes for dra7-dt alone.
>>>
>>> The above errors seem to go away but then i see a crash:
>>>
>>> https://pastebin.ubuntu.com/p/zBqGX959J2/
>>>
>>> Could you please take a look at the above patch?
>>
>> The log still contains "gmac-clkctrl:0000:0: failed to disable"
>>
>> So, there is smth wrong with gmak clocks definitions
>>
> 
> The clock definition itself looks fine, however the question is why does someone try to disable it while it
  is apparently still used (by NFS that is)? If it fails to disable, clock core is trying to disable it, but the IDLEST bit does not switch for some reason.

I've tried to disable "ti,no-idle" in DT for dra7 cpsw and got below failure

[    0.634530] gmac-clkctrl:0000:0: failed to enable 08070002
[    0.634557] ti-sysc: probe of 48485200.target-module failed with error -16

so samthing is not right with GMAC clocks as it should probe without "ti,no-idle".


original place of the issue is:

cpsw_probe()
  -> pm_runtime_get_sync()
     -> sysc_runtime_resume()
        -> sysc_enable_main_clocks()

Note. the sysc_init_module() for "ti,no-idle" case looks a little bit strange as there is
no guarantee that target-module or clock were enabled before.

> 
> Is the clock being disabled by clock core from clk_disable_unused?

The CPSW GMAC device hierarchy is:
target-module -> ethernet -> mdio

Both ethernet and mdio are using  PM runtime and retrieving "fck" only for obtaining clock freq.
MDIO also uses autosuspend, but hence it's child of ethernet it can be considered always-on until ethernet module is active.
Ethernet module will be active once network intf is opened.

> 
> The failure with the DTS patch might be because the sequencing differences between hwmod based implementation to ti-sysc based one,
  I guess GMAC has been switched over from hwmod to ti-sysc.

Right and this patch just reveals existing issue.

-- 
Best regards,
grygorii
