Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D54A1FD32D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 19:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgFQRJW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 13:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgFQRJV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jun 2020 13:09:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F753C0613ED
        for <linux-omap@vger.kernel.org>; Wed, 17 Jun 2020 10:09:20 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so3251165ejd.0
        for <linux-omap@vger.kernel.org>; Wed, 17 Jun 2020 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=llgLOWawE+Jl+FflrGgL/bECe1/T60fUq6NAZEDO5Bg=;
        b=NywT8DBeLXU7gPTKju8ZORuwIBRNKoEQ8CzSNeSkghidLKMXthxxsmYHxOBwBPVIym
         ePaceGIC3QILwRqDVQawL5zeNci31L8cq7/0DXFOXqs1vhDkaievRY1qJPL6kzrYS0xM
         M5yzVukHVoSdsB/TqcnBZWuVecoXv9o56sNoeinolplH4tmCaryja0LqTkAArsDGkdns
         auDiS4XnaeivzMT63N84+oQwZ69UdsqMBCRYBU7ebk3dGgl2d9oLyni6iTv4bC6gfgeu
         D7UlOF3y0mpuMcZu4lIx6yuKgFsJLYOXfTS9GGPR2l9cJqOTMNFvd8y6gMABtQGpkiSo
         I11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=llgLOWawE+Jl+FflrGgL/bECe1/T60fUq6NAZEDO5Bg=;
        b=r7WW+KFt7IOUWnGwJfR5o3CTWCosGuDpA8hcE+aZsu4kjGmDxuc+CuIqbaeq0mX0qV
         8SQWaTuWFu5HIZftQe6B+2uZaD6/ZxDCbsOuddKcWhDQ8eIdXOh8UyWqW3TG6dkoSV2L
         cWnK3M3JYCBrlcNikg2WPJuE8TNcp/IwjP9vOm57SSUFT/LVII4cGnkx5EpRPfrMv8mK
         cQqxcZqiLrHDHKNXRfBfZTZedP16dyozHOEyRd4l62hIsnKsnccl8yjJFiEiNs1Q+CtE
         NwuXpli0YaMh3OIgl6382cJ5H+vfJi4jzCvE0vcIGwJczYkyuQZFm/+wbNkQovETc+ZO
         mkuQ==
X-Gm-Message-State: AOAM533b1CYZ+IJvaob1BPV5OFCZgsZp6vXobCl02Ba+uWY43nmzxKpC
        hQ3aU3o+C+TWOywNM+l9vScvlw==
X-Google-Smtp-Source: ABdhPJzkgIaYd7/sDY2Mg75w7NmhdszT6dg/5U2LRj3uYZ+sq/glgTTmVOwxLfj6DcbvGttpuEXDdw==
X-Received: by 2002:a17:906:5410:: with SMTP id q16mr141105ejo.103.1592413758506;
        Wed, 17 Jun 2020 10:09:18 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id ew9sm364844ejb.121.2020.06.17.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 10:09:17 -0700 (PDT)
