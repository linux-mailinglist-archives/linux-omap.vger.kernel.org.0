Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922A111C762
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 09:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfLLIUz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 03:20:55 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47446 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfLLIUz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 03:20:55 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBC8Kprb023006;
        Thu, 12 Dec 2019 02:20:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576138851;
        bh=33I+YRUN+uTwVv34vV0d1i8PmOoRNsnOYVc7dbqAE+o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hOWlmL61LB8AyASvTiFJD+53kpPPVDfvteN4jhU5sBWEUsYBIh+/dkmcI43XUw/Zh
         5bfS7KJ0sqcIuVGMh/UHFtfG1dSQWh3HlOyA6rrrGnIgwDpJsE2gvdBnWDQpT/TPph
         sAFJvTuaIk4w4SgtnX273Pw9bSpZ0EcvHtHae9Qw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBC8Kpk2054596
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 02:20:51 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 02:20:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 02:20:50 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBC8KmcJ085796;
        Thu, 12 Dec 2019 02:20:48 -0600
Subject: Re: [PATCH 00/14] Probe am3, am4 and dra7 crypto accelerators with
 ti-sysc
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, Keerthy <j-keerthy@ti.com>
References: <20191210231722.44215-1-tony@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <823e559b-8ef4-b6b7-df63-aaefca16a0ab@ti.com>
Date:   Thu, 12 Dec 2019 10:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210231722.44215-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/2019 01:17, Tony Lindgren wrote:
> Hi,
> 
> This series updates crypto accelerators to probe with ti-sysc and device tree
> data for am3, am4 and dra7.
> 
> Regards,
> 
> Tony

Gave this a shot on top of 5.5-rc1 + the crypto fixes series on 
am57xx-beagle-x15, using both tcrypt.ko and crypto manager self tests. 
Appears to be working. Also, looked at the patches and they seem fine, 
so for the whole series:

Tested-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Tero Kristo <t-kristo@ti.com>

> 
> 
> Tony Lindgren (14):
>    ARM: dts: Configure interconnect target module for am3 sham
>    ARM: dts: Configure interconnect target module for am4 sham
>    ARM: dts: Configure interconnect target module for dra7 sham
>    ARM: dts: Configure interconnect target module for am3 aes
>    ARM: dts: Configure interconnect target module for am4 aes
>    ARM: dts: Configure interconnect target module for dra7 aes
>    ARM: dts: Configure interconnect target module for am4 des
>    ARM: dts: Configure interconnect target module for dra7 des
>    ARM: OMAP2+: Drop legacy platform data for am3 and am4 sham
>    ARM: OMAP2+: Drop legacy platform data for dra7 sham
>    ARM: OMAP2+: Drop legacy platform data for am3 and am4 aes
>    ARM: OMAP2+: Drop legacy platform data for dra7 aes
>    ARM: OMAP2+: Drop legacy platform data for am4 des
>    ARM: OMAP2+: Drop legacy platform data for dra7 des
> 
>   arch/arm/boot/dts/am33xx.dtsi                 |  69 +++++++--
>   arch/arm/boot/dts/am4372.dtsi                 | 105 +++++++++++---
>   arch/arm/boot/dts/dra7-l4.dtsi                |  31 ++++
>   arch/arm/boot/dts/dra7.dtsi                   | 118 +++++++++++-----
>   .../omap_hwmod_33xx_43xx_common_data.h        |   4 -
>   .../omap_hwmod_33xx_43xx_interconnect_data.c  |  16 ---
>   .../omap_hwmod_33xx_43xx_ipblock_data.c       |  54 -------
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   2 -
>   arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  35 -----
>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 132 ------------------
>   10 files changed, 250 insertions(+), 316 deletions(-)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
