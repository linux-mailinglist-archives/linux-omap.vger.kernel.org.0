Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D772C0C0
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 10:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE1IBj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 04:01:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50796 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1IBi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 04:01:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S81Qie048278;
        Tue, 28 May 2019 03:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559030486;
        bh=aitQvQ8mJN5/QEKKXw77CNQIyj8FxmH4Q6Rk0NNv7Y0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cSFw7XtBGEtL7PubqwFuThoJD1pxhWO19jSTEg7a8aikMaG5zxJwgbCNJ351rms2h
         13odvuFWuNgCoBrZ49ocJ5UUUaKwFtc8+EQamjTaqlbR/oTpoe+yVKKK46/oVAOmqf
         /zfT6w9lOokUVlBX3absWSJpPcDQfngjozOQdDcg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S81Q76068834
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 03:01:26 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:01:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:01:25 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S81Lh6085829;
        Tue, 28 May 2019 03:01:22 -0500
Subject: Re: [PATCHv2 00/13] ti-sysc driver changes to drop custom hwmods
 property
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20190528062414.27192-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <0ba540b0-ad04-ee56-5874-69921eb4f374@ti.com>
Date:   Tue, 28 May 2019 13:32:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/05/19 11:54 AM, Tony Lindgren wrote:
> Hi all,
> 
> Here are changes to improve ti-sysc driver to the point where we can
> finally drop the custom hwmods property for most cases. This series
> drops hwmods property only for omap4 UART and MMC as those can be
> tested with core retention idle.
> 
> I'll be posting more patches for dropping hwmods properties as they
> get tested.


Added missing dra71/76 patches on linux-next which get them to boot.

Tested for boot on dra71/76.
Tested for DS0 on AM43/33.
Tested for RTC+DDR mode on am43.

For the series:

Tested-by: Keerthy <j-keerthy@ti.com>

> 
> Regards,
> 
> Tony
> 
> Changes since v1:
> 
> - Repost the series against v5.2-rc1 as the first patch in the series
>    got accidentally left out for patch "bus: ti-sysc: Add support for
>    missing clockdomain handling"
> 
> 
> Tony Lindgren (13):
>    bus: ti-sysc: Add support for missing clockdomain handling
>    bus: ti-sysc: Support 16-bit writes too
>    bus: ti-sysc: Make OCP reset work for sysstatus and sysconfig reset
>      bits
>    bus: ti-sysc: Allow QUIRK_LEGACY_IDLE even if legacy_mode is not set
>    bus: ti-sysc: Enable interconnect target module autoidle bit on enable
>    bus: ti-sysc: Handle clockactivity for enable and disable
>    bus: ti-sysc: Handle swsup idle mode quirks
>    bus: ti-sysc: Set ENAWAKEUP if available
>    bus: ti-sysc: Add support for disabling module without legacy mode
>    bus: ti-sysc: Do rstctrl reset handling in two phases
>    bus: ti-sysc: Detect uarts also on omap34xx
>    ARM: dts: Drop legacy custom hwmods property for omap4 uart
>    ARM: dts: Drop legacy custom hwmods property for omap4 mmc
> 
>   arch/arm/boot/dts/omap4-l4.dtsi       |   9 -
>   arch/arm/mach-omap2/omap_hwmod.c      |  39 +---
>   arch/arm/mach-omap2/pdata-quirks.c    |  60 +++++
>   drivers/bus/ti-sysc.c                 | 309 ++++++++++++++++++++------
>   include/linux/platform_data/ti-sysc.h |   9 +
>   5 files changed, 314 insertions(+), 112 deletions(-)
> 
