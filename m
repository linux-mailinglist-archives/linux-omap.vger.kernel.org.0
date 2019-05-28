Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C042BC9F
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 02:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbfE1A5t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 20:57:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41560 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfE1A5s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 20:57:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S0vaIZ053625;
        Mon, 27 May 2019 19:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559005056;
        bh=zRMKW7nfKzQUttL+l6kIY23L8G9PLHAu3G2E3yLzK9w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LbEtQnHBkkXhsGq4H7Y8vFkq6RBGBwqisP3lYPo3X6FUwuJTCzV8KBcMTmzdyBzXs
         1KR8l3+IGwVODOHJ+olCVDE7pLveRjt8P1yOAccRbFe7PuSn6cYaGLIKQ97Zq6JQ6/
         sKZiZqzefiZrEhq0nyEYRp38p6zsHl09aB2LNDeM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S0va0v065212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 May 2019 19:57:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 19:57:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 19:57:36 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S0vW9X049805;
        Mon, 27 May 2019 19:57:32 -0500
Subject: Re: [PATCH 00/12] ti-sysc driver changes to drop custom hwmods
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
References: <20190527121348.45251-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <380809b1-7152-faa5-9f43-2243fb4dad19@ti.com>
Date:   Tue, 28 May 2019 06:28:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527121348.45251-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/05/19 5:43 PM, Tony Lindgren wrote:
> Hi all,
> 
> Here are changes to improve ti-sysc driver to the point where we can
> finally drop the custom hwmods property for most cases. This series
> drops hwmods property only for omap4 UART and MMC as those can be
> tested with core retention idle.
> 
> I'll be posting more patches for dropping hwmods properties as they
> get tested.

Tony,

What is the base of this series? It does not apply cleanly neither on 
linux-next nor on top of 5.2->rc1. If there are dependencies do you have 
a branch?

- Keerthy
> 
> Regards,
> 
> Tony
> 
> 
> Tony Lindgren (12):
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
>   arch/arm/boot/dts/omap4-l4.dtsi       |   9 --
>   drivers/bus/ti-sysc.c                 | 182 ++++++++++++++++++++------
>   include/linux/platform_data/ti-sysc.h |   1 +
>   3 files changed, 140 insertions(+), 52 deletions(-)
> 
