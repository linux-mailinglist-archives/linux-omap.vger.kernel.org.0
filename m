Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB29CC08B4
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 17:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0Phr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 11:37:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55662 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfI0Phr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 11:37:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RFbeYx051670;
        Fri, 27 Sep 2019 10:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569598661;
        bh=Lqo9bBRFGck3umPvJYDrWptfCEGsJ4lcKhD97BGvgh4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tw1025iq5dUXluSa0qqR4U6Bp2835f/huQP/igQAdoBf7BB9A6bmoqA6aXnTtrg0O
         Ci6gi14TCsYVDllFYOrN+WaIZG6gl6l46r44G4j7qzkkMdu8wcV2nGcTS4qr+7kJNV
         EK90yh8PU6/aLkGC+Q3CDLZh1e5gb7RHko52UUCk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFbeNn015785;
        Fri, 27 Sep 2019 10:37:40 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 10:37:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 10:37:40 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFba8k044922;
        Fri, 27 Sep 2019 10:37:37 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Adam Ford <aford173@gmail.com>
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
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
Date:   Fri, 27 Sep 2019 18:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/09/2019 16:47, Tomi Valkeinen wrote:
> On 27/09/2019 15:33, Adam Ford wrote:
> 
>>> It looks like a bug in omap clock handling.
>>>
>>> DSS uses dss1_alwon_fck_3430es2 as fclk. dss1_alwon_fck_3430es2 comes
>>> from dpll4_ck, and there's a divider after the PLL, dpll4_m4_ck.
>>>
>>> When the DSS driver sets dss1_alwon_fck_3430es2 rate to 27000000 or
>>> 27870967, which can be created with m4 dividers 32 and 31, it looks like
>>> the divider goes to bypass, or to a very small value. DSS gets a very
>>> high clock rate and breaks down.
>>
>> Is there anything I can do to help troubleshoot this?  I could insert
>> a hack that checks if we're omap3 and if so make the divider equal to
>> 4, but that seems like just a hack.
>> I can run more tests or insert code somewhere if you want.
> 
> I think it's up to someone who's knowledgeable in omap clock framework. 
> I'm kind of hoping that Tero or Tony would be willing to debug =). I can 
> try to find time to debug the omap clk framework, but I'll be going on 
> blindly there.

If you can provide details about what clock framework / driver does 
wrong (sample clk_set_xyz call sequence, expected results via 
clk_get_xyz, and what fails), I can take a look at it. Just reporting 
arbitrary display driver issues I won't be able to debug at all (I don't 
have access to any of the displays, nor do I want to waste time 
debugging them without absolutely no knowledge whatsoever.)

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
