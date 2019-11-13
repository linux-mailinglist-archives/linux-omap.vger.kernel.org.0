Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C6DFB3CA
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 16:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfKMPfo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 10:35:44 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46676 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKMPfo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 10:35:44 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADFZcKe038791;
        Wed, 13 Nov 2019 09:35:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573659338;
        bh=JuMsvJQMTK7F+q7ja/0IuKEyHlSQfapr0KGwKeAblJI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Cx54qGW7v6Zq6KOTBkbo2ZuLmpv3Lftugf+MBqkNrqg/WQhesOgg3VjL3LizaD1v9
         AlXp2ut+ZGLeqG91Ei3HQjV1UlYFcnIA19DP4o1zg7P5Sn0BzISzWjTnl6LMgJMQkR
         mFZG22sygN+d6zKGYPxdgL9Jun9mJcJXFn4r3iCo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADFZc7j117414
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 09:35:38 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 09:35:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 09:35:20 -0600
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADFZZTF107452;
        Wed, 13 Nov 2019 09:35:36 -0600
Subject: Re: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
To:     Tony Lindgren <tony@atomide.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20191109142017.10851-1-grygorii.strashko@ti.com>
 <20191111171255.GU5610@atomide.com>
 <d22abbd3-518d-3f2b-a1d7-50601e89e9e1@ti.com>
 <20191113152352.GM5610@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <f6eca2f7-beb1-fc4c-ab8b-3b20cf5e7dd1@ti.com>
Date:   Wed, 13 Nov 2019 17:35:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113152352.GM5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/11/2019 17:23, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [191113 10:02]:
>>
>>
>> On 11/11/2019 19:12, Tony Lindgren wrote:
>>> * Grygorii Strashko <grygorii.strashko@ti.com> [191109 14:21]:
>>>> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
>>>> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
>>>> Hence, fix it.
>>>>
>>>> Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
>>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>>
>>> Hmm is there a mux for the source though?
>>
>> Not sure what do you mean here :(
>>
>> fck clock for CPSW and MDIO is "gmac_main_clk" which is 125MHz and
>> that what need to be passed to drivers and enabled through the clock tree.
>> The TI specific PM is handled by gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0
>> which required sysc programming and child modules dosn't need to even know that.
> 
> OK
> 
>> So, this patch is simply correct clock tree for dra7:
>> dpll_gmac_ck -> .... -> gmac_main_clk -> gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0
> 
> So I guess there's no mux clock for DRA7_GMAC_GMAC_CLKCTRL 0.
> 
> What I meant is maybe check also that no top level mux is needed
> similar to what we have for these configured with assigned-clocks:
> 
> $ git grep -C3 assigned-clock arch/arm/boot/dts/dra7*

No. No muxes here.

[...]

-- 
Best regards,
grygorii
