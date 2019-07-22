Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFE37024F
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 16:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfGVO1M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 10:27:12 -0400
Received: from vern.gendns.com ([98.142.107.122]:54158 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfGVO1M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jul 2019 10:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=N9hejvnZAfQBeh0OZAuEIUpYdTSdTbDoOQINf3NravM=; b=SSonHlkgPH5PG6+HDCCIpq1wsp
        z/zx2r/qCHqV2rhBdG/ISoxOJGc1ezJ6qLPRG02b58EDAN86QSf6xiiGO9wlfbIOw4OFxJgIJ7EED
        rXzJwgYmBx3FWM/rf9ANo5EPF/JrEYTRZjXTPm0HDM7/z3Lj2vq1wQhIlLeue7ZtfhU/DRcYCDOH5
        29HagoYXMAPtVSW8o9dkpMSzCk8XWKcs1N3a8Y8z3bK1twERaIVv5Ge1WOtVeISG2q8CmcJ2E75J6
        eI1Rfja57Vbjtsc0925CCKX9wsZY6fs4TBS/3/lYxOLC20p9RscfLV+9XKwaKu+UuT5o5TXg274uq
        oquP94Dg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:42538 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hpZHS-006bX9-7Q; Mon, 22 Jul 2019 10:27:10 -0400
Subject: Re: [PATCH 1/4] ARM: OMAP2+: Drop mmc platform data for am330x and
 am43xx
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190326181324.32140-1-tony@atomide.com>
 <20190326181324.32140-2-tony@atomide.com>
 <0af63198-5a68-2f0d-f14e-2b514580d2d5@lechnology.com>
 <20190722060951.GL5447@atomide.com> <20190722075411.GM5447@atomide.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <8427af44-2e28-7e13-3841-15c89d60f6dd@lechnology.com>
Date:   Mon, 22 Jul 2019 09:27:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722075411.GM5447@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/22/19 2:54 AM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [190722 06:10]:
>> * David Lechner <david@lechnology.com> [190721 02:43]:
>>> On 3/26/19 1:13 PM, Tony Lindgren wrote:
>>>> We can now drop legacy platform data one interconnect target module at
>>>> a time in favor of the device tree based data that has been added earlier.
>>>>
>>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>>> ---
>>>
>>> This breaks wifi on BeagleBone Blue (found via git bisect). In dmesg, I see:
>>>
>>>      platform 47810000.mmc: Cannot lookup hwmod 'mmc3'
>>
>> Thanks for letting me know and sorry for breaking it.
>>
>>> How can we fix it?
>>
>> The warning you pasted above hints that we're still trying to
>> probe mmc3 using platform data, and that data no longer exists.
>>
>> Looks like I've completely missed updating the dts file for
>> mmc3 that is directly on the l3 interconnect instead of l4 like
>> all the other mmc instances. The same applies for am4 too, and
>> I've also left some "ti,hwmods" properties around too..
>>
>> Care to try the following patch and see if it fixes the issue
>> for you?
> 
> Oh I just noticed this needs to be fixed in v5.2, not in v5.3-rc
> series. It's best to keep the "ti,hwmods" property still around
> as there may be dependencies to ti-sysc driver changes in v5.3-rc
> series for dropping it. Below is a more minimal fix to try.
> 
> Regards,
> 
> Tony
> 
> 8< -------------
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -234,13 +234,33 @@
>   			interrupt-names = "edma3_tcerrint";
>   		};
>   
> -		mmc3: mmc@47810000 {
> -			compatible = "ti,omap4-hsmmc";
> +		target-module@47810000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
>   			ti,hwmods = "mmc3";
> -			ti,needs-special-reset;
> -			interrupts = <29>;
> -			reg = <0x47810000 0x1000>;
> -			status = "disabled";
> +			reg = <0x478102fc 0x4>,
> +			      <0x47810110 0x4>,
> +			      <0x47810114 0x4>;
> +			reg-names = "rev", "sysc", "syss";
> +			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
> +					 SYSC_OMAP2_ENAWAKEUP |
> +					 SYSC_OMAP2_SOFTRESET |
> +					 SYSC_OMAP2_AUTOIDLE)>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,syss-mask = <1>;
> +			clocks = <&l3s_clkctrl AM3_L3S_MMC3_CLKCTRL 0>;
> +			clock-names = "fck";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x47810000 0x1000>;
> +
> +			mmc3: mmc@0 {
> +				compatible = "ti,omap4-hsmmc";
> +				ti,needs-special-reset;
> +				interrupts = <29>;
> +				reg = <0x0 0x1000>;
> +			};
>   		};
>   
>   		usb: usb@47400000 {
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -228,13 +228,33 @@
>   			interrupt-names = "edma3_tcerrint";
>   		};
>   
> -		mmc3: mmc@47810000 {
> -			compatible = "ti,omap4-hsmmc";
> -			reg = <0x47810000 0x1000>;
> +		target-module@47810000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
>   			ti,hwmods = "mmc3";
> -			ti,needs-special-reset;
> -			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> +			reg = <0x478102fc 0x4>,
> +			      <0x47810110 0x4>,
> +			      <0x47810114 0x4>;
> +			reg-names = "rev", "sysc", "syss";
> +			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
> +					 SYSC_OMAP2_ENAWAKEUP |
> +					 SYSC_OMAP2_SOFTRESET |
> +					 SYSC_OMAP2_AUTOIDLE)>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,syss-mask = <1>;
> +			clocks = <&l3s_clkctrl AM4_L3S_MMC3_CLKCTRL 0>;
> +			clock-names = "fck";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x47810000 0x1000>;
> +
> +			mmc3: mmc@0 {
> +				compatible = "ti,omap4-hsmmc";
> +				ti,needs-special-reset;
> +				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x1000>;
> +			};
>   		};
>   
>   		sham: sham@53100000 {
> 

This fixes wifi on BeagleBone Blue for me in v5.2.

Tested-by: David Lechner <david@lechnology.com>
