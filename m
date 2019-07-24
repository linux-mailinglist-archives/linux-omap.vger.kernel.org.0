Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01CC672784
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 07:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfGXFt4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 01:49:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43178 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXFtz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 01:49:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6O5nmT0056452;
        Wed, 24 Jul 2019 00:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563947388;
        bh=RYvjllr1MbBnFqdxeJVEJPyJo8N8D3fjWqMgHX3/a70=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ANsJayOXjU9T6zfjwbV79COTPIaGWu62G+kPNspPZ7F8Z3s5rafzy8qgjA4wNr5z8
         jGNw6iVPi9DChYFrviB8zY9cOdXI4bRNFpk49qhW6yJgcMZO197ENF5qFxh395ADtM
         4u8nisFq8n+mzlPQrIg2Y3JtIgsEf+8w2vWTSKVA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6O5nmKP099923
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 00:49:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 00:49:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 00:49:47 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6O5nheF016972;
        Wed, 24 Jul 2019 00:49:44 -0500
Subject: Re: [PATCH 2/8] ARM: OMAP2+: Remove unconfigured midlemode for am3
 lcdc
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>,
        <linux-omap@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-3-tony@atomide.com>
 <bcc130a5-f7e0-e182-9f4b-5a48fc3d6e17@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <52328e14-58b2-2ea1-8b0a-33548a1c6a7a@ti.com>
Date:   Wed, 24 Jul 2019 11:20:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bcc130a5-f7e0-e182-9f4b-5a48fc3d6e17@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 24/07/19 12:33 AM, Suman Anna wrote:
> + Jyri
> 
> On 7/23/19 6:28 AM, Tony Lindgren wrote:
>> We currently get a warning for lcdc because of a difference
>> with dts provided configuration compared to the legacy platform
>> data. This is because lcdc has SYSC_HAS_MIDLEMODE configured in
>> the platform data without configuring the modes.
> 
> Hi Tony,
> While I understand that you are trying to match the DT data with the
> existing legacy data, do you know if there was a reason why this was
> omitted in the first place? Should we be really adding the MSTANDBY_
> flags and fix up the DTS node accordingly? I tried looking through the
> git log, and the initial commit itself didn't add the MSTANDBY_ flags
> but used the SYSC_HAS_MIDLEMODE.
> 
> Jyri,
> Do you know the history?

Tony/Suman,

This patch breaks DS0 on am3.

- Keerthy

> 
> regards
> Suman
> 
>>
>> Let's fix the warning by removing SYSC_HAS_MIDLEMODE. Note that
>> the am335x TRM lists SYSC_HAS_MIDLEMODE, but it is unused.
> 
> 
> 
>>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
>> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
>> @@ -231,7 +231,7 @@ static struct omap_hwmod am33xx_control_hwmod = {
>>   static struct omap_hwmod_class_sysconfig lcdc_sysc = {
>>   	.rev_offs	= 0x0,
>>   	.sysc_offs	= 0x54,
>> -	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
>> +	.sysc_flags	= SYSC_HAS_SIDLEMODE,
>>   	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
>>   	.sysc_fields	= &omap_hwmod_sysc_type2,
>>   };
>>
> 
