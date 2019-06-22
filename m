Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0250F4F542
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2019 12:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFVKcu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 22 Jun 2019 06:32:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53126 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFVKct (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 22 Jun 2019 06:32:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5MAWjQq118992;
        Sat, 22 Jun 2019 05:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561199565;
        bh=flcX7zQ9OZpuV/CKYOEk9fLhQeytmb0ChQLomlZaq+M=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=nzVxnfh6qbY/zf2tn0TJMDJ6uAdxIvzKpl2qbuJLso1HBwhQ2cnyQk3Quee3OWQ5J
         4jXM798+0w4dO0mjHngczokHYZtnTZWOd5lAi93iSfHSF6w9EG7MkoBx3/LDuKfLfa
         ttU9oxAD7O2ETrrF7K1YMbDPa33WO0DoCtZ1nT24=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5MAWjaK113205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 22 Jun 2019 05:32:45 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 22
 Jun 2019 05:32:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 22 Jun 2019 05:32:45 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5MAWg7X094973;
        Sat, 22 Jun 2019 05:32:43 -0500
Subject: Re: DS0 broken on Linux-next-20190621
From:   Keerthy <j-keerthy@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <ivan.khoronzhuk@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>, "Kristo, Tero" <t-kristo@ti.com>
References: <12e578d2-1b54-67aa-a81e-5ce5a956fcd3@ti.com>
 <ff88c023-737c-ddf1-0842-0adb8c2ef9ac@ti.com>
Message-ID: <9aaca290-1f15-dba1-0c82-02d835cfd140@ti.com>
Date:   Sat, 22 Jun 2019 16:03:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ff88c023-737c-ddf1-0842-0adb8c2ef9ac@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 22/06/19 3:34 PM, Keerthy wrote:
> 
> 
> On 22/06/19 1:15 PM, Keerthy wrote:
>> Hi Tony,
>>
>> Seems like suspend fails on am437x-gp-evm on the latest next branch.
>>
>> commit e2d28c40292bdc35553d599e5bbbeaefbab49416 (HEAD -> local_next)
>> Author: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date:   Fri Jun 21 20:58:07 2019 +1000
>>
>> Basic suspend is broken i believe.
>>
>> commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Sun Jun 16 08:49:45 2019 -1000
>>
>>      Linux 5.2-rc5
>>
>> Is fine.
>>
>> I have not done a bisect yet. I will see if that gets better in the 
>> next couple of days else will need to debug.
> 
> git bisect bad
> bfe59032bd6127ee190edb30be9381a01765b958 is the first bad commit
> commit bfe59032bd6127ee190edb30be9381a01765b958
> Author: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
> Date:   Wed Jun 12 00:49:03 2019 +0300
> 
>      net: ethernet: ti: cpsw: use cpsw as drv data
> 
> Turns out the above patch is breaking suspend resume on am43/33 also.
> 
> Just reverting this patch from latest next-20190621 resolves the issue.

Posted:

https://patchwork.kernel.org/patch/11011263/

That fixes the Suspend/resume issues on AM43.

- Keerthy
> 
> - Keerthy
> 
>>
>> - Keerthy
>>
