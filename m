Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9786F11AB6D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 13:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbfLKM7d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 07:59:33 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40004 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfLKM7d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 07:59:33 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBCxTL8013499;
        Wed, 11 Dec 2019 06:59:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576069169;
        bh=baJMs1qT8nX731wdMO5cztekY1CtD2a4IS8Tibr9IWU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jIRkfM0D8Wi7aHqT70EJbYNWewSGyd6Oj3gPyQrpLU55opOf0x2/drJ1hOMW1oIEc
         JvKIgbWWFWoMk0Tlv7oXR21cHBiPsC02eEheewGntZd0wJdcUK6ThF+FV238dJaMj8
         faNtHgcoGVHlP5zByii7zBpZhXLzWf/oGOrG9csY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBCxTSX031447
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 06:59:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 06:59:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 06:59:24 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBCxMHq032710;
        Wed, 11 Dec 2019 06:59:23 -0600
Subject: Re: [PATCH 9/9] ARM: OMAP2+: Drop legacy platform data for dra7
 timers except timer1 to 4
To:     "Andrew F. Davis" <afd@ti.com>, Tony Lindgren <tony@atomide.com>,
        <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191210233524.46875-1-tony@atomide.com>
 <20191210233524.46875-10-tony@atomide.com>
 <84c0944d-0e75-4c1f-9220-bf4eb9396040@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <629f9571-d5d7-b85d-ff34-ef35f9fec821@ti.com>
