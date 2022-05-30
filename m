Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6AB537567
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 09:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiE3Haj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 May 2022 03:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbiE3Hab (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 03:30:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC05D712FA
        for <linux-omap@vger.kernel.org>; Mon, 30 May 2022 00:30:29 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id s24so6067499wrb.10
        for <linux-omap@vger.kernel.org>; Mon, 30 May 2022 00:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mh999tHwdGZ5DkKc9TTTl7t6RAdqYNamNVC42fccVtg=;
        b=lt+8lqKZUDAkRaXwPyIUS1pK9J0dDbWBFAEKp06hl4tRfthFNYfDJ4q4AIQaMEwvCu
         slcvzdnEG6ucAwfQBIaS3BktYoY3fngvAk0LJX32WofaQ1xPitjyClXO1nUofbKQbpM9
         onReX1bTBXvsND8mSR4R04qADUnWDRiJ1iyyg5212dzzgW/yxp2a7kICQ281W4Ot6dH8
         LohZfqW9xLYqvPrHsy3XQ4KLuRc1H6BwUhP14qNmYhT8Yg6beNBCbCV6xZtgLmqIUsXZ
         h25tnNNMWknUzPwgxA9ncov9Blfsb8IF60mMvNftjMTTL8RslP/Poh3MP48bFFDNUiaM
         pmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mh999tHwdGZ5DkKc9TTTl7t6RAdqYNamNVC42fccVtg=;
        b=oHaSklJWNKcT4JNuP/78wn+GWP/VuU24vYS+IItPHWavkljUj9iHsn6YqMIeTylxad
         bNo9p4i6Wk/1jj+ike77zoA7281q1z3AlUXYIFzX5XRMNfa22MVEqtFaQlz3OdMkODiF
         xfnIZ3l7LrWJhMRfHrAI3ES67yahmMgDnrOrT3dk3BwNvzhaWxahvW3YMvzt6nQHx5rI
         8B9tmkldra5DRcUvA5e3m26OBIoUUQybDYSXFVZZlMBj7HPGqCwvB/hRSzwO7eAfyGVD
         g/TtX8TSCz+9uWxh5J4ZXX+xnAP1k6+NnQiGCJXYXX13LYFJWrf4JFhlH5pbOAibrFXd
         2E7Q==
X-Gm-Message-State: AOAM533MUhTE2OZ9nn7WMAmOT5Z21gxIqgSkFu1kpo/cDAfuqHI30SeY
        SDczrO+P84vG8Fy87NernyiWkQ==
X-Google-Smtp-Source: ABdhPJyGM5lmzH3U96xDpuM7YyV+8aTb+jV/Yo2fvpfMuRBnMa3+Gu27P9MPZA40OciVnYS3yqTT8A==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id 1-20020a5d47a1000000b0020fecc47f6cmr26459007wrb.236.1653895828454;
        Mon, 30 May 2022 00:30:28 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003973ea7e725sm12329611wmq.0.2022.05.30.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 00:30:27 -0700 (PDT)
Message-ID: <ed8c6533-c8b4-b89f-c44a-9e08f1cff455@linaro.org>
Date:   Mon, 30 May 2022 09:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] ARM: dts: add support for mws4 board
Content-Language: en-US
To:     Marian Ulbricht <ulbricht@innoroute.de>, devicetree@vger.kernel.org
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
References: <20220529203724.GA43480@Denkbrett>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220529203724.GA43480@Denkbrett>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/05/2022 22:37, Marian Ulbricht wrote:
> Mws4 is an ARM based nuclear probe hardware designed and used by
> German government "Bundesamt fuer Strahlenschutz" to monitor
> nuclear activity.
> 
> Signed-off-by: Marian Ulbricht <ulbricht@innoroute.de>
> ---
> 
> Changes in v2:
> * cosmetics
> 
> Changes in v1:
> * add dts
> 
>  arch/arm/boot/dts/omap3-mws4.dts | 328 +++++++++++++++++++++++++++++++
>  1 file changed, 328 insertions(+)
>  create mode 100644 arch/arm/boot/dts/omap3-mws4.dts
> 
> diff --git a/arch/arm/boot/dts/omap3-mws4.dts b/arch/arm/boot/dts/omap3-mws4.dts
> new file mode 100644
> index 000000000000..680a8e4ee816
> --- /dev/null
> +++ b/arch/arm/boot/dts/omap3-mws4.dts
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Modified 2015 by Bernhard Gaetzschmann, Ultratronik from Beagleboard xM
> + *
> + * Modified 2022 Marian Ulbricht ulbricht@innoroute.de
> + *
> + */
> +/dts-v1/;
> +#include "omap36xx.dtsi"
> +
> +/ {
> +	model = "Ultratronik BFS MWS4";
> +	compatible = "ti,omap3-mws4", "ti,omap36xx", "ti,omap3";

The board compatible still looks wrong. According to model it is not the
TI who made it. You need to use proper vendor prefix. Vendor prefix and
board compatible should be documented in the bindings. For the board
compatible this is Documentation/devicetree/bindings/arm/omap/omap.txt I
guess.

> +	cpus {
> +		cpu@0 {

Please override by label.

> +			cpu0-supply = <&vcc>;
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>; // 256 MB
> +	};
> +
> +	aliases {

Aliases go first.

> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;
> +		i2c2 = &i2c3;
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		mmc1 = &mmc1;
> +	};
> +
> +	netcard: AX88796BLI@ffdf0000 {
> +		compatible = "ax88796_dt";

This did not improve since last time... the node name does not match
Devicetree spec (generic node name like "ethernet", only lowercase
characters). The compatible is not documented. In fact, it is not a
proper compatible.

Checkpatch should warn you about this.

> +		reg = <0xffdf0000 0x1000> ;
> +
> +};
> +
> +	watchdog_max: watchdog {
> +		compatible = "linux,wdt-gpio";
> +		gpios = <&gpio4 21 1>; //117

Please use GPIO flags for the flags.

> +		hw_algo = "toggle";
> +		always-running;
> +		hw_margin_ms = <900>;
> +	};
> +
> +	hsusb1_phy: hsusb1_phy {

Override by labels.

> +		status = "disabled";
> +	};
> +
> +	/* HS USB Host PHY on PORT 2 */
> +	hsusb2_phy: hsusb2_phy {

The same.

> +		status = "disabled";
> +	};
> +
> +	/* fixed 19.2MHz oscillator */
> +	hfclk_19m2: oscillator {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <19200000>;
> +	};
> +
> +leds {

Please spend some time to make this code look like normal DTS.
Indentation is easy to fix, you do not reviewers to point it out.

> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins>;
> +		led_sm {

Generic node names, no underscores in node names. So led-0.

> +			label = "led_sm";
> +			gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>; /* 101 */
> +			default-state = "on";
> +		};
> +
> +		led1 {

led-1

and so one.
> +			label = "led1";
> +			gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
> +			linux,default-trigger = "cpu";
> +		};
> +
> +		led2 {
> +			label = "led2";
> +			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* 103 */
> +			linux,default-trigger = "mmc0";

Add function and color properties where applicable.

> +		};
> +
> +		led3 {
> +			label = "led3";
> +			gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
> +			linux,default-trigger = "usb-host";
> +		};
> +
> +		led_usb {
> +			label = "led_usb";
> +			gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>; /* 110 */
> +			default-state = "on";
> +		};
> +	};
> +};
> +
> +&gpmc {
> +	ranges = <0 0 0x30000000 0x1000000	/* CS0 space, 16MB */
> +		  255 0 0x6e000000 0x02d4>; /* register space */
> +
> +	/* Chip select 0 */
> +	nand@0,0 {
> +		compatible = "ti,omap2-nand";
> +		reg = <0 0 4		/* NAND I/O window, 4 bytes */
> +		       255 0 0x02d4>; /* GPMC register space */
> +		interrupts = <20>;
> +		ti,nand-ecc-opt = "bch4";
> +		nand-bus-width = <16>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		gpmc,cs-on-ns = <0>;
> +		gpmc,cs-rd-off-ns = <36>;
> +		gpmc,cs-wr-off-ns = <36>;
> +		gpmc,adv-on-ns = <6>;
> +		gpmc,adv-rd-off-ns = <24>;
> +		gpmc,adv-wr-off-ns = <36>;
> +		gpmc,oe-on-ns = <6>;
> +		gpmc,oe-off-ns = <48>;
> +		gpmc,we-on-ns = <6>;
> +		gpmc,we-off-ns = <30>;
> +		gpmc,rd-cycle-ns = <72>;
> +		gpmc,wr-cycle-ns = <72>;
> +		gpmc,access-ns = <54>;
> +		gpmc,wr-access-ns = <30>;
> +
> +		partition@0 {
> +			label = "X-Loader";
> +			reg = <0 0x40000>;
> +		};
> +
> +		partition@40000 {
> +			label = "U-Boot";
> +			reg = <0x40000 0x100000>;
> +		};
> +
> +		partition@100000 {
> +			label = "U-Boot Env";
> +			reg = <0x100000 0x120000>;
> +		};
> +
> +		partition@120000 {
> +			label = "dt";
> +			reg = <0x120000 0x140000>;
> +		};
> +
> +		partition@140000 {
> +			label = "Kernel";
> +			reg = <0x140000 0xB40000>;
> +		};
> +
> +		partition@B40000 {
> +			label = "Filesystem";
> +			reg = <0xB40000 0xf4c0000>;
> +		};
> +	};
> +};
> +
> +&usbhshost {
> +	status = "disabled";
> +};
> +
> +&omap3_pmx_core {
> +		mmc1_pins: pinmux_mmc1_pins {

No underscores in node names. Hyphens instead.

> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x2144, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_clk.sdmmc1_clk */
> +			OMAP3_CORE1_IOPAD(0x2146, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_cmd.sdmmc1_cmd */
> +			OMAP3_CORE1_IOPAD(0x2148, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat0.sdmmc1_dat0 */
> +			OMAP3_CORE1_IOPAD(0x214a, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat1.sdmmc1_dat1 */
> +			OMAP3_CORE1_IOPAD(0x214c, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat2.sdmmc1_dat2 */
> +			OMAP3_CORE1_IOPAD(0x214e, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat3.sdmmc1_dat3 */
> +		>;
> +	};
> +
> +	wd_pins: pinmux_wd_pins {
> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x213e, PIN_OUTPUT | MUX_MODE4)	// CONTROL_PADCONF_MCBSP2_CLKX	0x013E
> +		>;
> +	};
> +
> +	i2c1_pins: pinmux_i2c1_pins {
> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x21ba, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
> +			OMAP3_CORE1_IOPAD(0x21bc, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
> +		>;
> +	};
> +
> +	hsusb0_pins: pinmux_hsusb0_pins {
> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x21a2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_clk.hsusb0_clk */
> +			OMAP3_CORE1_IOPAD(0x21a4, PIN_OUTPUT | MUX_MODE0)					/* hsusb0_stp.hsusb0_stp */
> +			OMAP3_CORE1_IOPAD(0x21a6, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_dir.hsusb0_dir */
> +			OMAP3_CORE1_IOPAD(0x21a8, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_nxt.hsusb0_nxt */
> +			OMAP3_CORE1_IOPAD(0x21aa, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data0.hsusb2_data0 */
> +			OMAP3_CORE1_IOPAD(0x21ac, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data1.hsusb0_data1 */
> +			OMAP3_CORE1_IOPAD(0x21ae, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data2.hsusb0_data2 */
> +			OMAP3_CORE1_IOPAD(0x21b0, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data7.hsusb0_data3 */
> +			OMAP3_CORE1_IOPAD(0x21b2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data7.hsusb0_data4 */
> +			OMAP3_CORE1_IOPAD(0x21b4, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data7.hsusb0_data5 */
> +			OMAP3_CORE1_IOPAD(0x21b6, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data7.hsusb0_data6 */
> +			OMAP3_CORE1_IOPAD(0x21b8, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* hsusb0_data7.hsusb0_data7 */
> +		>;
> +	};
> +
> +	led_pins: pinmux_led_pins {
> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x211a, PIN_OUTPUT | MUX_MODE4)	/* gpio101*/
> +			OMAP3_CORE1_IOPAD(0x211c, PIN_OUTPUT | MUX_MODE4)	/* gpio102*/
> +			OMAP3_CORE1_IOPAD(0x211e, PIN_OUTPUT | MUX_MODE4)	/* gpio103 */
> +			OMAP3_CORE1_IOPAD(0x2120, PIN_OUTPUT | MUX_MODE4)	/* gpio103 */
> +		>;
> +	};
> +
> +	gpio_pins: pinmux_gpio_pins {
> +		pinctrl-single,pins = <
> +			OMAP3_CORE1_IOPAD(0x2122, PIN_INPUT | MUX_MODE4)	/* gpio105 spontanmeldung */
> +			OMAP3_CORE1_IOPAD(0x212c, PIN_OUTPUT | MUX_MODE4)	/* gpio110 usb2_en */
> +			OMAP3_CORE1_IOPAD(0x218C, PIN_OUTPUT | MUX_MODE4)	/* GPO0 */
> +			OMAP3_CORE1_IOPAD(0x218E, PIN_OUTPUT | MUX_MODE4)	/* GPO1 */
> +			OMAP3_CORE1_IOPAD(0x2190, PIN_OUTPUT | MUX_MODE4)	/* GPO2 */
> +			OMAP3_CORE1_IOPAD(0x2192, PIN_OUTPUT | MUX_MODE4)	/* GPO3 */
> +			OMAP3_CORE1_IOPAD(0x2194, PIN_OUTPUT | MUX_MODE4)	/* GPO4 */
> +			OMAP3_CORE1_IOPAD(0x2196, PIN_OUTPUT | MUX_MODE4)	/* GPO5 */
> +			OMAP3_CORE1_IOPAD(0x2198, PIN_OUTPUT | MUX_MODE4)	/* GPO6 */
> +			OMAP3_CORE1_IOPAD(0x2116, PIN_INPUT | MUX_MODE4)	/* IN1 */
> +			OMAP3_CORE1_IOPAD(0x2118, PIN_INPUT | MUX_MODE4)	/* IN2 */
> +			OMAP3_CORE1_IOPAD(0x2124, PIN_INPUT | MUX_MODE4)	/* IN3 */
> +			OMAP3_CORE1_IOPAD(0x2126, PIN_INPUT | MUX_MODE4)	/* IN4 */
> +			OMAP3_CORE1_IOPAD(0x2128, PIN_INPUT | MUX_MODE4)	/* IN5 */
> +			OMAP3_CORE1_IOPAD(0x25F4, PIN_OUTPUT | MUX_MODE4)	/* RES_RS232 */
> +			OMAP3_CORE1_IOPAD(0x25F6, PIN_OUTPUT | MUX_MODE4)	/* HUB_RESET */
> +		>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +
> +	pinctrl-0 = <&i2c1_pins>;
> +	clock-frequency = <100000>;
> +	twl: twl@48 {

Generic node name representing class of a device.

> +		reg = <0x48>;
> +		interrupts = <7>; /* SYS_NIRQ cascaded to intc */
> +		interrupt-parent = <&intc>;
> +		clocks = <&hfclk_19m2>;
> +		clock-names = "fck";
> +		twl_power: power {
> +			compatible = "ti,twl4030-power";
> +			ti,system-power-controller;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	rtc8564: rtc8564@51 {

The same.

> +		compatible = "epson,rtc8564";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +};
> +
> +#include "twl4030.dtsi"
> +#include "twl4030_omap3.dtsi"

Includes go on top usually.

Best regards,
Krzysztof
