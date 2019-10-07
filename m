Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE6CDA0F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 03:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfJGBIc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 21:08:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34508 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfJGBIb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 21:08:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9718R9q040661;
        Sun, 6 Oct 2019 20:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570410507;
        bh=1/fpTrsGpZ3Bwnu1ecGMORsUGRgRwd7RTb3TGOpICG8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SCZR724tufS742O0322i/jjcUs0ViavNDGN2/oaE5jk2voAAR5q2NV88bsR0jO4PJ
         LAgXhLDSypthP+Cvu9t8Njd2wgI5sjQ54SMC/RPm/7rUu3yGbdKZqqIYZoiCrdZtMs
         O8trZa+IT9WvhUUBSFWnUbgfCvJNuMuIL956KbHQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9718RR5094154
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 6 Oct 2019 20:08:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 6 Oct
 2019 20:08:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 6 Oct 2019 20:08:25 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9718O1v049370;
        Sun, 6 Oct 2019 20:08:25 -0500
Subject: Re: [PATCH] ARM: OMAP2+: Add missing LCDC midlemode for am335x
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Suman Anna <s-anna@ti.com>
References: <20190924171543.345-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <f19f559d-6c7e-9db9-4fa7-84a8abd5558f@ti.com>
Date:   Mon, 7 Oct 2019 06:38:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924171543.345-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 24/09/19 10:45 PM, Tony Lindgren wrote:
> TRM "Table 13-34. SYSCONFIG Register Field Descriptions" lists both
> standbymode and idlemode that should be just the sidle and midle
> registers where midle is currently unconfigured for lcdc_sysc. As
> the dts data has been generated based on lcdc_sysc, we now have an
> empty "ti,sysc-midle" property.
> 
> And so we currently get a warning for lcdc because of a difference
> with dts provided configuration compared to the legacy platform
> data. This is because lcdc has SYSC_HAS_MIDLEMODE configured in
> the platform data without configuring the modes.
> 
> Let's fix the issue by adding the missing midlemode to lcdc_sysc,
> and configuring the "ti,sysc-midle" property based on the TRM
> values.

Tested for DS0 and rtc+ddr modes on am43 and ds0 on am33.

Tested-by: Keerthy <j-keerthy@ti.com>

> 
> Fixes: f711c575cfec ("ARM: dts: am335x: Add l4 interconnect hierarchy and ti-sysc data")
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/boot/dts/am33xx-l4.dtsi           | 4 +++-
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 5 +++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -2038,7 +2038,9 @@
>   			reg = <0xe000 0x4>,
>   			      <0xe054 0x4>;
>   			reg-names = "rev", "sysc";
> -			ti,sysc-midle ;
> +			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
>   			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>   					<SYSC_IDLE_NO>,
>   					<SYSC_IDLE_SMART>;
> diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> @@ -231,8 +231,9 @@ static struct omap_hwmod am33xx_control_hwmod = {
>   static struct omap_hwmod_class_sysconfig lcdc_sysc = {
>   	.rev_offs	= 0x0,
>   	.sysc_offs	= 0x54,
> -	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
> -	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
> +	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE,
> +	.idlemodes	= SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
> +			  MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART,
>   	.sysc_fields	= &omap_hwmod_sysc_type2,
>   };
>   
> 
