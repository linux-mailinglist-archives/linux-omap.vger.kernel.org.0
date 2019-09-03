Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACE2A66AB
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 12:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICKiY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 06:38:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45042 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfICKiY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 06:38:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83AcLX1047946;
        Tue, 3 Sep 2019 05:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567507101;
        bh=RrOTa7anRNKtnovLnOPwAHL6GlZLJNAQNb/bG2fDikU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g7F2KU7PylRAKAJwT/bk+23b2K6qA5OA0rSwv/9NYN9ZEgToOIvzYlH0FqiDwS75Z
         ZvZWOQj4QI2vRJyZKaxIJzUaQcod/2OskbfaRZf58ctu8pm6SYjkmrrDObx0GeBA+J
         lG9JMVHBvbXY+PVxo50fbJKkyA0pzySz4aCC5wsQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83AcLd5026242
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 05:38:21 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 05:38:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 05:38:21 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83AcJvo046355;
        Tue, 3 Sep 2019 05:38:19 -0500
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
Date:   Tue, 3 Sep 2019 13:38:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/09/2019 13:01, Grygorii Strashko wrote:
> 
> 
> On 03/09/2019 09:04, Keerthy wrote:
>>
>>
>> On 31/08/19 7:21 AM, keerthy wrote:
>>> Hi Tony,
>>>
>>> https://pastebin.ubuntu.com/p/pt7b3JPgRn/
>>>
>>> NFS boot seems to be broken. Works well with 5.3-rc6.
>>>
>>> I couldn't do the bisect yet.
>>
>> Vignesh,
>>
>> Thanks for the clue.
>>
>> Tony,
>>
>> [    2.457707] gmac-clkctrl:0000:0: failed to enable
>> [    2.462570] cpsw: probe of 48484000.ethernet failed with error -16
>>
>> seems like gmac clkctrl failing to enable.
>>
>> commit 1faa415c9c6e41a5350d3067307e7985b546ac3a
>> Author: Tony Lindgren <tony@atomide.com>
>> Date:   Mon Aug 26 08:41:14 2019 -0700
>>
>> ARM: dts: Add fck for cpsw mdio for omap variants
>>
>> The above commit seems to be causing that. I tried experimenting
>> with removing the patch changes for dra7-dt alone.
>>
>> The above errors seem to go away but then i see a crash:
>>
>> https://pastebin.ubuntu.com/p/zBqGX959J2/
>>
>> Could you please take a look at the above patch?
> 
> The log still contains "gmac-clkctrl:0000:0: failed to disable"
> 
> So, there is smth wrong with gmak clocks definitions
> 

The clock definition itself looks fine, however the question is why does 
someone try to disable it while it is apparently still used (by NFS that 
is)? If it fails to disable, clock core is trying to disable it, but the 
IDLEST bit does not switch for some reason.

Is the clock being disabled by clock core from clk_disable_unused?

The failure with the DTS patch might be because the sequencing 
differences between hwmod based implementation to ti-sysc based one, I 
guess GMAC has been switched over from hwmod to ti-sysc.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
