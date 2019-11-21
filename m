Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196BE105112
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 12:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKULH3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 06:07:29 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39150 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfKULH3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Nov 2019 06:07:29 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALB7LBG043683;
        Thu, 21 Nov 2019 05:07:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574334441;
        bh=gzB4/LlAd/cjajkp4WzCcmuttJEpkCwH3rgIB0EX1Eg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uhsXVbWvsCWpNXgbUdM3G8AODHOI0gu2LjjDROioDK8D67pqsiXXmPAZFnkUesyFg
         geaLjCkxlsPUfz75DrTADmietNW8zufAUPWh1JDy1fU3uqa3jBLtT4ZGrVEeBLyxpl
         3NSvKjdLNmF3QrvH9WmCCiZY/dEUWX3jFmJV1grA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xALB7Lre045244
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 Nov 2019 05:07:21 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 21
 Nov 2019 05:07:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 21 Nov 2019 05:07:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xALB7G3X120060;
        Thu, 21 Nov 2019 05:07:17 -0600
Subject: Re: [PATCH v2] ARM: dts: am5729: beaglebone-ai: adding device tree
To:     Caleb Robey <c-robey@ti.com>, <linux-omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191120220559.18914-1-c-robey@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <41c73bc1-99ae-6797-5bb7-7acc0f6518c0@ti.com>
Date:   Thu, 21 Nov 2019 13:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120220559.18914-1-c-robey@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 21/11/2019 00:05, Caleb Robey wrote:
> From: Jason Kridner <jdk@ti.com>
> 
> BeagleBoard.org BeagleBone AI is an open source hardware single
> board computer based on the Texas Instruments AM5729 SoC featuring
> dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
> signal processor (DSP), quad-core embedded vision engine (EVE),
> Arm Cortex-M4 processors, dual programmable realtime unit
> industrial control subsystems and more. The board features 1GB
> DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
> 1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
> headers.
> 
> For more information, refer to:
> https://beaglebone.ai
> 
> This patch introduces the BeagleBone AI device tree.
> 
> Note that the device use the "ti,tpd12s016" component which is
> software compatible with "ti,tpd12s015". Thus we only use the
> latter driver.

Ah. thanks. I see my comments resolved here.
no more comments to net part from my side.

> 
> Signed-off-by: Jason Kridner <jdk@ti.com>
> Signed-off-by: Caleb Robey <c-robey@ti.com>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> 
> 
> ---
> 
> V2 Changes:
>    - dra7.dtsi was reintroduced and components that are only
>      not present in upstream linux dts were removed.
> 
>   arch/arm/boot/dts/Makefile                |   1 +
>   arch/arm/boot/dts/am5729-beagleboneai.dts | 731 ++++++++++++++++++++++
>   arch/arm/boot/dts/dra7.dtsi               |   2 +-
>   3 files changed, 733 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts
> 

[..]

-- 
Best regards,
grygorii
