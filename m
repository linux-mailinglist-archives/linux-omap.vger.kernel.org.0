Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA1F191BCD
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 06:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfHSEYi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 00:24:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55888 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfHSEYh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 00:24:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J4ORA1001682;
        Sun, 18 Aug 2019 23:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566188667;
        bh=o/bLgqrA28blN+/9BjCCx0iYD40MdmGS6KfFf59tN7g=;
        h=To:CC:From:Subject:Date;
        b=qtlk//fXKndnCfoxHlE0RH+uU4HGSlyqaHNgU3fTr4U/uGUk1BcojRjnNfqhDPT8P
         SXQLoPIenEm4I/fiOUXLL7P0Lnv2VlLNh7HNyXvIH+v5yhKq8Cbrhw2MveN2wDZeWe
         QwxnEi06AQWhwCWFSqI2JSzcoAg/57sRlP4v6Mlk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J4ORxo026345
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 18 Aug 2019 23:24:27 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 18
 Aug 2019 23:24:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 18 Aug 2019 23:24:26 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J4OOj3035279;
        Sun, 18 Aug 2019 23:24:24 -0500
To:     <swboyd@chromium.org>, Tony Lindgren <tony@atomide.com>,
        <herbert@gondor.apana.org.au>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Subject: Suspend/Resume Broken on AM43/AM33 Platforms
Message-ID: <49fc7c64-88c0-74d0-2cb3-07986490941d@ti.com>
Date:   Mon, 19 Aug 2019 09:54:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen,

commit 03a3bb7ae63150230c5de645dc95e673ebf17e1a
Author: Stephen Boyd <swboyd@chromium.org>
Date:   Mon Aug 5 16:32:41 2019 -0700

     hwrng: core - Freeze khwrng thread during suspend

Commit seems to be breaking suspend/resume on TI AM43/AM33 platforms.


rtcwake: wakeup from "mem" using /dev/rtc0 at Sun Nov 18 02:12:12 2018
[   54.033833] PM: suspend entry (deep)
[   54.037741] Filesystems sync: 0.000 seconds
[   54.062730] Freezing user space processes ... (elapsed 0.001 seconds) 
done.
[   54.071313] OOM killer disabled.
[   54.074572] Freezing remaining freezable tasks ...
[   74.083121] Freezing of tasks failed after 20.003 seconds (1 tasks 
refusing to freeze, wq_busy=0):
[   74.092257] hwrng           R  running task        0   289      2 
0x00000020
[   74.099511] [<c08c64c4>] (__schedule) from [<c08c6a10>] 
(schedule+0x3c/0xc0)
[   74.106720] [<c08c6a10>] (schedule) from [<c05dbd8c>] 
(add_hwgenerator_randomness+0xb0/0x100)
[   74.115358] [<c05dbd8c>] (add_hwgenerator_randomness) from 
[<bf1803c8>] (hwrng_fillfn+0xc0/0x14c [rng_core])
[   74.125356] [<bf1803c8>] (hwrng_fillfn [rng_core]) from [<c015abec>] 
(kthread+0x134/0x148)
[   74.133764] [<c015abec>] (kthread) from [<c01010e8>] 
(ret_from_fork+0x14/0x2c)
[   74.141093] Exception stack(0xec611fb0 to 0xec611ff8)
[   74.146239] 1fa0:                                     00000000 
00000000 00000000 00000000
[   74.154478] 1fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   74.162764] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   74.169499] Restarting kernel threads ... done.
[   74.175628] OOM killer enabled.
[   74.178796] Restarting tasks ... done.
[   74.226769] PM: suspend exit
rtcwake: write error
1

One task refusing to freeze is the final error i am seeing.

- Keerthy
