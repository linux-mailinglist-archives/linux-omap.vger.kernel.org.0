Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E26DBC0B
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 06:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441924AbfJREyd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 00:54:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41932 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfJREyc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 00:54:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9I4sNWM028876;
        Thu, 17 Oct 2019 23:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571374463;
        bh=ELJ7+0SBAGHSoJd2lHhMcS3p9GmsFM+eF5H5GeEM8xA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Xdht7JxDnd4IsSGWTfI7BdBe/MhTWXJP/ihAv7l+jgWJhx8hDNZsCL4BI7IGyhWUP
         gc0qD442G+5RbalhXi91nvX16/EfNGkdrp5FjEN8xpres8yLz4KvocOBx97KcG6Qpb
         XBfTjDEKbxfMsqgu1mbafqo9QijhOicNgbmL6Aok=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9I4sN7W038806
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 23:54:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 23:54:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 23:54:14 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9I4sKGd051205;
        Thu, 17 Oct 2019 23:54:21 -0500
Subject: Re: [PATCH 00/21] Drop more legacy platform data for omaps
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
References: <20191017194411.18258-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <291b705f-cfe7-9d22-16c0-90d269cfa799@ti.com>
Date:   Fri, 18 Oct 2019 10:24:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/10/19 1:13 AM, Tony Lindgren wrote:
> Hi all,
> 
> Here's a series of changes to remove more legacy platform data and
> ti,hwmods devitree property for omap variants.
> 
> The patches are against v5.4-rc1, but please note that the watchdog
> changes depend on the following patch:
> 
> [PATCH] bus: ti-sysc: Fix watchdog quirk handling

Tested with the above on AM33/AM43 for DS0. All working fine
however this series needs a re base on top of 5.4-rc3 as the patches are 
not applying cleanly.

Also rc1 does not have the remoteproc config fix patch so i added that 
remoteproc config fix patch on top.

FWIW

Tested-by: Keerthy <j-keerthy@ti.com>

> 
> Regards,
> 
> Tony
> 
> 
> Tony Lindgren (21):
>    ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpio
>    ARM: dts: Drop custom hwmod property for omap4 gpio
>    ARM: dts: Drop custom hwmod property for omap5 gpio
>    ARM: OMAP2+: Drop legacy platform data for dra7 mailbox
>    ARM: OMAP2+: Drop legacy platform data for am3 and am4 mailbox
>    ARM: OMAP2+: Drop legacy platform data for omap4 mailbox
>    ARM: OMAP2+: Drop legacy platform data for omap5 mailbox
>    ARM: dts: Drop custom hwmod property for omap5 mcspi
>    ARM: OMAP2+: Drop legacy platform data for omap5 mcspi
>    ARM: dts: Drop custom hwmod property for am33xx uart
>    ARM: dts: Drop custom hwmod property for am4 uart
>    ARM: dts: Drop custom hwmod property for omap5 uart
>    ARM: dts: Drop custom hwmod property for am3 i2c
>    ARM: dts: Drop custom hwmod property for am4 i2c
>    ARM: dts: Drop custom hwmod property for omap5 i2c
>    ARM: dts: Drop custom hwmod property for am3 mmc
>    ARM: dts: Drop custom hwmod property for am4 mmc
>    ARM: dts: Drop custom hwmod property for omap5 mmc
>    ARM: OMAP2+: Drop legacy platform data for am3 and am4 wdt
>    ARM: OMAP2+: Drop legacy platform data for dra7 wdt
>    ARM: OMAP2+: Drop legacy platform data for omap5 wdt
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi              |  17 -
>   arch/arm/boot/dts/am33xx.dtsi                 |   1 -
>   arch/arm/boot/dts/am4372.dtsi                 |   1 -
>   arch/arm/boot/dts/am437x-l4.dtsi              |  19 -
>   arch/arm/boot/dts/dra7-l4.dtsi                |  14 -
>   arch/arm/boot/dts/omap4-l4.dtsi               |  11 -
>   arch/arm/boot/dts/omap5-l4.dtsi               |  30 --
>   .../omap_hwmod_33xx_43xx_common_data.h        |   3 -
>   .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 -
>   .../omap_hwmod_33xx_43xx_ipblock_data.c       | 157 --------
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  11 -
>   arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |   9 -
>   arch/arm/mach-omap2/omap_hwmod_44xx_data.c    |  41 --
>   arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 204 ----------
>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 352 ------------------
>   15 files changed, 878 deletions(-)
> 
