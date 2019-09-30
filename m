Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 768C3C2310
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbfI3OUp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:20:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36448 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbfI3OUp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 10:20:45 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UEKQRC008662;
        Mon, 30 Sep 2019 09:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569853226;
        bh=m3KlGn9eWz5y87zFQfHVSLTzz9MlKOrcN02MWUhNuq0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FontBJ4qo+JAGZ4L71jnf0PHINqfErJo7+9XrODc09frCbtGRAI1whYGCjAjAyYVB
         FwQWXKgOi2aw8emZA+BUV428GfGabSmPBPab2266Xj4XWInquPtTcX2+Swps+3pFIe
         UO+iWYP8ARtuZfnCVRDN0dlSgmEomFYU+RCznqgg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UEKQML098645
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 09:20:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 09:20:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 09:20:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UEKN9N093628;
        Mon, 30 Sep 2019 09:20:23 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Date:   Mon, 30 Sep 2019 17:20:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/09/2019 17:12, Adam Ford wrote:

>> I don't know the implications, so if the people from TI say stick with
>> 16, I'm fine with that, but at least there is some evidence that it
>> can be higher than 16, but lower than 32.
>>
> 
> Sorry for all the spam, but I moved both of them to 31 from 32, and it
> also seems to work successfully at 31.
> 
> [   26.923004] DSS: set fck to 36000000
> [   26.923034] DISPC: lck = 36000000 (1)
> [   26.923034] DISPC: pck = 9000000 (4)
> [   26.925048] DISPC: channel 0 xres 480 yres 272
> [   26.925048] DISPC: pck 9000000
> [   26.925048] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
> [   26.925079] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
> de_level 1 sync_pclk_edge -1
> [   26.925079] DISPC: hsync 17077Hz, vsync 59Hz
> [   27.384613] DISPC: dispc_runtime_put
> 
> Is it possible to use 31?

Let's see what Tero says, but yeah, something is odd here. I expected 
the max divider to be 16 with Tero's patch, but I don't see it having 
that effect. I can get the div to 31.

You can see this from the clock register 0x48004e40 (CM_CLKSEL_DSS). The 
lowest bits are the divider, 5 to 0. The TRM says max div is 32.

Tero said for him the dividers > 16 didn't "stick" to the register. I'm 
now wondering if he has an old beagleboard with OMAP34xx, which has max 
div 16.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
