Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9482413E25
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 01:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhIUXyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 19:54:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhIUXyw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 19:54:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LNrCqK081573;
        Tue, 21 Sep 2021 18:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632268392;
        bh=jjUeDPDF1YHObUoZjxKJB2Gi2KKuOAOryz8ngfflF1k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vaWUJLsqSa2U6Ex5C4K1z8Rcpto4+UQoghsms0QR9Srx3t42smUFlOIQzuk30fa1n
         Svi8JX9+lghCPTDwAciVzlkpKbPGUD3HPloJ/BSwZetVVnF3yAQVEbEJpADO8TL97o
         UN0Ci6qtaVMQPxq9ZmuzI9i1sa668tgLSNuwms5Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LNrCOZ011409
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Sep 2021 18:53:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 18:53:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 18:53:12 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LNrC4q119274;
        Tue, 21 Sep 2021 18:53:12 -0500
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     Robert Nelson <robertcnelson@gmail.com>
CC:     Drew Fustini <pdp7pdp7@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com> <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
 <CAEf4M_B1vam_ykRZmQ5++QArC-=+yooRg25BrQXKE5nk8AtqbA@mail.gmail.com>
 <40077cea-1f5e-de67-58dd-7fae0f63678d@ti.com>
 <CAOCHtYjMO1XjLRGxP1GMFudXh3meNQB2F44z_NRaFUnX=Fb+Mw@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <066d9a7e-89c2-b8b5-b2cd-4993513f5a64@ti.com>
Date:   Tue, 21 Sep 2021 18:53:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOCHtYjMO1XjLRGxP1GMFudXh3meNQB2F44z_NRaFUnX=Fb+Mw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/21/21 5:00 PM, Robert Nelson wrote:
> On Tue, Sep 21, 2021 at 4:54 PM Suman Anna <s-anna@ti.com> wrote:
>>
>> On 9/21/21 3:29 PM, Drew Fustini wrote:
>>> On Tue, Sep 21, 2021 at 9:09 AM Suman Anna <s-anna@ti.com> wrote:
>>>>
>>>> Hi Matti, Tony,
>>>>
>>>> On 9/21/21 2:47 AM, Tony Lindgren wrote:
>>>>> * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
>>>>>> Finally, adding the udelay(100); (as Tony suggested) at the end of the
>>>>>> omap_reset_deassert() did make the oops go away even when pruss_tm was
>>>>>> enabled. I don't know what would be a proper fix though.
>>>>
>>>> I have been able to boot v5.15-rc1 just fine on my BBB without any additional
>>>> changes [1].
>>>>
>>>> May I ask what is your BBB board version? My board is rev.A5C.
>>>
>>> That rev is quite old [1].  Would you be able to try a Rev C?  It has
>>> been in production since around 2014 with the move from 2GB to 4GB
>>> eMMC.
>>
>> I don't have any rev.C boards handy to try.
>>
>> I am curious to see if there is some correlation between failures and board
>> versions. I see that there is a minor processor change to AM3358 from rev.B
>> onwards compared to the AM3359 that I would have on my board. PRU-ICSS IP would
>> be present and supported on both though.
> 
> Rev B vs Rev C shouldn't matter..  I don't think I even have a Rev
> "B".. A6A, B, to C* was done very quickly at CIrcuitCo at that time..
> 
> https://elinux.org/Beagleboard:BeagleBoneBlack#Revision_B
> 
> "This version moves to the AM3358BZCZ100 processor as we are no longer
> able to get the limited production version of the AM3359AZCZ100."
> 
> I'm assuming the AM3358 had the pru enabled..

Yes, PRU-ICSS is present on AM3356 and above.

regards
Suman
