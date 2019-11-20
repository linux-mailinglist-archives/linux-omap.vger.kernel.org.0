Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3071038B1
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2019 12:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbfKTL2O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Nov 2019 06:28:14 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49302 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfKTL2O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Nov 2019 06:28:14 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKBSCjM127927;
        Wed, 20 Nov 2019 05:28:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574249292;
        bh=GUgrQ9YULe91DrXQ+8TwVYgwqoHl60RO9lw93hG44Sg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TrpoXoSNzbYxsVLMTv9n/91H5MM22C8L8LNy0Up5WIbCqp4lBSNZEr61qNZaj7E0G
         r53UsOr6VCKmXjiuu/GigqCbpbnTphnVMaHUGBw7QQUJ3UQd6IhTyRxXv/Lc72jq+j
         ZgFYxhpJzn6l7xqxAemmuWppnWPTzSHZsTiHhrVM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKBSCC8047935;
        Wed, 20 Nov 2019 05:28:12 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 05:28:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 05:28:08 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKBS60F040774;
        Wed, 20 Nov 2019 05:28:07 -0600
Subject: Re: [PATCHv2 00/15] Remoteproc: updates for OMAP remoteproc support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
References: <20191119141645.19777-1-t-kristo@ti.com>
 <CANLsYkwyLMHzKkm-6X+OgQ+khRYJshMJsxdst7+c7n+hX4nLpQ@mail.gmail.com>
 <CANLsYkwcWDOPx_rpL5RkzsNLyw+ccPE0bNhar6xv1SZ1=R5xmA@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <46a3bfb0-6bf1-b3d9-14a6-d2ed5b91c930@ti.com>
Date:   Wed, 20 Nov 2019 13:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkwcWDOPx_rpL5RkzsNLyw+ccPE0bNhar6xv1SZ1=R5xmA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/11/2019 20:07, Mathieu Poirier wrote:
> On Tue, 19 Nov 2019 at 10:31, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>>
>> On Tue, 19 Nov 2019 at 07:17, Tero Kristo <t-kristo@ti.com> wrote:
>>>
>>> Hi,
>>>
>>> This is v2 of the series [1], addressing comments from Bjorn and Rob.
>>> Bindings patch is funnily v2.5, as I posted v2 already and wanted to
>>> keep this somehow in sync. Individual patches contain comments about the
>>> changes, or Reviewed-by tags provided if there are no changes.
>>>
>>> I also dropped the conversion patch to SPDX licensing until I can
>>> confirm the license we want to use. Lets just keep the existing in place
>>> until that.
>>>
>>> This series still depends on the reset + clock patches posted earlier,
>>> but both of those dependencies are in linux-next now.
>>
>> I tried to apply your set to today's linux-next (next-20191119) but it
>> fails at patch 13.
> 
> Digging further into this patch 12 is causing problem on next-20191119 (not 13):
> 
> mpoirier@xps15:~/work/remoteproc/kernel-review$ git apply --reject
> 0012-remoteproc-omap-add-support-for-system-suspend-resum.patch
> Checking patch drivers/remoteproc/omap_remoteproc.c...
> Hunk #3 succeeded at 85 (offset -1 lines).
> Hunk #4 succeeded at 99 (offset -1 lines).
> Hunk #5 succeeded at 359 (offset -1 lines).
> Hunk #6 succeeded at 544 (offset -1 lines).
> Hunk #7 succeeded at 952 (offset -1 lines).
> Hunk #8 succeeded at 992 (offset -2 lines).
> Checking patch drivers/remoteproc/omap_remoteproc.h...
> error: while searching for:
> /*
>   * Remote processor messaging
>   *
>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
>   * All rights reserved.
>   */
> 
> error: patch failed: drivers/remoteproc/omap_remoteproc.h:2
> Hunk #2 succeeded at 57 (offset 25 lines).
> Hunk #3 succeeded at 80 (offset 25 lines).
> Applied patch drivers/remoteproc/omap_remoteproc.c cleanly.
> Applying patch drivers/remoteproc/omap_remoteproc.h with 1 reject...
> Rejected hunk #1.
> Hunk #2 applied cleanly.
> Hunk #3 applied cleanly.
> 
> Your patch expects the last line of the first hunk to be '*/' but it
> is '*' in linux-next.

Hmm right, this seems my bad. This is caused by me dropping the SPDX 
license conversion patch from the series, if that is applied, it goes 
cleanly.

Simple rebase of patch 12 is going to fix that though.

-Tero

> 
>>
>> Mathieu
>>
>>>
>>> -Tero
>>>
>>> [1] https://patchwork.kernel.org/cover/11215421/
>>>
>>>
>>>
>>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
