Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65D821BC30
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 19:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgGJR2g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 13:28:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50348 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJR2g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 13:28:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AHSW8t047719;
        Fri, 10 Jul 2020 12:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594402112;
        bh=jCPc+6jaziK3Wpf6rcI/cU6ahFDEiVnwjDvew5WE6fo=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=FliVh1s0bpdzkRcx8H631G26NGwPrUBvq7UQNbJMQt2LhqKQxH5feI4QFQVDP5Z/0
         fhgY96AvsryFI5nk79/EGLi1zdWGGC+tz3QJYpid2n2QHKZGcypbvxOx5ZTFMYcD6A
         oojTfIlvK9cZ6r3fToHxS+HfjzZbw5CBQF6zjruE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AHSWDH091711
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 12:28:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 12:28:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 12:28:31 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AHSVT7084896;
        Fri, 10 Jul 2020 12:28:31 -0500
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
Message-ID: <4602b219-6822-4ebc-66c6-c64740793938@ti.com>
Date:   Fri, 10 Jul 2020 12:28:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/10/20 12:17 PM, Suman Anna wrote:
> On 7/10/20 11:58 AM, Tony Lindgren wrote:
>> Hi,
>>
>> * Suman Anna <s-anna@ti.com> [200709 16:20]:
>>> Hi Tony,
>>>
>>> The following series contains all the necessary DT pieces to boot the
>>> IPU and DSP remote processors on OMAP4 and OMAP5 SoCs. They are
>>> enabled specifically on the TI OMAP4 PandaBoard and OMAP5 uEVM boards.
>>> This is the last DT piece that now completes the support for IPUs and
>>> DSPs on all OMAP4+ SoCs, similar patches were merged for 5.8 covering
>>> the DRA7xx/AM57xx SoCs. Appreciate it if you can pick up the series for
>>> 5.9 if it isn't too late.
>>
>> Great and good to hear things are working with only dts changes now :)
>> Yes let's try to get these merged.
> 
> Thanks.
> 
>>
>>> There is one issue that I have run into while testing this series on
>>> the latest kernel. I am seeing a l3_noc error for OMAP4 DSP when it
>>> attempts to auto-suspend or stop after it is booted. The issue is a
>>> L4CFG read error that happens in the sysc_disable_module() function
>>> in ti-sysc code.
>>>
>>> I do not have any issues on my downstream 5.4 based SDK kernel. I have
>>> root-caused this to the OMAP4 voltage controller patches you added for
>>> 5.5 kernel through your omap-for-v5.5/pm branch, specifically the
>>> commit 4873843718f9 ("ARM: OMAP2+: Initialize voltage controller for 
>>> omap4").
>>> The VOLTCTRL register value is 0x300 before that patch, and modifying
>>> this register either through  omap4_vc_init_pmic_signaling() or
>>> omap4_vc_set_pmic_signaling() will trigger this. A debug print in
>>> sysc_disable_module() also seems to help.
>>
>> Hmm interesting, not sure how the VOLTCTRL register affects this.
>>
>> I wonder the following commit in v5.8-rc3 might help with this though:
>>
>> 5ce8aee81be6 ("bus: ti-sysc: Flush posted write on enable and disable")
>>
> 
> I had already tested on v5.8-rc4 when I posted the patches, so this 
> patch doesn't help. OMAP5 DSP is fine, because Think it has to do with 
> this automated
> 
> So, I am looking at the TRM, and the three 
> VDD_{IVA,MPU,CORE}_I2C_DISABLE bits in VOLTCTRL are marked debug-purpose 
> only, so I don't think we should be setting those to begin with. Any 
> reason why you want to set those? Anyway, these bits were not an issue, 
> I have specifically tried that already.

FYI, the following one-line removal is enough for me to not see the error.

diff --git a/arch/arm/mach-omap2/vc.c b/arch/arm/mach-omap2/vc.c
index 86f1ac4c2412..b80c9dff81c4 100644
--- a/arch/arm/mach-omap2/vc.c
+++ b/arch/arm/mach-omap2/vc.c
@@ -44,7 +44,6 @@
  #define OMAP4_VDD_DEFAULT_VAL  \
         (OMAP4430_VDD_I2C_DISABLE_MASK | \
          OMAP4430_VDD_IVA_PRESENCE | OMAP4430_VDD_MPU_PRESENCE | \
-        OMAP4430_AUTO_CTRL_VDD_IVA(OMAP4430_AUTO_CTRL_VDD_RET) | \
          OMAP4430_AUTO_CTRL_VDD_MPU(OMAP4430_AUTO_CTRL_VDD_RET) | \
          OMAP4430_AUTO_CTRL_VDD_CORE(OMAP4430_AUTO_CTRL_VDD_RET))

regards
Suman

> 
>> I was seeing that occasionally with mcspi, but never had anything
>> reproducable.
>>
>> Regards,
>>
>> Tony
>>
> 

