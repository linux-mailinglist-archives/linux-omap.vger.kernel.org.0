Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76046C20D8
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbfI3MsF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 08:48:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47088 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfI3MsF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 08:48:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UClwFS118509;
        Mon, 30 Sep 2019 07:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569847678;
        bh=MU2IxupzjQxFjETdLI0C8t3D/A7a75NCIfAIo/YLC3A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=d6t4GmHOHUZhaLi1mgBh5+2uyMRrj9wMIVt4h4QtMin8NiBOL5wVoM600314q9VIk
         R0Yb2k6rIK8uzNNMQa++8MnWRq0UEWEY6qciw6IYlkB5iR4KQFYolhpNZrHk4RvTRi
         rXiO03k0BfW1/NQ2PqOs6TstF3fnHNFChDNQNVh4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UClwFc108236
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 07:47:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 07:47:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 07:47:58 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UClrff044162;
        Mon, 30 Sep 2019 07:47:55 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
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
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
Date:   Mon, 30 Sep 2019 15:47:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/09/2019 15:41, Adam Ford wrote:
> On Mon, Sep 30, 2019 at 3:53 AM Tero Kristo <t-kristo@ti.com> wrote:
>>
>> On 30/09/2019 09:45, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 27/09/2019 18:47, Tomi Valkeinen wrote:
>>>> On 27/09/2019 18:37, Tero Kristo wrote:
>>>>
>>>>> If you can provide details about what clock framework / driver does
>>>>> wrong (sample clk_set_xyz call sequence, expected results via
>>>>> clk_get_xyz, and what fails), I can take a look at it. Just reporting
>>>>> arbitrary display driver issues I won't be able to debug at all (I
>>>>> don't have access to any of the displays, nor do I want to waste time
>>>>> debugging them without absolutely no knowledge whatsoever.)
>>>>
>>>> I used your hack patches to allow changing rates via debugfs. And set
>>>> dss1_alwon_fck_3430es2 to 27000000 or 27870967. The end result was
>>>> that DSS gets some very high clock from dss1_alwon_fck_3430es2, as the
>>>> frame rate jumps to many hundreds fps.
>>>>
>>>> So, these numbers are not real, but to give the idea what I saw.
>>>> Running first with 50 MHz, I can see, say, 40 fps. Then I set the
>>>> clock to 30 MHz, and fps dropped to, say, 30fps, as expected with
>>>> lower clock. Then I set the clock to 27MHz (or the other one),
>>>> expecting a bit lower fps, but instead I saw hundreds of fps.
>>>>
>>>> I don't know if there's any other way to observe the wrong clock rate
>>>> but have the dss enabled and running kmstest or similar. I can help
>>>> you set that up next week, should be trivial. You don't need a display
>>>> for that.
>>>
>>> Here's how to reproduce. I have the attached patches. Three of them are
>>> the clk-debug ones, and one of mine to make it easy to test without a
>>> display, and without underflow flood halting the device. There are on
>>> top of v5.3. Kernel config also attached.
>>>
>>> kmstest is from kms++ project (https://github.com/tomba/kmsxx). It
>>> should be straightforward to compile, but kmstest binary is also
>>> included in TI's rootfs.
>>
>> Ok, I ignored all your test code and just fiddled with my trusty clk
>> debugfs patches. I don't like debugging with test code I have no
>> experience with. :)
>>
>> Anyways, it seems the dpll4_m4_ck max divider value is wrong, it only
>> accepts values upto 16 at least on my board. The setting for this in DT
>> is 32, and it is most likely SoC specific what happens if you write an
>> invalid value to the divider.
>>
>> The best action here is probably to drop the max-div value for this
>> clock to 16. Can someone check this with their display setup and see
>> what happens? Attached patch should do the trick.
> 
> I tried your attached patch on my dm3730 and that seems to make it
> somewhat better in that it doesn't hang anymore, so that leads me to
> believe that your comment about the divider being only valid on the
> omap36 may not be true. I do think it solves the hanging issue that i
> was seeing, but I now see a new one now which is dumping a backtrace.
> 
> It looks like it's unhappy that its trying to get one frequency and
> getting something different instead.
> 
> [   10.014099] WARNING: CPU: 0 PID: 111 at
> drivers/gpu/drm/omapdrm/dss/dss.c:655 dss_set_fck_rate+0x70/0x90
> [omapdss]
> [   10.014129] clk rate mismatch: 27870968 != 27000000

I believe this one is for Tomi to comment, his driver does some magic 
compares for the requested vs. actual received clock rates. If I am not 
mistaken, we are only modifying an integer divider here, and thus it is 
physically impossible to get accurate 27MHz rate to display.

-Tero

> 
> See attached log for the full dump.
> 
> Either way, I think you've identified the main issue.  I just think we
> may have uncovered another one in the process.
> 
> For what it's worth, the video looks good.  :-)
> 
> adam
>>
>> -Tero
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
