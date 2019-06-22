Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4944B4F50B
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2019 12:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfFVKDg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 22 Jun 2019 06:03:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39422 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFVKDf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 22 Jun 2019 06:03:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5MA3Xkv029912;
        Sat, 22 Jun 2019 05:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561197813;
        bh=mvTUzrqP8WUGNR8yimIxg/PeDvzTEN2Ak+AgUiu4NHY=;
        h=Subject:From:To:References:CC:Date:In-Reply-To;
        b=gDQU1eeMKM5FuDHD7mwytePriHy3BFjIhDAIiNgNR/DMBbL8eVoj1UuGwOtZ+NIoW
         R5jvrFUFs1UpP3qzYSRhqdVjInDTTBWtDA8SS7NEMHFUwo8x1dl/VmAoaojOp06XLp
         OCG6gcelk4AeW4Oy/VhJdlHHNrR3ytVDvYY1TRNY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5MA3XwA026856
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 22 Jun 2019 05:03:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 22
 Jun 2019 05:03:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 22 Jun 2019 05:03:33 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5MA3UZY123220;
        Sat, 22 Jun 2019 05:03:31 -0500
Subject: Re: DS0 broken on Linux-next-20190621
From:   Keerthy <j-keerthy@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <ivan.khoronzhuk@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <12e578d2-1b54-67aa-a81e-5ce5a956fcd3@ti.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>, "Kristo, Tero" <t-kristo@ti.com>
Message-ID: <ff88c023-737c-ddf1-0842-0adb8c2ef9ac@ti.com>
Date:   Sat, 22 Jun 2019 15:34:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <12e578d2-1b54-67aa-a81e-5ce5a956fcd3@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 22/06/19 1:15 PM, Keerthy wrote:
> Hi Tony,
> 
> Seems like suspend fails on am437x-gp-evm on the latest next branch.
> 
> commit e2d28c40292bdc35553d599e5bbbeaefbab49416 (HEAD -> local_next)
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Fri Jun 21 20:58:07 2019 +1000
> 
> Basic suspend is broken i believe.
> 
> commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jun 16 08:49:45 2019 -1000
> 
>      Linux 5.2-rc5
> 
> Is fine.
> 
> I have not done a bisect yet. I will see if that gets better in the next 
> couple of days else will need to debug.

git bisect bad
bfe59032bd6127ee190edb30be9381a01765b958 is the first bad commit
commit bfe59032bd6127ee190edb30be9381a01765b958
Author: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Date:   Wed Jun 12 00:49:03 2019 +0300

     net: ethernet: ti: cpsw: use cpsw as drv data

Turns out the above patch is breaking suspend resume on am43/33 also.

Just reverting this patch from latest next-20190621 resolves the issue.

- Keerthy

> 
> - Keerthy
> 
