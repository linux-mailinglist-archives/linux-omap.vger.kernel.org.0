Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E882F644DA5
	for <lists+linux-omap@lfdr.de>; Tue,  6 Dec 2022 22:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiLFVCC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Dec 2022 16:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLFVCB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Dec 2022 16:02:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C526C2F028;
        Tue,  6 Dec 2022 13:02:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5DAF6618F2;
        Tue,  6 Dec 2022 21:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D33CC433D6;
        Tue,  6 Dec 2022 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670360519;
        bh=bvu32LFYIQ3mqvaTjtC2wlG+bQ9D2wDMKyzUQjMLf4M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mLTZZLRFOJuvTzmVeiD2+CyUjIalTOGm3M/E4TMnfX2uFbcuGdWa7eJLw1/8YlUI5
         DbE+pdQmZNSGfU2yrVr37kqsQVuMvMq2z3g6OzCP6giGorFIO3+M+Jd0WHE2F6Sk8O
         qIIRC7Yu4dDw202VtZGBeE1iMDdwvCfn3cTCt7ky0fRYQv5gZpxFGA0uE8VWJsoIMq
         fqlWxLAhCX6knHHyU3u7iy4ECDBUKM9ynujSfKssDRRQanAv+c/MHu8BQbPfxXlUqQ
         zurB1mt1f5M1xQlD1SXS9Z363LzSOTk4cIwZha01CKuz9YXkQ2oxSeoKQiSIcO+f0S
         uIywgvgMBgt3w==
Message-ID: <98a97883-3303-20eb-5a18-cfa00af9443e@kernel.org>
Date:   Tue, 6 Dec 2022 15:01:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/11] ARM: dts: socfpga: Fix pca9548 i2c-mux node name
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
References: <cover.1669999298.git.geert+renesas@glider.be>
 <a7bcc2de6c2c0946f56b2d9f9584c55cf28545dc.1669999298.git.geert+renesas@glider.be>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <a7bcc2de6c2c0946f56b2d9f9584c55cf28545dc.1669999298.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 12/2/22 10:49, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>      arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dtb: i2cswitch@70: $nodename:0: 'i2cswitch@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>      arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dtb: i2cswitch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
>          From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> 
> Fix this by renaming the PCA9548 node to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> index f24f17c2f5ee6bc4..e0630b0eed036d35 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> @@ -141,7 +141,7 @@ at24@50 {
>   		reg = <0x50>;
>   	};
>   
> -	i2cswitch@70 {
> +	i2c-mux@70 {
>   		compatible = "nxp,pca9548";
>   		#address-cells = <1>;
>   		#size-cells = <0>;

Applied!

Thanks,
Dinh
