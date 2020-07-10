Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2728321BCE4
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 20:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgGJSYY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 14:24:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40398 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGJSYX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 14:24:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AIOIe1071062;
        Fri, 10 Jul 2020 13:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594405458;
        bh=jFrY314H0OAYnM6pP2Z1vMuj0efc9tKuHVsiEZskv6E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nzQMUNbaqrIIL5CP3LuxJ5GsX6yHRjKvD4ScN1OXTJXyXLJtMyKWMKyZEcnEmB0br
         EhrcrKLawqpQBlxP+rJ9S0lNTfGGc5vNby2s7/L3Ulx31c4VjKFem0cWtXgVsqn+o1
         /+wBwaOEGogzw1tNkyDYxpzFyLrOp9II5nSg2mNs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AIOI6u047603
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 13:24:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 13:24:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 13:24:18 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AIOHWr052665;
        Fri, 10 Jul 2020 13:24:17 -0500
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
 <20200710174051.GG5849@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <d9f5dab4-a588-2dda-6d95-7e0c9c5f6b14@ti.com>
Date:   Fri, 10 Jul 2020 13:24:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710174051.GG5849@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/10/20 12:40 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200710 17:18]:
>> On 7/10/20 11:58 AM, Tony Lindgren wrote:
>>> I wonder the following commit in v5.8-rc3 might help with this though:
>>>
>>> 5ce8aee81be6 ("bus: ti-sysc: Flush posted write on enable and disable")
>>>
>>
>> I had already tested on v5.8-rc4 when I posted the patches, so this patch
>> doesn't help. OMAP5 DSP is fine, because Think it has to do with this
>> automated
> 
> OK
> 
>> So, I am looking at the TRM, and the three VDD_{IVA,MPU,CORE}_I2C_DISABLE
>> bits in VOLTCTRL are marked debug-purpose only, so I don't think we should
>> be setting those to begin with. Any reason why you want to set those?
>> Anyway, these bits were not an issue, I have specifically tried that
>> already.
> 
> I'm pretty sure that's how the old TI PM branch was initializing them to
> disable voltctrl I2C use on init. But if these are not the issue I guess
> no need to mess with them.

OK.

> 
> Could it be that we have wrong voltage tables for 4460 in the mainline
> kernel? See earlier commit 32236a84906f ("ARM: OMAP2+: Update 4430
> voltage controller operating points").

I am running on Pandaboard, so it's a OMAP4430 ES2.2. Tried with the 
older values reverting the above commit, didn't make any difference. So, 
the only trigger point so far seems to be the automatic IVA voltage 
domain transition. Looks to be a timing related issue given that a debug 
trace also helped, wondering if it goes through a quick RET->ON->RET 
sequence from the time I disable the MMUs (child device) to the actual 
module disabling in sysc_module_disable() on the parent target-module 
device.

regards
Suman
