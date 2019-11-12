Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57392F8A4F
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfKLIQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:16:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39166 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfKLIQT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:16:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8GHo7025729;
        Tue, 12 Nov 2019 02:16:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573546577;
        bh=90PIXBNPPxoBh+X/S5ytuCw+cth895+fkNlDDDdfZ+8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FeMJ77m5y3EVGtD6hxOuUSEawKpztgksem+syQxvD7uwIa9NDrMklb83EgddPLJG4
         bued6byurwO8oIYb5vR4Bj5rF4+UTKCyMgcv5x3QW0IkmVEdMaq2T/wj33T+X5T1D6
         Kq+b9jV2YPwdej//DbuggjvcpA0iCD/ywyYYGUzM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8GHDt015929
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:16:17 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:15:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:15:59 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8GD4P067663;
        Tue, 12 Nov 2019 02:16:15 -0600
Subject: Re: [PATCH 02/17] remoteproc/omap: Switch to SPDX license identifiers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-3-t-kristo@ti.com> <20191109010348.GB5662@tuxbook-pro>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <bed42f27-3a67-bfa7-fdcc-bf333233828f@ti.com>
Date:   Tue, 12 Nov 2019 10:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191109010348.GB5662@tuxbook-pro>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/11/2019 03:03, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
>> From: Suman Anna <s-anna@ti.com>
>>
>> Use the appropriate SPDX license identifiers in various OMAP remoteproc
>> source files and drop the previous boilerplate license text.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
>>   1 file changed, 1 insertion(+), 26 deletions(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index f6d2036d383d..1e6fef753c4f 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -1,35 +1,10 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> 
> Please confirm that you actually intend to change the license from BSD
> to dual here.

That is a very good point. Let me try to get clarification to this 
internally, this series is anyways too late for 5.5 so there is no rush 
to get this done anytime soon. Worst case I just drop this patch and 
keep the existing license in place.

-Tero

> 
> Regards,
> Bjorn
> 
>>   /*
>>    * Remote processor messaging
>>    *
>>    * Copyright (C) 2011 Texas Instruments, Inc.
>>    * Copyright (C) 2011 Google, Inc.
>>    * All rights reserved.
>> - *
>> - * Redistribution and use in source and binary forms, with or without
>> - * modification, are permitted provided that the following conditions
>> - * are met:
>> - *
>> - * * Redistributions of source code must retain the above copyright
>> - *   notice, this list of conditions and the following disclaimer.
>> - * * Redistributions in binary form must reproduce the above copyright
>> - *   notice, this list of conditions and the following disclaimer in
>> - *   the documentation and/or other materials provided with the
>> - *   distribution.
>> - * * Neither the name Texas Instruments nor the names of its
>> - *   contributors may be used to endorse or promote products derived
>> - *   from this software without specific prior written permission.
>> - *
>> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>> - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>> - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>> - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>> - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>    */
>>   
>>   #ifndef _OMAP_RPMSG_H
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
