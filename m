Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952B6C3039
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 11:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfJAJbw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 05:31:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44850 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJbw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 05:31:52 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x919Vftr060917;
        Tue, 1 Oct 2019 04:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569922301;
        bh=9mRbJDk5sUd9pMs4IG5bnvQl42wchkWmZqaMcfc5vi8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LqKnd50sbKz0s3OYz0yOvmOOKcHUKZYgrUtGPjzpk1t9TpJJBrQ/ZfSKB1B+xq7On
         /ZEES/Bf0zGJ1yElhkb5EYpEDlwfh0MpOeH1b/ePVgliCCNkJVCidQGHNX6TMXYMt9
         OTljvacmw0m2thDKtFe0KN5xgcI0dY3DQGVRbc9I=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x919VfeF015535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:31:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:31:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:31:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919Vc21040870;
        Tue, 1 Oct 2019 04:31:39 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
CC:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
 <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
 <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
 <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com>
 <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
 <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f01bf6ec-e531-371b-4f66-312b12379273@ti.com>
Date:   Tue, 1 Oct 2019 12:31:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/10/2019 11:12, Tero Kristo wrote:
> On 01/10/2019 08:07, Tomi Valkeinen wrote:
>> On 30/09/2019 20:48, Tero Kristo wrote:
>>
>>> Hmmh, after some testing, it seems there is bad stuff happening with 
>>> the divider clock implementation, I am re-working it as of now. 
>>> Basically what is wrong is that with a divider max value of say 16, 
>>> the driver attempts to craft the max value into a mask, but this ends 
>>> up being 0x1f. If the max value is 15, it ends up into 0xf which is 
>>> correct.
>>
>> Ok, that explains the max not working.
>>
>> It doesn't explain the other issue, where the TRM says the max div is 
>> 32, but it does not work. But taking the max div from the old SoCs, 
>> 16, is not correct either, as it seems that dividers up to 31 work ok.
>>
>>   Tomi
>>
> 
> Ok, attached a series that hopefully fixes it, any testing feedback 
> welcome before I post this properly.
> 
> This also supports omap36xx dpll4_m4_ck divider up-to 31, other omap3 
> family is limited to 16.

Works for me. This also needs the change to dss.c to change the max from 
32 to 31. I'll send a patch for that separately.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
