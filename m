Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580258F11A
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 18:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfHOQoL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 12:44:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57598 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbfHOQoL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 12:44:11 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7FGi7wb041029;
        Thu, 15 Aug 2019 11:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565887447;
        bh=Q2LA4WgXXnzLDlIwPubU7pcCUDBXSzcN38GFsB1+k1w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GUQqCzupypXXC+OdNDlNjDhBaKiYZIxInu1qN8TY//Mbny+wNpFiiPWmVhfU0ztJg
         y1eLf/u0YwQC9RUaS9WVwgaFug47HsHxO4Cm6f9L7da0ku+OXMvy9QC7Gcxj+C1VkM
         kaRbCpldKaGXcT9q8rOJe8yRlyPJpEVdhpRTj2j4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7FGi7Jk062908
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Aug 2019 11:44:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 15
 Aug 2019 11:44:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 15 Aug 2019 11:44:06 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7FGi45E113579;
        Thu, 15 Aug 2019 11:44:05 -0500
Subject: Re: [PATCH 0/3] Drop platform data for cpsw for am3/4 and dra7
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Keerthy <j-keerthy@ti.com>
References: <20190814101949.50006-1-tony@atomide.com>
From:   grygorii <grygorii.strashko@ti.com>
Message-ID: <a4467e6c-88f3-eac8-322a-c0e40360ba36@ti.com>
Date:   Thu, 15 Aug 2019 19:44:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814101949.50006-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 14/08/2019 13:19, Tony Lindgren wrote:
> Hi all,
> 
> Here are changes to drop legacy platform data for cpsw for am3, am4
> and dra7. Please review and test, I was not able to boot my beagle
> x15 as it seems to have a power supply problem and have only tested
> on am3 and 4.


Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> 
> Tony Lindgren (3):
>    ARM: dts: Add fck for cpsw mdio for omap variants
>    ARM: OMAP2+: Drop legacy platform data for cpsw on am3 and am4
>    ARM: OMAP2+: Drop legacy platform data for cpsw on dra7
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi              |  4 +-
>   arch/arm/boot/dts/am437x-l4.dtsi              |  6 +-
>   arch/arm/boot/dts/dra7-l4.dtsi                |  4 +-
>   .../omap_hwmod_33xx_43xx_common_data.h        |  3 -
>   .../omap_hwmod_33xx_43xx_interconnect_data.c  |  6 --
>   .../omap_hwmod_33xx_43xx_ipblock_data.c       | 50 --------------
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  9 ---
>   arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  9 ---
>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 65 -------------------
>   9 files changed, 6 insertions(+), 150 deletions(-)
> 

-- 
Best regards,
grygorii
