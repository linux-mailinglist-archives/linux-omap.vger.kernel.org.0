Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B16820D74
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 18:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfEPQyW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 12:54:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39654 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfEPQyW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 12:54:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4GGsJ0Z061479;
        Thu, 16 May 2019 11:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558025659;
        bh=aUl5/v7kLlk/+gsSrV4FQtR3fqMgHIbX/yxWzQCusG0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JOvUKX8eS2QCVDDHouS9Yr0oYyLK5QrxmlDlNhG2sNDEcBfNYGr1yWtpjXHdIPrg4
         hLBz5mEelU9Hj0JKnWHmf6GLAnpBPyv5+RU4AwibdreZfIYLGP8I9SkyaAHgboXOkK
         e8pDXfVH+woQlpXiwbkVmSKiS/Wslqvh1I+8Bmok=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4GGsJPj128831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 11:54:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 11:54:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 11:54:18 -0500
Received: from [172.22.219.79] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4GGsFog128093;
        Thu, 16 May 2019 11:54:16 -0500
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
To:     Tony Lindgren <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com> <20190516161256.GB5447@atomide.com>
 <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
 <20190516164729.GC5447@atomide.com>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
Date:   Thu, 16 May 2019 22:24:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516164729.GC5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 5/16/2019 10:17 PM, Tony Lindgren wrote:
> * keerthy <j-keerthy@ti.com> [190516 16:31]:
>>
>>
>> On 5/16/2019 9:42 PM, Tony Lindgren wrote:
>>> Hi,
>>>
>>> * Keerthy <j-keerthy@ti.com> [190516 09:06]:
>>>> rtc is fused out on dra76 and accessing target module
>>>> register is causing a boot crash hence disable it.
>>>
>>> So for a fix, can we have a separate dra7 something dtsi file
>>> to disable these instead?
>>>
>>> Or are there already multiple SoC revisions for the same EVM?
>>
>> dra76 & dra71 have rtc fused out. So i did not introduce a new dtsi file
>> to disable.
> 
> But then any new board with dra76 or dra71 will need to debug
> the same issue again. Sure we can get away for now tweaking the
> board file, but to me it sounds like it's going to be more
> devices that will be affected too?

Okay. This is a SoC related issue so yes any new board will have to 
again implement disabling.

> 
> Is there some feature matrix available somewhere online?

Not that i know of. I will try finding something.

> 
>>> Then in the long run, if there are the same EVMs with multiple
>>> SoC options, the best thing to do is to would be to detect the
>>> SoC type and update the property dynamically to set the features
>>> not available on the booted SoC to status = "disabled". Seems
>>> like that could be done in the ti-sysc driver probe unless needed
>>> earlier.
>>
>> For now rtc is disabled only in dra71/dra76. So best disable it in the
>> evm.dts? Not sure if we need dynamic disabling as we know at DT level that
>> it is to be disabled.
> 
> Well the thing is we should make introducing new board dts files
> as easy as including the SoC dtsi file and with that it should
> boot with no extra debugging.
> 
> How about add minimal dra76 and dra71 dtsi files in addition to
> the board specific fix(es)? Then for v5.3, we can deal adding more
> dra7 specifc evm files using these dtsi files or dynamically start
> disabling modules.

You mean having a dra76/dra71.dtsi with rtc/usb4_tm disabled and that 
gets included in dra76/dra71-evm.dts?

> 
> Regards,
> 
> Tony
> 
