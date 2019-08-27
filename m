Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1A9F18C
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 19:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfH0R0H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 13:26:07 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54638 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0R0H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 13:26:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RHQ1dS030460;
        Tue, 27 Aug 2019 12:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566926761;
        bh=Bdi5BOVcTGiJDzCpIp+eoSHYAORQ+QWxWyetB+SK3Vk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AQX5H6lWrExHKPW8YMh6/RTAMEaMlj4PDDvK/+paBjCQFvghY4B6iu615j9wdWeKL
         wGj5nppgw7+u1CjgWlUnCrOWsZog9kJDSOLHnEVGzskIzl1r7r/BVaFGs2GzJNONIS
         RK+RmXnLmXJ/+KULoyCmwltoljeWxIJh00+lNLVY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RHQ1H5092260
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 12:26:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 12:26:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 12:26:00 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RHPwKu026254;
        Tue, 27 Aug 2019 12:25:59 -0500
Subject: Re: OMAP3 ROM RNG probe failure on N900
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
CC:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <20190827155054.GI30291@darkstar.musicnaut.iki.fi>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <3bc13b5d-abb4-8fb7-fca3-377bc58618fa@ti.com>
Date:   Tue, 27 Aug 2019 20:25:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827155054.GI30291@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/08/2019 18:50, Aaro Koskinen wrote:
> Hi,
> 
> On Tue, Aug 27, 2019 at 10:11:20AM +0200, Pali Rohár wrote:
>> On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
>>> On 24.8.2019 0.46, Aaro Koskinen wrote:
>>>> I was looking at N900 boot logs from the current mainline (v5.3-rc),
>>>> and noticed this:
>>>>
>>>> [    3.297668] omap3_rom_rng: initializing
>>>> [    3.301940] omap3_rom_rng: unable to get RNG clock
>>>> [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
>>>>
>>>> It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
>>>> cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
>>>> How this driver is supposed to work now? I guess it has been broken for
>>>> a while. :-(
>>>
>>> You should have a DT node for the device, which contains the clock handle.
>>
>> Hello, I have not tested new kernel on N900 for a longer time. And at
>> that time (4.9) it worked fine. So it is just missing DT node? Maybe you
>> could fix it when you testing it?
> 
> The driver does not seem to have DT support, it has only legacy init in
> pdata-quirks. So maybe deleting the clock alias was premature.

It would be highly preferable to convert the driver out of legacy mode 
then. Especially in this case where nobody cared about this going 
missing for two years; it was one of the main points to ditch the clock 
aliases so that we would notice the legacy drivers around.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
