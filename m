Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F1AC08E3
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfI0PsE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 11:48:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59552 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbfI0PsE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 11:48:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RFlwsx028604;
        Fri, 27 Sep 2019 10:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569599278;
        bh=U37r5TojFgcS5DwKcw0E6Hys+tinXCxumASCFgqCX8M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=n0Dr10Fc+4D7YJlreDJ02Ho/MKselqyZ6JuPychdRGigTx8dWWa2gK6i2fqY5dVQc
         IUPJMUBCpnPe8DrSvyAnfIiHNm4vGE9zwJvOxkba71HzXwN4KHTMU/1RfIyWs0RCMF
         vVrX5avWBICkiZbB3QrrbQqe4DGgEkXTJSC9ZWrM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RFlwN2037608
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 10:47:58 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 10:47:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 10:47:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RFltEh071020;
        Fri, 27 Sep 2019 10:47:55 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
Date:   Fri, 27 Sep 2019 18:47:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/09/2019 18:37, Tero Kristo wrote:

> If you can provide details about what clock framework / driver does 
> wrong (sample clk_set_xyz call sequence, expected results via 
> clk_get_xyz, and what fails), I can take a look at it. Just reporting 
> arbitrary display driver issues I won't be able to debug at all (I don't 
> have access to any of the displays, nor do I want to waste time 
> debugging them without absolutely no knowledge whatsoever.)

I used your hack patches to allow changing rates via debugfs. And set 
dss1_alwon_fck_3430es2 to 27000000 or 27870967. The end result was that 
DSS gets some very high clock from dss1_alwon_fck_3430es2, as the frame 
rate jumps to many hundreds fps.

So, these numbers are not real, but to give the idea what I saw. Running 
first with 50 MHz, I can see, say, 40 fps. Then I set the clock to 30 
MHz, and fps dropped to, say, 30fps, as expected with lower clock. Then 
I set the clock to 27MHz (or the other one), expecting a bit lower fps, 
but instead I saw hundreds of fps.

I don't know if there's any other way to observe the wrong clock rate 
but have the dss enabled and running kmstest or similar. I can help you 
set that up next week, should be trivial. You don't need a display for that.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