Date:   Wed, 17 Jun 2020 19:09:15 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-pocketbeagle: add gpio-line-names
Message-ID: <20200617170915.GA4185472@x1>
References: <20200609142504.GA2955236@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609142504.GA2955236@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 09, 2020 at 04:25:04PM +0200, Drew Fustini wrote:
> The BeagleBoard.org PocketBeagle has P1 and P2 headers [0] which expose
> many of the TI AM3358 SoC balls to stacking expansion boards called 
> "capes", or to other external connections like jumper wires connected
> to a breadboard.
> 
> Note: the AM3358 die is actually embedded inside of the OSD335x-SM
> System-in-Package (SiP) [1] but that is irrelevant to the gpio driver.
> 
> Many of the P1 and P2 header pins can muxed to a GPIO line.  The
> gpio-line-names describe which P1 or P2 pin that line goes to and the
> default mux for that P1 or P2 pin if it is not GPIO.
>     
> Some GPIO lines are named "[NC]" as the corresponding balls are not
> routed to anything on the PCB.
> 
> The goal for these names is to make it easier for a user viewing the
> output of gpioinfo to determine which P1 or P2 pin is connected to a
> GPIO line.  The output of gpioinfo on a PocketBeagle would be:
> 
> gpiochip0 - 32 lines:
> 	line   0:       "[NC]"       unused   input  active-high 
> 	line   1:       "[NC]"       unused   input  active-high 
> 	line   2: "P1.08 [SPI0_CLK]" unused input active-high 
> 	line   3: "P1.10 [SPI0_MISO]" unused input active-high 
> 	line   4: "P1.12 [SPI0_MOSI]" unused input active-high 
> 	line   5: "P1.06 [SPI0_CS]" unused input active-high 
> 	line   6:  "[MMC0_CD]"         "cd"   input   active-low [used]
> 	line   7: "P2.29 [SPI1_CLK]" unused input active-high 
> 	line   8:       "[NC]"       unused   input  active-high 
> 	line   9:       "[NC]"       unused   input  active-high 
> 	line  10:       "[NC]"       unused   input  active-high 
> 	line  11:       "[NC]"       unused   input  active-high 
> 	line  12: "P1.26 [I2C2_SDA]" unused input active-high 
> 	line  13: "P1.28 [I2C2_SCL]" unused input active-high 
> 	line  14: "P2.11 [I2C1_SDA]" unused input active-high 
> 	line  15: "P2.09 [I2C1_SCL]" unused input active-high 
> 	line  16:       "[NC]"       unused   input  active-high 
> 	line  17:       "[NC]"       unused   input  active-high 
> 	line  18:       "[NC]"       unused   input  active-high 
> 	line  19: "P2.31 [SPI1_CS]" unused input active-high 
> 	line  20: "P1.20 [PRU0.16]" unused input active-high 
> 	line  21:       "[NC]"       unused   input  active-high 
> 	line  22:       "[NC]"       unused   input  active-high 
> 	line  23:      "P2.03"       unused   input  active-high 
> 	line  24:       "[NC]"       unused   input  active-high 
> 	line  25:       "[NC]"       unused   input  active-high 
> 	line  26:      "P1.34"       unused   input  active-high 
> 	line  27:      "P2.19"       unused   input  active-high 
> 	line  28:       "[NC]"       unused   input  active-high 
> 	line  29:       "[NC]"       unused   input  active-high 
> 	line  30: "P2.05 [UART4_RX]" unused input active-high 
> 	line  31: "P2.07 [UART4_TX]" unused input active-high 
> gpiochip1 - 32 lines:
> 	line   0:       "[NC]"       unused   input  active-high 
> 	line   1:       "[NC]"       unused   input  active-high 
> 	line   2:       "[NC]"       unused   input  active-high 
> 	line   3:       "[NC]"       unused   input  active-high 
> 	line   4:       "[NC]"       unused   input  active-high 
> 	line   5:       "[NC]"       unused   input  active-high 
> 	line   6: "P1.06 [SPI0_CS]" unused input active-high 
> 	line   7: "P1.06 [SPI0_CS]" unused input active-high 
> 	line   8: "P2.27 [SPI1_MISO]" unused input active-high 
> 	line   9: "P2.25 [SPI1_MOSI]" unused input active-high 
> 	line  10: "P1.32 [UART0_RX]" unused input active-high 
> 	line  11: "P1.30 [UART0_TX]" unused input active-high 
> 	line  12:      "P2.24"       unused   input  active-high 
> 	line  13:      "P2.33"       unused   input  active-high 
> 	line  14:      "P2.22"       unused   input  active-high 
> 	line  15:      "P2.18"       unused   input  active-high 
> 	line  16:       "[NC]"       unused   input  active-high 
> 	line  17:       "[NC]"       unused   input  active-high 
> 	line  18: "P2.01 [PWM1A]" unused input active-high 
> 	line  19:       "[NC]"       unused   input  active-high 
> 	line  20:      "P2.10"       unused   input  active-high 
> 	line  21: "[user led 0]" "beaglebone:green:usr0" output active-high [used]
> 	line  22: "[user led 1]" "beaglebone:green:usr1" output active-high [used]
> 	line  23: "[user led 2]" "beaglebone:green:usr2" output active-high [used]
> 	line  24: "[user led 3]" "beaglebone:green:usr3" output active-high [used]
> 	line  25:      "P2.06"       unused   input  active-high 
> 	line  26:      "P2.04"       unused   input  active-high 
> 	line  27:      "P2.02"       unused   input  active-high 
> 	line  28:      "P2.08"       unused   input  active-high 
> 	line  29:       "[NC]"       unused   input  active-high 
> 	line  30:       "[NC]"       unused   input  active-high 
> 	line  31:       "[NC]"       unused   input  active-high 
> gpiochip2 - 32 lines:
> 	line   0:       "[NC]"       unused   input  active-high 
> 	line   1:      "P2.17"       unused   input  active-high 
> 	line   2:       "[NC]"       unused   input  active-high 
> 	line   3:       "[NC]"       unused   input  active-high 
> 	line   4:       "[NC]"       unused   input  active-high 
> 	line   5: "[EEPROM_WP]" unused input active-high 
> 	line   6:       "[NC]"       unused   input  active-high 
> 	line   7:       "[NC]"       unused   input  active-high 
> 	line   8:       "[NC]"       unused   input  active-high 
> 	line   9:       "[NC]"       unused   input  active-high 
> 	line  10:       "[NC]"       unused   input  active-high 
> 	line  11:       "[NC]"       unused   input  active-high 
> 	line  12:       "[NC]"       unused   input  active-high 
> 	line  13:       "[NC]"       unused   input  active-high 
> 	line  14:       "[NC]"       unused   input  active-high 
> 	line  15:       "[NC]"       unused   input  active-high 
> 	line  16:       "[NC]"       unused   input  active-high 
> 	line  17:       "[NC]"       unused   input  active-high 
> 	line  18:       "[NC]"       unused   input  active-high 
> 	line  19:       "[NC]"       unused   input  active-high 
> 	line  20:       "[NC]"       unused   input  active-high 
> 	line  21:       "[NC]"       unused   input  active-high 
> 	line  22: "P2.35 [AIN5]" unused input active-high 
> 	line  23: "P1.02 [AIN6]" unused input active-high 
> 	line  24: "P1.35 [PRU1.10]" unused input active-high 
> 	line  25: "P1.04 [PRU1.11]" unused input active-high 
> 	line  26: "[MMC0_DAT3]" unused input active-high 
> 	line  27: "[MMC0_DAT2]" unused input active-high 
> 	line  28: "[MMC0_DAT1]" unused input active-high 
> 	line  29: "[MMC0_DAT0]" unused input active-high 
> 	line  30: "[MMC0_CLK]"       unused   input  active-high 
> 	line  31: "[MMC0_CMD]"       unused   input  active-high 
> gpiochip3 - 32 lines:
> 	line   0:       "[NC]"       unused   input  active-high 
> 	line   1:       "[NC]"       unused   input  active-high 
> 	line   2:       "[NC]"       unused   input  active-high 
> 	line   3:       "[NC]"       unused   input  active-high 
> 	line   4:       "[NC]"       unused   input  active-high 
> 	line   5: "[I2C0_SDA]"       unused   input  active-high 
> 	line   6: "[I2C0_SCL]"       unused   input  active-high 
> 	line   7:     "[JTAG]"       unused   input  active-high 
> 	line   8:     "[JTAG]"       unused   input  active-high 
> 	line   9:       "[NC]"       unused   input  active-high 
> 	line  10:       "[NC]"       unused   input  active-high 
> 	line  11:       "[NC]"       unused   input  active-high 
> 	line  12:       "[NC]"       unused   input  active-high 
> 	line  13: "P1.03 [USB1]" unused input active-high 
> 	line  14: "P1.36 [PWM0A]" unused input active-high 
> 	line  15: "P1.33 [PRU0.1]" unused input active-high 
> 	line  16: "P2.32 [PRU0.2]" unused input active-high 
> 	line  17: "P2.30 [PRU0.3]" unused input active-high 
> 	line  18: "P1.31 [PRU0.4]" unused input active-high 
> 	line  19: "P2.34 [PRU0.5]" unused input active-high 
> 	line  20: "P2.28 [PRU0.6]" unused input active-high 
> 	line  21: "P1.29 [PRU0.7]" unused input active-high 
> 	line  22:       "[NC]"       unused   input  active-high 
> 	line  23:       "[NC]"       unused   input  active-high 
> 	line  24:       "[NC]"       unused   input  active-high 
> 	line  25:       "[NC]"       unused   input  active-high 
> 	line  26:       "[NC]"       unused   input  active-high 
> 	line  27:       "[NC]"       unused   input  active-high 
> 	line  28:       "[NC]"       unused   input  active-high 
> 	line  29:       "[NC]"       unused   input  active-high 
> 	line  30:       "[NC]"       unused   input  active-high 
> 	line  31:       "[NC]"       unused   input  active-high 
> 
> [0] https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#71_Expansion_Header_Connectors
> [1] https://octavosystems.com/app_notes/osd335x-family-pin-assignments/
> 
> Reviewed-by: Jason Kridner <jason@beagleboard.org>
> Reviewed-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  arch/arm/boot/dts/am335x-pocketbeagle.dts | 144 ++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
> index 4da719098028..60e5fa2b9156 100644
> --- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
> +++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
> @@ -59,6 +59,150 @@ vmmcsd_fixed: fixedregulator0 {
>  	};
>  };
>  
> +&gpio0 {
> +	gpio-line-names =
> +		"[NC]",
> +		"[NC]",
> +		"P1.08 [SPI0_CLK]",
> +		"P1.10 [SPI0_MISO]",
> +		"P1.12 [SPI0_MOSI]",
> +		"P1.06 [SPI0_CS]",
> +		"[MMC0_CD]",
> +		"P2.29 [SPI1_CLK]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"P1.26 [I2C2_SDA]",
> +		"P1.28 [I2C2_SCL]",
> +		"P2.11 [I2C1_SDA]",
> +		"P2.09 [I2C1_SCL]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"P2.31 [SPI1_CS]",
> +		"P1.20 [PRU0.16]",
> +		"[NC]",
> +		"[NC]",
> +		"P2.03",
> +		"[NC]",
> +		"[NC]",
> +		"P1.34",
> +		"P2.19",
> +		"[NC]",
> +		"[NC]",
> +		"P2.05 [UART4_RX]",
> +		"P2.07 [UART4_TX]";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"P1.06 [SPI0_CS]",
> +		"P1.06 [SPI0_CS]",
> +		"P2.27 [SPI1_MISO]",
> +		"P2.25 [SPI1_MOSI]",
> +		"P1.32 [UART0_RX]",
> +		"P1.30 [UART0_TX]",
> +		"P2.24",
> +		"P2.33",
> +		"P2.22",
> +		"P2.18",
> +		"[NC]",
> +		"[NC]",
> +		"P2.01 [PWM1A]",
> +		"[NC]",
> +		"P2.10",
> +		"[user led 0]",
> +		"[user led 1]",
> +		"[user led 2]",
> +		"[user led 3]",
> +		"P2.06",
> +		"P2.04",
> +		"P2.02",
> +		"P2.08",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]";
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"[NC]",
> +		"P2.17",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[EEPROM_WP]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"P2.35 [AIN5]",
> +		"P1.02 [AIN6]",
> +		"P1.35 [PRU1.10]",
> +		"P1.04 [PRU1.11]",
> +		"[MMC0_DAT3]",
> +		"[MMC0_DAT2]",
> +		"[MMC0_DAT1]",
> +		"[MMC0_DAT0]",
> +		"[MMC0_CLK]",
> +		"[MMC0_CMD]";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[I2C0_SDA]",
> +		"[I2C0_SCL]",
> +		"[JTAG]",
> +		"[JTAG]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"P1.03 [USB1]",
> +		"P1.36 [PWM0A]",
> +		"P1.33 [PRU0.1]",
> +		"P2.32 [PRU0.2]",
> +		"P2.30 [PRU0.3]",
> +		"P1.31 [PRU0.4]",
> +		"P2.34 [PRU0.5]",
> +		"P2.28 [PRU0.6]",
> +		"P1.29 [PRU0.7]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]",
> +		"[NC]";
> +};
> +
>  &am33xx_pinmux {
>  	i2c2_pins: pinmux-i2c2-pins {
>  		pinctrl-single,pins = <
> -- 
> 2.25.1
> 

Tony - does this look ok for 5.9?

If so, I might start making other variants like BeagleBone Blue and
BeagleBone {Green,Black} Wireless and submit those when ready.

thanks,
drew
