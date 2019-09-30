Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B69AC221F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 15:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbfI3Nft (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 09:35:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46532 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730637AbfI3Nft (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 09:35:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZf9u011071;
        Mon, 30 Sep 2019 08:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569850542;
        bh=xYtWnenhn+eca6d4SA4M0SG+A6mLvTWAfgkIW6YBQQM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WjH1Aciw+tVEjXn2qPbglCYcdOquSVCC3r3PJpSyC8eATl7UOK9e9hvRStxhh3FEv
         8vhsTpJ7xszdzLsKQnqRi0HKn/Ne2bVtmI+g5QE/ccQ0xGN5WT4MYU6xbJ+en6Rm0n
         B9HbBDHgTFv0Pc9JEoiwKjmvLg1SxuvGZpI1SY3k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZfEs098810;
        Mon, 30 Sep 2019 08:35:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:35:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:35:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UDZchM021644;
        Mon, 30 Sep 2019 08:35:39 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>, Tero Kristo <t-kristo@ti.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
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
 <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
 <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
 <CAHCN7xKKNpQwWZkg-JBncp9=VOcLJFEkcvST=rZqv-i9+5_Q2g@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d2bec234-be61-5ac1-2899-63d29660a80c@ti.com>
Date:   Mon, 30 Sep 2019 16:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKKNpQwWZkg-JBncp9=VOcLJFEkcvST=rZqv-i9+5_Q2g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/09/2019 16:17, Adam Ford wrote:

>>> It looks like it's unhappy that its trying to get one frequency and
>>> getting something different instead.
>>>
>>> [   10.014099] WARNING: CPU: 0 PID: 111 at
>>> drivers/gpu/drm/omapdrm/dss/dss.c:655 dss_set_fck_rate+0x70/0x90
>>> [omapdss]
>>> [   10.014129] clk rate mismatch: 27870968 != 27000000
>>
>> I believe this one is for Tomi to comment, his driver does some magic
>> compares for the requested vs. actual received clock rates. If I am not
>> mistaken, we are only modifying an integer divider here, and thus it is
>> physically impossible to get accurate 27MHz rate to display.
> 
> I didn't expect exactly 27MHz,but the back trace is what concerns me more.

Ah sorry... DSS driver knows the max divider value, so that it can 
iterate over all the rates to find a good one.

I'll send a patch later, but look for omap3630_dss_feats in dss.c, and 
change fck_div_max from 32 to 16.

> However, looking at
> # cat clk/dpll4_ck/clk_rate
> 864000000
> 
> It seems like 864000000 / 32 would be 27 MHz, but instead we're
> dividing it by 31 yielding 27870968.  I don't know the clocking
> architecture, so I don't know what your patch actually did or how the
> divide by 16 limit worked into this.  If lck cannot divide by 32, it
> would be nice to see if it could divide by 27 to get to 32MHz.  From
> there, the pck could then divide by 4 yielding 9MHz.

That's pretty odd. With Tero's patch (I didn't test it though) the max 
divider should be 16. So the minimum fclk rate should be 54MHz. But 
somehow the clock framework managed to produce 27870968...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
