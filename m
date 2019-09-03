Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82808A6630
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 12:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfICKBn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 06:01:43 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41058 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfICKBn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 06:01:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83A1e08039481;
        Tue, 3 Sep 2019 05:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567504900;
        bh=2KlABauITgXea8zZ9AAL1+m1f1POVR+5WeSeJv1Pu64=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EEGiKCKLhV3wcP3OA79CnrtkhyOQEyCxSY82xmPl336gL+41EvK4Gc+T9cSYaW2r/
         JsHXjVpFXCTtu9l6LuKJ7V/oFGAtGHfxqmgCeIlsg81q5VH7MOJlZw70/a/xFRhhro
         RGov4dTB66CEPWOIe8sCogJLjivjz2ObNH5qi3vo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83A1ebf059706
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Sep 2019 05:01:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 3 Sep
 2019 05:01:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 3 Sep 2019 05:01:39 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83A1bIA123521;
        Tue, 3 Sep 2019 05:01:38 -0500
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
To:     Keerthy <j-keerthy@ti.com>, Tony Lindgren <tony@atomide.com>,
        "Kristo, Tero" <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
Date:   Tue, 3 Sep 2019 13:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 03/09/2019 09:04, Keerthy wrote:
> 
> 
> On 31/08/19 7:21 AM, keerthy wrote:
>> Hi Tony,
>>
>> https://pastebin.ubuntu.com/p/pt7b3JPgRn/
>>
>> NFS boot seems to be broken. Works well with 5.3-rc6.
>>
>> I couldn't do the bisect yet.
> 
> Vignesh,
> 
> Thanks for the clue.
> 
> Tony,
> 
> [    2.457707] gmac-clkctrl:0000:0: failed to enable
> [    2.462570] cpsw: probe of 48484000.ethernet failed with error -16
> 
> seems like gmac clkctrl failing to enable.
> 
> commit 1faa415c9c6e41a5350d3067307e7985b546ac3a
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Mon Aug 26 08:41:14 2019 -0700
> 
> ARM: dts: Add fck for cpsw mdio for omap variants
> 
> The above commit seems to be causing that. I tried experimenting
> with removing the patch changes for dra7-dt alone.
> 
> The above errors seem to go away but then i see a crash:
> 
> https://pastebin.ubuntu.com/p/zBqGX959J2/
> 
> Could you please take a look at the above patch?

The log still contains "gmac-clkctrl:0000:0: failed to disable"

So, there is smth wrong with gmak clocks definitions

-- 
Best regards,
grygorii
