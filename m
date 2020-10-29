Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9A629F497
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 20:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJ2TNQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 15:13:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59186 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgJ2TNO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Oct 2020 15:13:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TJDCOS087800;
        Thu, 29 Oct 2020 14:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603998792;
        bh=MWulX96LyQ3KCdWVQA6h3pHivPETvUS2jduTwMTqUl4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=I4BSt1ws65f9cqgBory4LbajENQx0JvcedX5ZQq6AxRi2m7yKiTYcGeKyF3TPiu4i
         jK+K2rNcyYAzJMcC78/hLCgaYoyE0JorAfMrr7Z8FM2PTJt4FPIKXN0/bqpy5X18q3
         DIM8VttqicaJ5OdxOVWwtPrYFkNel0K904Uk4IW0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TJDCpa007516
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Oct 2020 14:13:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 14:13:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 14:13:12 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TJDB1q091616;
        Thu, 29 Oct 2020 14:13:11 -0500
Subject: Re: [PATCH] ARM: dts: am437x-l4: fix compatible for cpsw switch dt
 node
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201001192023.6606-1-grygorii.strashko@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d6dea06f-76f5-a29e-d4e3-eb0e65f29e9d@ti.com>
Date:   Thu, 29 Oct 2020 21:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001192023.6606-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 01/10/2020 22:20, Grygorii Strashko wrote:
> Fix compatible the new CPSW switchdev DT node to avoid probing of legacy
> CPSW driver which fails:
> [    2.781009] cpsw 4a100000.switch: invalid resource
> 
> Fixes: 7bf8f37aea82 ("ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver")
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Hi Tony,
> 
> This is follow up patch for series [1], not critical.
> [1] https://lore.kernel.org/patchwork/cover/1304085/

Could this be merged?

> 
>   arch/arm/boot/dts/am437x-l4.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
> index d82a6eeaf1b3..3643e505e582 100644
> --- a/arch/arm/boot/dts/am437x-l4.dtsi
> +++ b/arch/arm/boot/dts/am437x-l4.dtsi
> @@ -522,7 +522,7 @@
>   			ranges = <0x0 0x100000 0x8000>;
>   
>   			mac_sw: switch@0 {
> -				compatible = "ti,am4372-cpsw","ti,cpsw-switch";
> +				compatible = "ti,am4372-cpsw-switch", "ti,cpsw-switch";
>   				reg = <0x0 0x4000>;
>   				ranges = <0 0 0x4000>;
>   				clocks = <&cpsw_125mhz_gclk>, <&dpll_clksel_mac_clk>;
> 

-- 
Best regards,
grygorii
