Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD604179CCB
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 01:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbgCEAYv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 19:24:51 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36526 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388407AbgCEAYv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 19:24:51 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0250On3E111485;
        Wed, 4 Mar 2020 18:24:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583367889;
        bh=gPlToXhRUJtK9e9DoSo5lalTp1nN8pSY5/iPOikv2KQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dP7vZatJTqnDdmIrK2bhM3EHsBsgvQy348iXBeGumZyirUdTfmU9wYxTwVrGIbMv6
         EYI8a5bQIbrOWRa458lqhF6qhJkw+I7KwNHp/tGdls3kB5c+w2G1pM3D+3eMjkeDgo
         D7oXvStmiiIiUxD032FrDZ2RwaG0zPE4KIWCifzw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0250OneV018428
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Mar 2020 18:24:49 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 18:24:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 18:24:49 -0600
Received: from [128.247.81.254] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0250OnjP104237;
        Wed, 4 Mar 2020 18:24:49 -0600
Subject: Re: [PATCHv7 15/15] remoteproc/omap: Switch to SPDX license
 identifiers
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <afd@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-16-t-kristo@ti.com> <20200304224220.GC2799@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <28ab188e-9e6e-35dd-c423-30aaa80afb90@ti.com>
Date:   Wed, 4 Mar 2020 18:24:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200304224220.GC2799@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On 3/4/20 4:42 PM, Mathieu Poirier wrote:
> On Fri, Feb 21, 2020 at 12:19:36PM +0200, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> Use the appropriate SPDX license identifiers in various OMAP remoteproc
>> source files and drop the previous boilerplate license text.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>  drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
>>  1 file changed, 1 insertion(+), 26 deletions(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index 13f17d9135c0..828e13256c02 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -1,35 +1,10 @@
>> +/* SPDX-License-Identifier: BSD-3-Clause */
> 
> This is odd considering omap_remoteproc.c is GPL-2.0-only

We were using these enums on the firmware-side as well. The first
version of this in v1 [1] is actually using Dual BSD and GPL-2.0-only,
but even that one had posed some questions, so just converting to use
the SPDX for the original license text.

regards
Suman

[1] https://patchwork.kernel.org/patch/11215415/
> 
> Thanks,
> Mathieu
> 
>>  /*
>>   * Remote processor messaging
>>   *
>>   * Copyright (C) 2011-2020 Texas Instruments, Inc.
>>   * Copyright (C) 2011 Google, Inc.
>>   * All rights reserved.
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
>>   */
>>  
>>  #ifndef _OMAP_RPMSG_H
>> -- 
>> 2.17.1
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

