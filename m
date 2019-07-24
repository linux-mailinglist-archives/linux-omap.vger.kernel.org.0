Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF2972796
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 07:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfGXFvt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 01:51:49 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57028 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXFvt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 01:51:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6O5pht6095860;
        Wed, 24 Jul 2019 00:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563947503;
        bh=/ukI6z7MwTgGEJKQ7FloIKRXPBiEaTOaKdMkfX0Lm6c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=m4UD7L77PYQorEIAvyPJXNXpMcdziaU0iCvOD5nB0J7WeSorpyHJ0hPoQ5Izkuy41
         8rC5e+CxYsvXn61rik6QU+PHVOY/kTTaPoJw91Kz/OPSsvVb2sUNgy+/WXwfuwp6FS
         irwpJYjRBGts224etehfvcSvo4Me7NT5Yv4U8KfU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6O5phYB048370
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 00:51:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 00:51:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 00:51:42 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6O5pcdZ000559;
        Wed, 24 Jul 2019 00:51:39 -0500
Subject: Re: [PATCH 0/8] ti-sysc related warning fixes for v5.3-rc cycle
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <84de9487-761f-2f66-0227-97615e240477@ti.com>
Date:   Wed, 24 Jul 2019 11:22:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723112811.44381-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/07/19 4:58 PM, Tony Lindgren wrote:
> Hi all,
> 
> I noticed that with recent ti-sysc driver changes some new warnings
> have crept in. Mostly they are caused by having different configuration
> in the dts compared to the legacy platform data. Let's fix these first
> before we continue dropping the legacy platform data.
> 
> I also noticed we need two fixes for the ti-sysc driver while looking
> at the warnings.

Tony,

Apart from Patch 2(breaks DS0 on AM3). Rest all work fine.

Tested for DS0/RTC+ddr on AM4, DS0 on AM3 Boneblack.

You can add my:

Tested-by: Keerthy <j-keerthy@ti.com>

For all the 7 patches except Patch 2.

Regards,
Keerthy

> 
> Regards,
> 
> Tony
> 
> Tony Lindgren (8):
>    ARM: OMAP2+: Fix missing SYSC_HAS_RESET_STATUS for dra7 epwmss
>    ARM: OMAP2+: Remove unconfigured midlemode for am3 lcdc
>    bus: ti-sysc: Fix handling of forced idle
>    bus: ti-sysc: Fix using configured sysc mask value
>    ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3 to 8
>    ARM: dts: Fix flags for gpio7
>    ARM: dts: Fix incorrect dcan register mapping for am3, am4 and dra7
>    ARM: dts: Fix lcdc sysc flags for am3
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi              |  6 +++-
>   arch/arm/boot/dts/am437x-l4.dtsi              |  4 +++
>   .../boot/dts/am57xx-beagle-x15-common.dtsi    |  2 +-
>   arch/arm/boot/dts/dra7-evm.dts                |  2 +-
>   arch/arm/boot/dts/dra7-l4.dtsi                | 31 ++++++++-----------
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  2 +-
>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c     |  3 +-
>   drivers/bus/ti-sysc.c                         | 10 +++---
>   8 files changed, 31 insertions(+), 29 deletions(-)
> 
