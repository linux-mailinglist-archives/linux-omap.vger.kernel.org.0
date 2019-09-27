Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC13BFF0F
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 08:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfI0GWS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 02:22:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51996 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfI0GWR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 02:22:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R6M3JX047749;
        Fri, 27 Sep 2019 01:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569565323;
        bh=JqiE37S8xxOHs3Eb1p83iWARD+ZjkZBMD8QHKwW9zZg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=f/f90h4JC0NDBaZuDbsbOj+1bA/0VvhCXP5/J01Dy9T8FXO7chLc5xmaOaqzEOV6g
         PITB2NIDNUWHE7fvWiUHeiAX3L5na5pdz9n/OPDk9nKAbimZeNMXUa8j3gF7YCfPZG
         dSyGN4B5gqd0CNQ61+CsKkIiD7Sui0izh8rCiAeY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R6M3j8023623
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 01:22:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 01:21:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 01:21:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R6M0j7005041;
        Fri, 27 Sep 2019 01:22:00 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
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
Message-ID: <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
Date:   Fri, 27 Sep 2019 09:21:59 +0300
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

On 26/09/2019 17:12, Adam Ford wrote:

>> And what is the hdmi5_configure there? I don't see anything in the
>> driver that would print hdmi5_configure. And, of course, there's no
>> hdmi5 on that platform. Hmm, ok... it's from component.c, using "%ps".
>> Somehow that goes wrong. Which is a bit alarming, but perhaps a totally
>> different issue.
> 
> I'll try to take a look later.  For Logic PD distributions, we create
> a custom defconfig with all those drivers removed, so I'm not worked
> up about it, but it would be nice to not call drivers that don't
> exist.

So you have CONFIG_OMAP5_DSS_HDMI=n? Then it's even more disturbing, as 
there's no way the string "hdmi5_configure" can be in the kernel image...

Maybe it's nothing, but... It's just so odd.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
