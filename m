Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809B2C233A
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfI3O1R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:27:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37168 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3O1R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 10:27:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UER9D4010738;
        Mon, 30 Sep 2019 09:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569853629;
        bh=19UZeQW7iCMEPJGBu3CVRVx3eQA8RyzMg8BIyoBYUWY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=mqAFLfcVc72peDTQaVTX3krGNWa4dUGqG37HuzfVHniEjLFEVSOh8YoKdxbgpNypn
         9JTrY0Nwc+jZwsA4tAyvBkeNUyOL86+NmKHRKznpqBPY2bLbEqdihnIkEZpky/3syV
         aD/H/j8j0s3Fyh4XLDHzYd3fjjECs/1Fh8fCCAe0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UER9qU042622;
        Mon, 30 Sep 2019 09:27:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 09:27:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 09:27:09 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UER6Ak067205;
        Mon, 30 Sep 2019 09:27:06 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
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
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Message-ID: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
Date:   Mon, 30 Sep 2019 17:27:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/09/2019 17:20, Tomi Valkeinen wrote:

> Let's see what Tero says, but yeah, something is odd here. I expected 
> the max divider to be 16 with Tero's patch, but I don't see it having 
> that effect. I can get the div to 31.
> 
> You can see this from the clock register 0x48004e40 (CM_CLKSEL_DSS). The 
> lowest bits are the divider, 5 to 0. The TRM says max div is 32.
> 
> Tero said for him the dividers > 16 didn't "stick" to the register. I'm 
> now wondering if he has an old beagleboard with OMAP34xx, which has max 
> div 16.

So testing a bit more here, I can see the DSS working fine and fps as 
expected when I write values directly to CM_CLKSEL_DSS:5:0, with 
dividers up to 31. With 32, DSS breaks. The TRM (AM/DM37x) says value 32 
is valid.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
