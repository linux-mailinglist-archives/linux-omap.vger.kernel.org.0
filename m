Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 071011273E7
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 04:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfLTDaf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 22:30:35 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42328 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfLTDad (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 22:30:33 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK3UVd7033627;
        Thu, 19 Dec 2019 21:30:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576812631;
        bh=CEiYEc8IsJ5R4mJMeLVcpxYuKd3Ehpap0xHTNXwuhQI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wMaC+WlpekLzQuOmWkyXftoCOjCRk9STBk8Nz1v4zy37kK7NaYt1e3XstA1yOB7K0
         HlbhV08jJobiL5UQEyw8A5GmI94+gVXQKHH9/HMJgipp81/no2OOHo7NDERwnaukfc
         QZyNRwyvMGSd4SI3RiJHxGb5i6PluYdImxbyS0f8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK3UV8v048516
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 21:30:31 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 21:30:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 21:30:31 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK3UVVF001445;
        Thu, 19 Dec 2019 21:30:31 -0600
Subject: Re: [PATCH 02/17] remoteproc/omap: Switch to SPDX license identifiers
To:     Tero Kristo <t-kristo@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-3-t-kristo@ti.com> <20191109010348.GB5662@tuxbook-pro>
 <bed42f27-3a67-bfa7-fdcc-bf333233828f@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <bd4fc14d-ce63-93d5-6f52-7a1def7c57c3@ti.com>
Date:   Thu, 19 Dec 2019 21:30:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bed42f27-3a67-bfa7-fdcc-bf333233828f@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/19 2:16 AM, Tero Kristo wrote:
> On 09/11/2019 03:03, Bjorn Andersson wrote:
>> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
>>
>>> From: Suman Anna <s-anna@ti.com>
>>>
>>> Use the appropriate SPDX license identifiers in various OMAP remoteproc
>>> source files and drop the previous boilerplate license text.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
>>>   1 file changed, 1 insertion(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/omap_remoteproc.h
>>> b/drivers/remoteproc/omap_remoteproc.h
>>> index f6d2036d383d..1e6fef753c4f 100644
>>> --- a/drivers/remoteproc/omap_remoteproc.h
>>> +++ b/drivers/remoteproc/omap_remoteproc.h
>>> @@ -1,35 +1,10 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>>
>> Please confirm that you actually intend to change the license from BSD
>> to dual here.
> 
> That is a very good point. Let me try to get clarification to this
> internally, this series is anyways too late for 5.5 so there is no rush
> to get this done anytime soon. Worst case I just drop this patch and
> keep the existing license in place.

He he, even I can't seem to recall the reason why I used dual here.
Let's stick with BSD-3-Clause which is the original license text below.

regards
Suman

> 
> -Tero
> 
>>
>> Regards,
>> Bjorn
>>
>>>   /*
>>>    * Remote processor messaging
>>>    *
>>>    * Copyright (C) 2011 Texas Instruments, Inc.
>>>    * Copyright (C) 2011 Google, Inc.
>>>    * All rights reserved.
>>> - *
>>> - * Redistribution and use in source and binary forms, with or without
>>> - * modification, are permitted provided that the following conditions
>>> - * are met:
>>> - *
>>> - * * Redistributions of source code must retain the above copyright
>>> - *   notice, this list of conditions and the following disclaimer.
>>> - * * Redistributions in binary form must reproduce the above copyright
>>> - *   notice, this list of conditions and the following disclaimer in
>>> - *   the documentation and/or other materials provided with the
>>> - *   distribution.
>>> - * * Neither the name Texas Instruments nor the names of its
>>> - *   contributors may be used to endorse or promote products derived
>>> - *   from this software without specific prior written permission.
>>> - *
>>> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>>> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>>> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
>>> FOR
>>> - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>>> - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>>> INCIDENTAL,
>>> - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>>> - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>>> USE,
>>> - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
>>> ANY
>>> - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>>> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
>>> USE
>>> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>>    */
>>>     #ifndef _OMAP_RPMSG_H
>>> -- 
>>> 2.17.1
>>>
>>> -- 
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

