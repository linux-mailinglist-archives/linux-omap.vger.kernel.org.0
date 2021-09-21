Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FFF4137CE
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 18:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbhIUQvD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 12:51:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33818 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhIUQvD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 12:51:03 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LGnGQW048428;
        Tue, 21 Sep 2021 11:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632242956;
        bh=5sR0X35KqvIMpdZXLvw3Z+eHAOwkL/IG6K26vF3GlXw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=F7m/hMPgwlLMLknt3ACiVdNL7+B6suVjxLIUuAc1e/pqFWuZOtKqPSsTr9rrL7w3Y
         MOuDR231/I88X2U84zvRwo7p+F4KVVJfOkO0ju4OzB7ZDuWhDc/wIPeuCeCxMY/SXk
         dClMIZeiHubKKZPuRfv67JGEbDekZAGqHT94xxjM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LGnG4b088954
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Sep 2021 11:49:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 11:49:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 11:49:16 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LGnFtV095643;
        Tue, 21 Sep 2021 11:49:15 -0500
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com> <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
 <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8314761b-b8b9-76f6-5541-08258d2aae56@ti.com>
Date:   Tue, 21 Sep 2021 11:49:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/21/21 11:40 AM, H. Nikolaus Schaller wrote:
> Hi Matti, Tony,
> 
>> Am 21.09.2021 um 18:07 schrieb Suman Anna <s-anna@ti.com>:
>>
>> Hi Matti, Tony,
>>
>> On 9/21/21 2:47 AM, Tony Lindgren wrote:
>>> * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
>>>> Finally, adding the udelay(100); (as Tony suggested) at the end of the
>>>> omap_reset_deassert() did make the oops go away even when pruss_tm was
>>>> enabled. I don't know what would be a proper fix though.
>>
>> I have been able to boot v5.15-rc1 just fine on my BBB without any additional
>> changes [1].
> 
> Same for me with a v5.15-rc1 based kernel.
> 
>> May I ask what is your BBB board version? My board is rev.A5C.
> 
> I have an Rev B6 with EXP41 display attached. I think Matti reported a Rev C board?
> 
>> I vaguely remember from all those years ago when I first enabled PRUSS on AM335x
>> that some earlier BBB versions had some issues around PRUSS.
> 
> What I am not using is PRUSS so it may (or may not) be disabled in CONFIG.

Hi Nikolaus,

Irrespective of whether you enable PRUSS configs or not (it's not enabled by
default), the ti-sysc bus driver performs a enable and disable sequence during
it's probe of the pruss_tm target-module. The module quirks are applied using
the SYSC revision register value.

The module will be disabled by the time you get to the console, and thereafter
the enabling of PRUSS IP is done through pm_runtime API when the pruss module is
probed.

regards
Suman
