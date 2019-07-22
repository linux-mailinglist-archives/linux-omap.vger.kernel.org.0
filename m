Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE48702B7
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 16:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfGVOyh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 10:54:37 -0400
Received: from vern.gendns.com ([98.142.107.122]:59716 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfGVOyg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jul 2019 10:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nz8dHwi/O19yU/lpQNgp09FmVeUTnj838TwPzVM6vvk=; b=EQnChSqsRnexQ13pmzKu6btmLm
        7GjoOVrbd7IwmQdeB9BM/5lSDmYU+CYrL7SLLiqlDFAqTkTIpd+MmkshXAZ2UGcrtLDxdHRzubXwR
        C63IvN3lKS/uLE/NFFonwYg/p0lA/qlqZVURVvHOcv46OKj0cU+9lsaXxagvarzqKTfEmHY8zji+N
        X17XYoBokZ3Odz7eLGTIC3ZomXX6T2wkWfoM0Jc/H2ycGtJWNlofuzzTknzx3yt07JzwcIGPAOQoD
        RpiZ4iWStFOBSnBzYntVaZWJO3KVbjSo1wNmf2KveenswYo3q3amLo7YK2DMteaErzXgXj6Ft5jQN
        6Yr/8Dfg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:43328 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hpZhx-006fgA-MQ; Mon, 22 Jul 2019 10:54:33 -0400
Subject: Re: [PATCH 1/4] ARM: OMAP2+: Drop mmc platform data for am330x and
 am43xx
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190326181324.32140-1-tony@atomide.com>
 <20190326181324.32140-2-tony@atomide.com>
 <0af63198-5a68-2f0d-f14e-2b514580d2d5@lechnology.com>
 <20190722060951.GL5447@atomide.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <d66357e0-62e1-6132-00a1-a9c48ca3e481@lechnology.com>
Date:   Mon, 22 Jul 2019 09:54:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722060951.GL5447@atomide.com>
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

On 7/22/19 1:09 AM, Tony Lindgren wrote:
> Hi,
> 
> * David Lechner <david@lechnology.com> [190721 02:43]:
>> On 3/26/19 1:13 PM, Tony Lindgren wrote:
>>> We can now drop legacy platform data one interconnect target module at
>>> a time in favor of the device tree based data that has been added earlier.
>>>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>
>> This breaks wifi on BeagleBone Blue (found via git bisect). In dmesg, I see:
>>
>>      platform 47810000.mmc: Cannot lookup hwmod 'mmc3'
> 
> Thanks for letting me know and sorry for breaking it.
> 
>> How can we fix it?
> 
> The warning you pasted above hints that we're still trying to
> probe mmc3 using platform data, and that data no longer exists.
> 
> Looks like I've completely missed updating the dts file for
> mmc3 that is directly on the l3 interconnect instead of l4 like
> all the other mmc instances. The same applies for am4 too, and
> I've also left some "ti,hwmods" properties around too..
> 
> Care to try the following patch and see if it fixes the issue
> for you?
> 
> I've only boot tested on bbb and am437x-idk and made sure
> the mmc instance probes. But my beaglebone blue lost it's
> serial connector and pads so I have not been testing on it.
> 
> Regards,
> 
> Tony
> 
> 8< ----------
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -1312,7 +1312,6 @@
>   
>   		target-module@60000 {			/* 0x48060000, ap 36 0c.0 */
>   			compatible = "ti,sysc-omap2", "ti,sysc";
> -			ti,hwmods = "mmc1";
>   			reg = <0x602fc 0x4>,
>   			      <0x60110 0x4>,
>   			      <0x60114 0x4>;
> @@ -1802,7 +1801,6 @@
>   
>   		target-module@d8000 {			/* 0x481d8000, ap 64 66.0 */
>   			compatible = "ti,sysc-omap2", "ti,sysc";
> -			ti,hwmods = "mmc2";
>   			reg = <0xd82fc 0x4>,
>   			      <0xd8110 0x4>,
>   			      <0xd8114 0x4>;
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -234,13 +234,32 @@
>   			interrupt-names = "edma3_tcerrint";
>   		};
>   
> -		mmc3: mmc@47810000 {
> -			compatible = "ti,omap4-hsmmc";
> -			ti,hwmods = "mmc3";
> -			ti,needs-special-reset;
> -			interrupts = <29>;
> -			reg = <0x47810000 0x1000>;
> -			status = "disabled";
> +		target-module@47810000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
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
> @@ -228,13 +228,32 @@
>   			interrupt-names = "edma3_tcerrint";
>   		};
>   
> -		mmc3: mmc@47810000 {
> -			compatible = "ti,omap4-hsmmc";
> -			reg = <0x47810000 0x1000>;
> -			ti,hwmods = "mmc3";
> -			ti,needs-special-reset;
> -			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
> +		target-module@47810000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
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
> diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
> --- a/arch/arm/boot/dts/am437x-l4.dtsi
> +++ b/arch/arm/boot/dts/am437x-l4.dtsi
> @@ -1085,7 +1085,6 @@
>   
>   		target-module@60000 {			/* 0x48060000, ap 30 14.0 */
>   			compatible = "ti,sysc-omap2", "ti,sysc";
> -			ti,hwmods = "mmc1";
>   			reg = <0x602fc 0x4>,
>   			      <0x60110 0x4>,
>   			      <0x60114 0x4>;
> @@ -1612,7 +1611,6 @@
>   
>   		target-module@d8000 {			/* 0x481d8000, ap 54 5e.0 */
>   			compatible = "ti,sysc-omap2", "ti,sysc";
> -			ti,hwmods = "mmc2";
>   			reg = <0xd82fc 0x4>,
>   			      <0xd8110 0x4>,
>   			      <0xd8114 0x4>;
> 

Not sure if this is related, but this is what I get on v5.3-rc1
with this patch (wifi still not working, obviously):

[   21.952767] wlcore: wl18xx HW: 183x or 180x, PG 2.2 (ROM 0x11)
[   22.011340] ------------[ cut here ]------------
[   22.016402] WARNING: CPU: 0 PID: 65 at /home/david/work/ev3dev2/ev3dev-kernel/net/wireless/core.c:868 wiphy_register+0x860/0xba0 [cfg80211]
[   22.029148] Modules linked in: wl18xx wlcore mac80211 libarc4 sha256_generic usb_f_mass_storage usb_f_acm u_serial usb_f_ecm sha256_arm cfg80211 usb_f_rndis u_ether evdev musb_dsps musb_hdrc libcomposite udc_core phy_am335x phy_generic cppi41 usbcore usb_common phy_am335x_control ti_am335x_adc kfifo_buf pm33xx ti_emif_sram hci_uart btbcm omap_rng rng_core ti_eqep_cnt counter bluetooth ecdh_generic bmp280_spi ecc bmp280_i2c bmp280 omap_mailbox industrialio c_can_platform c_can wlcore_sdio can_dev tps65218_pwrbutton rtc_omap wkup_m3_ipc wkup_m3_rproc remoteproc virtio musb_am335x virtio_ring at24 omap_wdt watchdog ti_am335x_tscadc leds_gpio led_class cpufreq_dt pwm_tiehrpwm autofs4
[   22.089844] CPU: 0 PID: 65 Comm: kworker/0:3 Not tainted 5.3.0-rc1-00001-gea45fc3153f2-dirty #78
[   22.098670] Hardware name: Generic AM33XX (Flattened Device Tree)
[   22.104818] Workqueue: events request_firmware_work_func
[   22.110187] [<c01121ac>] (unwind_backtrace) from [<c010c974>] (show_stack+0x10/0x14)
[   22.117974] [<c010c974>] (show_stack) from [<c08ae4e0>] (dump_stack+0xb4/0xd0)
[   22.125243] [<c08ae4e0>] (dump_stack) from [<c0139b3c>] (__warn+0xe4/0x110)
[   22.132244] [<c0139b3c>] (__warn) from [<c0139c80>] (warn_slowpath_null+0x3c/0x48)
[   22.140075] [<c0139c80>] (warn_slowpath_null) from [<bf254560>] (wiphy_register+0x860/0xba0 [cfg80211])
[   22.150094] [<bf254560>] (wiphy_register [cfg80211]) from [<bf2e4eb4>] (ieee80211_register_hw+0x4d4/0xb9c [mac80211])
[   22.161089] [<bf2e4eb4>] (ieee80211_register_hw [mac80211]) from [<bf1c8778>] (wlcore_nvs_cb+0x81c/0xae8 [wlcore])
[   22.171553] [<bf1c8778>] (wlcore_nvs_cb [wlcore]) from [<00000000>] (0x0)
[   22.178560] ---[ end trace ae64a3cf8494a74b ]---
[   22.183273] wlcore: ERROR unable to register mac80211 hw: -22
