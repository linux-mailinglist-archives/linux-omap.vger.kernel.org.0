Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E79921BC0A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 19:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGJRR5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 13:17:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49140 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGJRR4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 13:17:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AHHqJb045219;
        Fri, 10 Jul 2020 12:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594401472;
        bh=And+UVi6LJgw5zNisJ1sin3PCpYh9TJOQeoY32MycvU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YkW+/knVkNDayC3kyNth0DZgpQHHtIr2KdyxAtYhO7/SY4KXdKlRiU8IKHnXEWOvh
         3g6LrNxkJX5Uzadc77JKaUjZ/IRrVoRFO7EMQswVLuLnp2aN3QpNVug1cMC63YIv4G
         daW1LxlV9TE44ucTrGuv28s+QDJgOjS71EKYylR8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AHHqp0108775
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 12:17:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 12:17:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 12:17:51 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AHHpX6013622;
        Fri, 10 Jul 2020 12:17:51 -0500
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
Date:   Fri, 10 Jul 2020 12:17:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710165814.GF5849@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/10/20 11:58 AM, Tony Lindgren wrote:
> Hi,
> 
> * Suman Anna <s-anna@ti.com> [200709 16:20]:
>> Hi Tony,
>>
>> The following series contains all the necessary DT pieces to boot the
>> IPU and DSP remote processors on OMAP4 and OMAP5 SoCs. They are
>> enabled specifically on the TI OMAP4 PandaBoard and OMAP5 uEVM boards.
>> This is the last DT piece that now completes the support for IPUs and
>> DSPs on all OMAP4+ SoCs, similar patches were merged for 5.8 covering
>> the DRA7xx/AM57xx SoCs. Appreciate it if you can pick up the series for
>> 5.9 if it isn't too late.
> 
> Great and good to hear things are working with only dts changes now :)
> Yes let's try to get these merged.

Thanks.

> 
>> There is one issue that I have run into while testing this series on
>> the latest kernel. I am seeing a l3_noc error for OMAP4 DSP when it
>> attempts to auto-suspend or stop after it is booted. The issue is a
>> L4CFG read error that happens in the sysc_disable_module() function
>> in ti-sysc code.
>>
>> I do not have any issues on my downstream 5.4 based SDK kernel. I have
>> root-caused this to the OMAP4 voltage controller patches you added for
>> 5.5 kernel through your omap-for-v5.5/pm branch, specifically the
>> commit 4873843718f9 ("ARM: OMAP2+: Initialize voltage controller for omap4").
>> The VOLTCTRL register value is 0x300 before that patch, and modifying
>> this register either through  omap4_vc_init_pmic_signaling() or
>> omap4_vc_set_pmic_signaling() will trigger this. A debug print in
>> sysc_disable_module() also seems to help.
> 
> Hmm interesting, not sure how the VOLTCTRL register affects this.
> 
> I wonder the following commit in v5.8-rc3 might help with this though:
> 
> 5ce8aee81be6 ("bus: ti-sysc: Flush posted write on enable and disable")
> 

I had already tested on v5.8-rc4 when I posted the patches, so this 
patch doesn't help. OMAP5 DSP is fine, because Think it has to do with 
this automated

So, I am looking at the TRM, and the three 
VDD_{IVA,MPU,CORE}_I2C_DISABLE bits in VOLTCTRL are marked debug-purpose 
only, so I don't think we should be setting those to begin with. Any 
reason why you want to set those? Anyway, these bits were not an issue, 
I have specifically tried that already.

regards
Suman

> I was seeing that occasionally with mcspi, but never had anything
> reproducable.
> 
> Regards,
> 
> Tony
> 

