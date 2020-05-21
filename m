Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990401DCFF4
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 16:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbgEUOfK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 10:35:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33032 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbgEUOfK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 10:35:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LEZ3vo125705;
        Thu, 21 May 2020 09:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590071703;
        bh=cNjaQ9fXx/uUqYhSW8L/0cq+/RkAn17do/znBW1C7Bc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IngPvfQqk55+7bJe9Zom5oXOLr8G3ITt9bH8rZTsJ4dsDcSzZNP2MZxB9GISdoBHd
         23UrC1LdaW/KYmch2e55aCp7fFW5rwj5HzeCj57jfc99EtNJIPKld28MitR+h8rJsD
         1uR6K53NuPksB8BhzimqCK/SMa7x0luH0b//yhOU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04LEZ3rO109304
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 May 2020 09:35:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 09:35:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 09:35:02 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LEYx2o082791;
        Thu, 21 May 2020 09:35:00 -0500
Subject: Re: [PATCH v2] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
References: <20200520214757.GA362547@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <71dbf4e6-e65b-f001-319c-0b354f675568@ti.com>
Date:   Thu, 21 May 2020 17:34:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520214757.GA362547@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 21/05/2020 00:47, Drew Fustini wrote:
> Add gpio-line-names properties to the GPIO controller nodes.
> 
> BeagleBone boards have P8 and P9 headers [0] which expose many of the
> AM3358 ZCZ SoC balls to stacking expansion boards called "capes", or to
> other external connections like jumper wires connected to a breadboard.
> BeagleBone users will often refer to the "Cape Exanpsion Headers" pin
> diagram [1] as it is in the "Bone101" getting started tutorial. [2]
> 
> Most of the P8 and P9 header pins can muxed to a GPIO line.  The
> gpio-line-names describe which P8 or P9 pin that line goes to and the
> default mux for that P8 or P9 pin if it is not GPIO.
> 
> For example, gpiochip 1 line 0 is connected to P8 header pin 25 (P8_25)
> however the default device tree has the corresponding BGA ball (ZCZ U7)
> muxed to mmc1_dat0 as it is used for the on-board eMMC chip.  For that
> GPIO line to be used, one would need to modify the device tree to
> disable the eMMC and change the pin mux for that ball to GPIO mode.
> 
> Some of the AM3358 ZCZ balls corresponding to GPIO lines are not routed
> to a P8 or P9 header, but are instead wired to some peripheral device
> like on-board eMMC, HDMI framer IC, or status LEDs.  Those names are in
> brackets to denote those GPIO lines can not be used.
> 
> Some GPIO lines are named "[NC]" as the corresponding balls are not
> routed to anything on the PCB.
> 
> The goal for these names is to make it easier for a user viewing the
> output of gpioinfo to determine which P8 or P9 pin is connected to a
> GPIO line.  The output of gpioinfo on a BeagleBone Black would be:
> 
> debian@beaglebone:~$ gpioinfo
> gpiochip0 - 32 lines:
> 	line   0: "[ethernet]"       unused   input  active-high
> 	line   1: "[ethernet]"       unused   input  active-high
> 	line   2: "P9_22 [spi0_sclk]" unused input active-high
> 	line   3: "P9_21 [spi0_d0]" unused input active-high
> 	line   4: "P9_18 [spi0_d1]" unused input active-high
> 	line   5: "P9_17 [spi0_cs0]" unused input active-high
> 	line   6:  "[sd card]"         "cd"   input   active-low [used]
> 	line   7: "P9_42A [ecappwm0]" unused input active-high
> 	line   8: "P8_35 [hdmi]" unused input active-high
> 	line   9: "P8_33 [hdmi]" unused input active-high
> 	line  10: "P8_31 [hdmi]" unused input active-high
> 	line  11: "P8_32 [hdmi]" unused input active-high

[...]

> 
> [0] https://git.io/JfgOd
> [1] https://beagleboard.org/capes
> [1] https://beagleboard.org/Support/bone101
> [2] https://beagleboard.org/static/images/cape-headers.png
> 
> Reviewed-by: Jason Kridner <jason@beagleboard.org>
> Reviewed-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>   arch/arm/boot/dts/am335x-bone-common.dtsi | 144 ++++++++++++++++++++++

Not sure if it should be in am335x-bone-common.dtsi.

For example:
am335x-boneblack.dts
  #include "am335x-bone-common.dtsi"
  #include "am335x-boneblack-common.dtsi" <-- hdmi defined only here

am335x-bonegreen.dts
  #include "am335x-bone-common.dtsi"
  #include "am335x-bonegreen-common.dtsi"

>   1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
> index 6c9187bc0f17..d86e67b0e852 100644
> --- a/arch/arm/boot/dts/am335x-bone-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
> @@ -397,3 +397,147 @@ &rtc {
>   	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
>   	clock-names = "ext-clk", "int-clk";
>   };
> +
> +&gpio0 {
> +	gpio-line-names =
> +		"[ethernet]",
> +		"[ethernet]",
> +		"P9_22 [spi0_sclk]",
> +		"P9_21 [spi0_d0]",
> +		"P9_18 [spi0_d1]",
> +		"P9_17 [spi0_cs0]",
> +		"[sd card]",
> +		"P9_42A [ecappwm0]",
> +		"P8_35 [hdmi]",
> +		"P8_33 [hdmi]",
> +		"P8_31 [hdmi]",
> +		"P8_32 [hdmi]",

[...]

-- 
Best regards,
grygorii
