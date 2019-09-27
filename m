Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2E8C06A4
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfI0Nrz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 09:47:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44318 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfI0Nrz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 09:47:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RDlo3s024629;
        Fri, 27 Sep 2019 08:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569592070;
        bh=OykXQx53deEXmss9utfaaw/zCo/WLHB0gvMxBBwRQUI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Iv7sO60PsxEaPOH9/xlGtO/Lkwm3f4eRoBY8Tz7Zp/QlLO9lspYfS8lZ6nSw4YxWX
         XZAWQGVTO1FkJEiqqAFoVC8c2FRbRZB1K3m2zRUNmpA2GFhRB1GW4VUx1qLuIRLzi7
         w+jaAOM+DcryNMIOMyIwm48SQM5Sde5DskEo41CI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RDloI0078270
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 08:47:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 08:47:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 08:47:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDllhi057353;
        Fri, 27 Sep 2019 08:47:47 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>
CC:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
Date:   Fri, 27 Sep 2019 16:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/09/2019 15:33, Adam Ford wrote:

>> It looks like a bug in omap clock handling.
>>
>> DSS uses dss1_alwon_fck_3430es2 as fclk. dss1_alwon_fck_3430es2 comes
>> from dpll4_ck, and there's a divider after the PLL, dpll4_m4_ck.
>>
>> When the DSS driver sets dss1_alwon_fck_3430es2 rate to 27000000 or
>> 27870967, which can be created with m4 dividers 32 and 31, it looks like
>> the divider goes to bypass, or to a very small value. DSS gets a very
>> high clock rate and breaks down.
> 
> Is there anything I can do to help troubleshoot this?  I could insert
> a hack that checks if we're omap3 and if so make the divider equal to
> 4, but that seems like just a hack.
> I can run more tests or insert code somewhere if you want.

I think it's up to someone who's knowledgeable in omap clock framework. 
I'm kind of hoping that Tero or Tony would be willing to debug =). I can 
try to find time to debug the omap clk framework, but I'll be going on 
blindly there.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
