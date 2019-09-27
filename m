Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27555C0078
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 09:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfI0HzY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 03:55:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43554 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfI0HzY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 03:55:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R7tHv2065733;
        Fri, 27 Sep 2019 02:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569570917;
        bh=tRDmuFTcml9/vkcUAcgHfVDQw97SRNjv+W5LESjr7XI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=huDKGiiTuQoxMrSKLQ4HaZZ0bHxCorwA5fVfKJKSbv4nwI4rPsuKgRB4f+rS0wWTV
         qZEAZeYx7sUl0PlkbiZwlmuBI8cWIH/o7zEJQFcDZbSibeUbJH0HzX4AUhMKoy1GRd
         LZeuRRobiubmw8KKEE2V9ZkUv1I6R8kLV7AthT/M=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R7tHgD077317
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 02:55:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 02:55:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 02:55:09 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R7tE5K122558;
        Fri, 27 Sep 2019 02:55:14 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
Date:   Fri, 27 Sep 2019 10:55:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

(dropping folks who're probably not interested...)

On 26/09/2019 17:12, Adam Ford wrote:
> On Thu, Sep 26, 2019 at 1:55 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> On 25/09/2019 23:51, Adam Ford wrote:
>>
>>>> Has anyone debugged why the hang is happening?
>>> I started to debug this, but I got distracted when I noticed the LCD
>>> did't work at all on modern kernels.  I have that fixed now, so I can
>>> go back to investigating this.

I dont' have the same board, but I was testing with omap3 beagle xm. I 
can reproduce rather similar issue, although I don't get a hang but 
instead sync lost and underflow flood (which makes the device unusable).

It looks like a bug in omap clock handling.

DSS uses dss1_alwon_fck_3430es2 as fclk. dss1_alwon_fck_3430es2 comes 
from dpll4_ck, and there's a divider after the PLL, dpll4_m4_ck.

When the DSS driver sets dss1_alwon_fck_3430es2 rate to 27000000 or 
27870967, which can be created with m4 dividers 32 and 31, it looks like 
the divider goes to bypass, or to a very small value. DSS gets a very 
high clock rate and breaks down.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