Date:   Wed, 11 Dec 2019 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <84c0944d-0e75-4c1f-9220-bf4eb9396040@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/2019 04:10, Andrew F. Davis wrote:
> On 12/10/19 6:35 PM, Tony Lindgren wrote:
>> We can now probe devices with ti-sysc interconnect driver and dts
>> data. Let's drop the related platform data and custom ti,hwmods
>> dts property.
>>
>> As we're just dropping data, and the early platform data init
>> is based on the custom ti,hwmods property, we want to drop both
>> the platform data and ti,hwmods property in a single patch.
>>
>> Cc: Keerthy <j-keerthy@ti.com>
>> Cc: Tero Kristo <t-kristo@ti.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>   arch/arm/boot/dts/dra7-l4.dtsi            |  12 -
>>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 295 ----------------------
>>   2 files changed, 307 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
>> --- a/arch/arm/boot/dts/dra7-l4.dtsi
>> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
>> @@ -1233,7 +1233,6 @@ timer4: timer@0 {
>>   
>>   		target-module@3e000 {			/* 0x4803e000, ap 11 56.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer9";
>>   			reg = <0x3e000 0x4>,
>>   			      <0x3e010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -1842,7 +1841,6 @@ i2c5: i2c@0 {
>>   
>>   		target-module@86000 {			/* 0x48086000, ap 41 5e.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer10";
>>   			reg = <0x86000 0x4>,
>>   			      <0x86010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -1870,7 +1868,6 @@ timer10: timer@0 {
>>   
>>   		target-module@88000 {			/* 0x48088000, ap 43 66.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer11";
>>   			reg = <0x88000 0x4>,
>>   			      <0x88010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3357,7 +3354,6 @@ target-module@1e000 {			/* 0x4881e000, ap 93 2c.0 */
>>   
>>   		target-module@20000 {			/* 0x48820000, ap 5 08.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer5";
>>   			reg = <0x20000 0x4>,
>>   			      <0x20010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3385,7 +3381,6 @@ timer5: timer@0 {
>>   
>>   		target-module@22000 {			/* 0x48822000, ap 7 24.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer6";
>>   			reg = <0x22000 0x4>,
>>   			      <0x22010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3413,7 +3408,6 @@ timer6: timer@0 {
>>   
>>   		target-module@24000 {			/* 0x48824000, ap 9 26.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer7";
>>   			reg = <0x24000 0x4>,
>>   			      <0x24010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3441,7 +3435,6 @@ timer7: timer@0 {
>>   
>>   		target-module@26000 {			/* 0x48826000, ap 11 0c.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer8";
>>   			reg = <0x26000 0x4>,
>>   			      <0x26010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3469,7 +3462,6 @@ timer8: timer@0 {
>>   
>>   		target-module@28000 {			/* 0x48828000, ap 13 16.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer13";
>>   			reg = <0x28000 0x4>,
>>   			      <0x28010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3497,7 +3489,6 @@ timer13: timer@0 {
>>   
>>   		target-module@2a000 {			/* 0x4882a000, ap 15 10.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer14";
>>   			reg = <0x2a000 0x4>,
>>   			      <0x2a010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3525,7 +3516,6 @@ timer14: timer@0 {
>>   
>>   		target-module@2c000 {			/* 0x4882c000, ap 17 02.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer15";
>>   			reg = <0x2c000 0x4>,
>>   			      <0x2c010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -3553,7 +3543,6 @@ timer15: timer@0 {
>>   
>>   		target-module@2e000 {			/* 0x4882e000, ap 19 14.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer16";
>>   			reg = <0x2e000 0x4>,
>>   			      <0x2e010 0x4>;
>>   			reg-names = "rev", "sysc";
>> @@ -4453,7 +4442,6 @@ segment@20000 {					/* 0x4ae20000 */
>>   
>>   		target-module@0 {			/* 0x4ae20000, ap 19 08.0 */
>>   			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>> -			ti,hwmods = "timer12";
>>   			reg = <0x0 0x4>,
>>   			      <0x10 0x4>;
>>   			reg-names = "rev", "sysc";
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
>> --- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
>> @@ -1157,185 +1157,6 @@ static struct omap_hwmod dra7xx_timer4_hwmod = {
>>   	},
>>   };
>>   
>> -/* timer5 */
>> -static struct omap_hwmod dra7xx_timer5_hwmod = {
>> -	.name		= "timer5",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "ipu_clkdm",
>> -	.main_clk	= "timer5_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_IPU_TIMER5_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_IPU_TIMER5_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer6 */
>> -static struct omap_hwmod dra7xx_timer6_hwmod = {
>> -	.name		= "timer6",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "ipu_clkdm",
>> -	.main_clk	= "timer6_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_IPU_TIMER6_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_IPU_TIMER6_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer7 */
>> -static struct omap_hwmod dra7xx_timer7_hwmod = {
>> -	.name		= "timer7",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "ipu_clkdm",
>> -	.main_clk	= "timer7_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_IPU_TIMER7_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_IPU_TIMER7_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer8 */
>> -static struct omap_hwmod dra7xx_timer8_hwmod = {
>> -	.name		= "timer8",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "ipu_clkdm",
>> -	.main_clk	= "timer8_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_IPU_TIMER8_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_IPU_TIMER8_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer9 */
>> -static struct omap_hwmod dra7xx_timer9_hwmod = {
>> -	.name		= "timer9",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per_clkdm",
>> -	.main_clk	= "timer9_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER_TIMER9_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER_TIMER9_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer10 */
>> -static struct omap_hwmod dra7xx_timer10_hwmod = {
>> -	.name		= "timer10",
>> -	.class		= &dra7xx_timer_1ms_hwmod_class,
>> -	.clkdm_name	= "l4per_clkdm",
>> -	.main_clk	= "timer10_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER_TIMER10_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER_TIMER10_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer11 */
>> -static struct omap_hwmod dra7xx_timer11_hwmod = {
>> -	.name		= "timer11",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per_clkdm",
>> -	.main_clk	= "timer11_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER_TIMER11_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER_TIMER11_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer12 */
>> -static struct omap_hwmod dra7xx_timer12_hwmod = {
>> -	.name		= "timer12",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "wkupaon_clkdm",
>> -	.main_clk	= "secure_32k_clk_src_ck",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_WKUPAON_TIMER12_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_WKUPAON_TIMER12_CONTEXT_OFFSET,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer13 */
>> -static struct omap_hwmod dra7xx_timer13_hwmod = {
>> -	.name		= "timer13",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per3_clkdm",
>> -	.main_clk	= "timer13_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER3_TIMER13_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER3_TIMER13_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer14 */
>> -static struct omap_hwmod dra7xx_timer14_hwmod = {
>> -	.name		= "timer14",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per3_clkdm",
>> -	.main_clk	= "timer14_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER3_TIMER14_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER3_TIMER14_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer15 */
>> -static struct omap_hwmod dra7xx_timer15_hwmod = {
>> -	.name		= "timer15",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per3_clkdm",
>> -	.main_clk	= "timer15_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER3_TIMER15_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER3_TIMER15_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>> -/* timer16 */
>> -static struct omap_hwmod dra7xx_timer16_hwmod = {
>> -	.name		= "timer16",
>> -	.class		= &dra7xx_timer_hwmod_class,
>> -	.clkdm_name	= "l4per3_clkdm",
>> -	.main_clk	= "timer16_gfclk_mux",
>> -	.prcm = {
>> -		.omap4 = {
>> -			.clkctrl_offs = DRA7XX_CM_L4PER3_TIMER16_CLKCTRL_OFFSET,
>> -			.context_offs = DRA7XX_RM_L4PER3_TIMER16_CONTEXT_OFFSET,
>> -			.modulemode   = MODULEMODE_SWCTRL,
>> -		},
>> -	},
>> -};
>> -
>>   /*
>>    * 'usb_otg_ss' class
>>    *
>> @@ -1818,102 +1639,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per1__timer4 = {
>>   	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>>   };
>>   
>> -/* l4_per3 -> timer5 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer5 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer5_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer6 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer6 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer6_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer7 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer7 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer7_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer8 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer8 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer8_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per1 -> timer9 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per1__timer9 = {
>> -	.master		= &dra7xx_l4_per1_hwmod,
>> -	.slave		= &dra7xx_timer9_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per1 -> timer10 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per1__timer10 = {
>> -	.master		= &dra7xx_l4_per1_hwmod,
>> -	.slave		= &dra7xx_timer10_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per1 -> timer11 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per1__timer11 = {
>> -	.master		= &dra7xx_l4_per1_hwmod,
>> -	.slave		= &dra7xx_timer11_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_wkup -> timer12 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_wkup__timer12 = {
>> -	.master		= &dra7xx_l4_wkup_hwmod,
>> -	.slave		= &dra7xx_timer12_hwmod,
>> -	.clk		= "wkupaon_iclk_mux",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer13 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer13 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer13_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer14 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer14 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer14_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer15 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer15 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer15_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>> -/* l4_per3 -> timer16 */
>> -static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer16 = {
>> -	.master		= &dra7xx_l4_per3_hwmod,
>> -	.slave		= &dra7xx_timer16_hwmod,
>> -	.clk		= "l3_iclk_div",
>> -	.user		= OCP_USER_MPU | OCP_USER_SDMA,
>> -};
>> -
>>   /* l4_per3 -> usb_otg_ss1 */
>>   static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss1 = {
>>   	.master		= &dra7xx_l4_per3_hwmod,
>> @@ -2045,17 +1770,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
>>   	&dra7xx_l4_per1__timer2,
>>   	&dra7xx_l4_per1__timer3,
>>   	&dra7xx_l4_per1__timer4,
>> -	&dra7xx_l4_per3__timer5,
>> -	&dra7xx_l4_per3__timer6,
>> -	&dra7xx_l4_per3__timer7,
>> -	&dra7xx_l4_per3__timer8,
>> -	&dra7xx_l4_per1__timer9,
>> -	&dra7xx_l4_per1__timer10,
>> -	&dra7xx_l4_per1__timer11,
>> -	&dra7xx_l4_per3__timer13,
>> -	&dra7xx_l4_per3__timer14,
>> -	&dra7xx_l4_per3__timer15,
>> -	&dra7xx_l4_per3__timer16,
>>   	&dra7xx_l4_per3__usb_otg_ss1,
>>   	&dra7xx_l4_per3__usb_otg_ss2,
>>   	&dra7xx_l4_per3__usb_otg_ss3,
>> @@ -2069,12 +1783,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
>>   	NULL,
>>   };
>>   
>> -/* GP-only hwmod links */
>> -static struct omap_hwmod_ocp_if *dra7xx_gp_hwmod_ocp_ifs[] __initdata = {
>> -	&dra7xx_l4_wkup__timer12,
>> -	NULL,
>> -};
>> -
>>   /* SoC variant specific hwmod links */
>>   static struct omap_hwmod_ocp_if *dra76x_hwmod_ocp_ifs[] __initdata = {
>>   	&dra7xx_l4_per3__usb_otg_ss4,
>> @@ -2124,8 +1832,5 @@ int __init dra7xx_hwmod_init(void)
>>   		}
>>   	}
>>   
>> -	if (!ret && omap_type() == OMAP2_DEVICE_TYPE_GP)
>> -		ret = omap_hwmod_register_links(dra7xx_gp_hwmod_ocp_ifs);
>> -
> 
> 
> Maybe I'm missing it but how is this logic getting replicated when using
> ti,sync? We runtime detect here if we are on an HS device and if so let
> the secure world manage these device's pm/clocks, without this the
> non-secure side managment will be unconditional.

This is handled by the clkctrl driver itself. timer12 is marked as 
NON-SEC device supported only, so it doesn't get registered on HS chips.

I guess the lack of the clock fails the ti-sysc part of the registration 
logic also. Tony?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
