Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D0566C979
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jan 2023 17:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjAPQt6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Jan 2023 11:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjAPQte (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Jan 2023 11:49:34 -0500
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19AC2A14D;
        Mon, 16 Jan 2023 08:36:19 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-15027746720so29314822fac.13;
        Mon, 16 Jan 2023 08:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgY7T2L7oFeWq4CsounM2g4QDJgWwjvdaK+YZ91lUxU=;
        b=6OauEbaYIjBb5faB0DLssZwIONxjrpqC0OmnZ29h9VhUxuv5Ypq/u1aUHdD7ZcjVkE
         rPaxvv5OFk0al2kwgEn0c64p0kpKeVZJWcAicJqUF+BILqxehZl3t3vNDKDs5G4bM8Dz
         CywToGz1qLvIO7rQJWDOpPQ8G5RxcupOnrPZ4zsETv3ZG5n6ZPXpPI8Fc6Ep6XlDTa2B
         vrn3VPMGtP0WlOLrNuXivb6GrKxHe4Z+3f6jfctjjwC1HxT0UL4Ib2/+AgjVnTGDMFQ2
         tFHvCOXQsuWZFosmw3Em16xBOHR/3a0zAMyb0CnULhKKRAScC5kzaI1VXAU1VpSKQqkn
         J+Ug==
X-Gm-Message-State: AFqh2kr85zhj8Gf2LpfN9mClN6SGRB+ArAiUahdMxxoQr/eS8j7rIw7w
        Kh4cJhulsMGSQeowEvSzPw==
X-Google-Smtp-Source: AMrXdXuMXZmeZ0cvuvkxElw+hUXbJqC8TWuFLUJ/+Mlg41wDhVBaBgiTLyO8GERrPPzwMpKmp6XLMw==
X-Received: by 2002:a05:6870:cb93:b0:14b:b6e4:bf77 with SMTP id ov19-20020a056870cb9300b0014bb6e4bf77mr259827oab.10.1673886979028;
        Mon, 16 Jan 2023 08:36:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l3-20020a056870218300b00152c52608dbsm14938316oae.34.2023.01.16.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:36:18 -0800 (PST)
Received: (nullmailer pid 606192 invoked by uid 1000);
        Mon, 16 Jan 2023 16:36:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20230116071602.63788-1-tony@atomide.com>
References: <20230116071602.63788-1-tony@atomide.com>
Message-Id: <167388667378.596858.12053272103098373981.robh@kernel.org>
Subject: Re: [PATCH v3 1/1] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Date:   Mon, 16 Jan 2023 10:36:12 -0600
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On Mon, 16 Jan 2023 09:15:59 +0200, Tony Lindgren wrote:
> Update binding for yaml and remove the old related txt bindings. Note that
> we are also adding the undocumented pinctrl-single,slew-rate property. And
> we only use the first example from the old binding.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v2:
> 
> - Drop old ti,omap-pinctrl.txt in addition to old pinctrl-single.txt
> 
> - Replace reference to pinctrl-single.txt to point to the yaml in ctrl.txt
> 
> Changes since v1:
> 
> - The v1 version was a WIP patch posted as an example in thread
>   "dt binding check error with hash and comma"
> 
> ---
>  .../devicetree/bindings/arm/omap/ctrl.txt     |   2 +-
>  .../bindings/pinctrl/pinctrl-single.txt       | 262 ------------------
>  .../bindings/pinctrl/pinctrl-single.yaml      | 155 +++++++++++
>  .../bindings/pinctrl/ti,omap-pinctrl.txt      |  13 -
>  4 files changed, 156 insertions(+), 276 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230116071602.63788-1-tony@atomide.com


pinconf@140000: $nodename:0: 'pinconf@140000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb

pinconf@8a21000: $nodename:0: 'pinconf@8a21000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb

pinconf@8a21000: 'gpio-range' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb

pinctrl@11c000: 'cp2102n-reset-pin-default' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb

pinctrl@40e10000: 'charger_pins', 'dock_detect_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb

pinctrl@4301c000: 'wkup-pca554-default' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/ti/k3-am654-base-board.dtb

pinmux@1400: 'cpsw_pins_default', 'cpsw_pins_sleep', 'davinci_mdio_pins_default', 'davinci_mdio_pins_sleep', 'i2c1_pins_default', 'i2c3_pins_default', 'i2c4_pins_default', 'i2c5_pins_default', 'lcd_pins_default', 'leds_pins_default', 'mcasp3_pins_default', 'mcasp3_pins_sleep', 'mmc1_pins_default', 'mmc2_pins_default', 'pinmux_ads7846_pins', 'pinmux_hdmi_conn_pins', 'pinmux_hdmi_pins', 'pinmux_qspi1_pins', 'pinmux_usb1_pins', 'tps659038_pins_default', 'uart3_pins_default' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am57xx-sbc-am57x.dtb

pinmux@1400: 'cpsw_pins_default', 'cpsw_pins_sleep', 'davinci_mdio_pins_default', 'davinci_mdio_pins_sleep', 'i2c1_pins_default', 'i2c3_pins_default', 'i2c4_pins_default', 'leds_pins_default', 'mcasp3_pins_default', 'mcasp3_pins_sleep', 'mmc2_pins_default', 'pinmux_ads7846_pins', 'pinmux_qspi1_pins', 'tps659038_pins_default' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am57xx-cl-som-am57x.dtb

pinmux@1400: 'dcan1_pins_default', 'dcan1_pins_sleep', 'mmc1_pins_ddr50', 'mmc1_pins_default', 'mmc1_pins_default_no_clk_pu', 'mmc1_pins_hs', 'mmc1_pins_sdr104', 'mmc1_pins_sdr12', 'mmc1_pins_sdr25', 'mmc1_pins_sdr50', 'mmc2_pins_ddr_1_8v_rev11', 'mmc2_pins_ddr_3_3v_rev11', 'mmc2_pins_ddr_rev20', 'mmc2_pins_default', 'mmc2_pins_hs', 'mmc2_pins_hs200', 'mmc3_pins_default', 'mmc3_pins_hs', 'mmc3_pins_sdr12', 'mmc3_pins_sdr25', 'mmc3_pins_sdr50', 'mmc4_pins_default', 'mmc4_pins_hs', 'mmc4_pins_sdr12', 'mmc4_pins_sdr25' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am572x-idk.dtb

pinmux@1400: 'dcan1_pins_default', 'dcan1_pins_sleep', 'mmc1_pins_ddr50', 'mmc1_pins_default', 'mmc1_pins_default_no_clk_pu', 'mmc1_pins_hs', 'mmc1_pins_sdr50', 'mmc2_pins_default', 'mmc2_pins_hs200', 'mmc3_pins_default', 'mmc4_pins_hs' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am574x-idk.dtb

pinmux@1400: 'dcan1_pins_default', 'dcan1_pins_sleep', 'mmc1_pins_ddr50', 'mmc1_pins_default', 'mmc1_pins_hs', 'mmc1_pins_sdr104', 'mmc1_pins_sdr12', 'mmc1_pins_sdr25', 'mmc1_pins_sdr50', 'mmc2_pins_ddr_1_8v_rev11', 'mmc2_pins_ddr_3_3v_rev11', 'mmc2_pins_ddr_rev20', 'mmc2_pins_default', 'mmc2_pins_hs', 'mmc2_pins_hs200', 'mmc3_pins_default', 'mmc3_pins_hs', 'mmc3_pins_sdr12', 'mmc3_pins_sdr25', 'mmc3_pins_sdr50', 'mmc4_pins_default', 'mmc4_pins_hs', 'mmc4_pins_sdr12', 'mmc4_pins_sdr25' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dra7-evm.dtb

pinmux@1400: 'dcan1_pins_default', 'dcan1_pins_sleep', 'mmc1_pins_ddr50_rev10', 'mmc1_pins_ddr50_rev20', 'mmc1_pins_default', 'mmc1_pins_default_no_clk_pu', 'mmc1_pins_hs', 'mmc1_pins_sdr104', 'mmc1_pins_sdr12', 'mmc1_pins_sdr25', 'mmc1_pins_sdr50', 'mmc2_pins_ddr_rev10', 'mmc2_pins_ddr_rev20', 'mmc2_pins_default', 'mmc2_pins_hs', 'mmc2_pins_hs200', 'mmc4_pins_default' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am571x-idk.dtb
	arch/arm/boot/dts/dra71-evm.dtb

pinmux@1400: 'dcan1_pins_default', 'dcan1_pins_sleep', 'mmc1_pins_ddr50_rev10', 'mmc1_pins_ddr50_rev20', 'mmc1_pins_default', 'mmc1_pins_hs', 'mmc1_pins_sdr104', 'mmc1_pins_sdr12', 'mmc1_pins_sdr25', 'mmc1_pins_sdr50', 'mmc2_pins_ddr_rev10', 'mmc2_pins_ddr_rev20', 'mmc2_pins_default', 'mmc2_pins_hs', 'mmc2_pins_hs200', 'mmc4_pins_default' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dra72-evm.dtb
	arch/arm/boot/dts/dra72-evm-revc.dtb

pinmux@1400: 'mmc1_pins_ddr50', 'mmc1_pins_default', 'mmc1_pins_hs', 'mmc1_pins_sdr104', 'mmc1_pins_sdr12', 'mmc1_pins_sdr25', 'mmc1_pins_sdr50', 'mmc2_pins_ddr_1_8v_rev11', 'mmc2_pins_ddr_3_3v_rev11', 'mmc2_pins_ddr_rev20', 'mmc2_pins_default', 'mmc2_pins_hs', 'mmc2_pins_hs200', 'mmc3_pins_default', 'mmc3_pins_hs', 'mmc3_pins_sdr12', 'mmc3_pins_sdr25', 'mmc3_pins_sdr50', 'mmc4_pins_default', 'mmc4_pins_hs', 'mmc4_pins_sdr12', 'mmc4_pins_sdr25' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am5729-beagleboneai.dtb
	arch/arm/boot/dts/am57xx-beagle-x15.dtb
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dtb
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dtb

pinmux@1400: 'mmc1_pins_ddr50', 'mmc1_pins_default', 'mmc1_pins_hs', 'mmc1_pins_sdr50', 'mmc2_pins_default', 'mmc2_pins_hs200', 'mmc3_pins_default', 'mmc4_pins_hs' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dra76-evm.dtb

pinmux@14029c: 'gpio-range', 'pinmux_drdu2_overcurrent', 'pinmux_drdu3_overcurrent', 'pinmux_gpio_14', 'pinmux_i2c0_sda', 'pinmux_i2c1_sda', 'pinmux_i2s_bitclk', 'pinmux_nand_ce1_n', 'pinmux_pnor_adv_n', 'pinmux_pwm_0', 'pinmux_pwm_1', 'pinmux_pwm_2', 'pinmux_pwm_3', 'pinmux_sdio0_cd_l', 'pinmux_sdio1_cd_l', 'pinmux_spi0_sck_nand', 'pinmux_spi1_sck_nand', 'pinmux_uart0_sin_nitro', 'pinmux_uart1_sin_nand', 'pinmux_uart1_sin_nitro', 'pinmux_uart2_sin', 'pinmux_uart3_sin', 'pinmux_usb3h_overcurrent', 'pinumux_uart0_sin_nand', 'pinumx_ext_mdio', 'pinumx_qspi_hold_n' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb

pinmux@14029c: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb
	arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb

pinmux@14120: 'gpio-range', 'nand_pins', 'pinmux_ecap0_pins', 'pinmux_ecap1_pins', 'pinmux_ecap2_pins', 'pinmux_ehrpwm0a_pins', 'pinmux_ehrpwm0b_pins', 'pinmux_ehrpwm1a_pins', 'pinmux_ehrpwm1b_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_lcd_pins', 'pinmux_mcasp0_pins', 'pinmux_mdio_pins', 'pinmux_mii_pins', 'pinmux_mmc_pins', 'pinmux_serial0_rtscts_pins', 'pinmux_serial0_rxtx_pins', 'pinmux_serial1_rtscts_pins', 'pinmux_serial1_rxtx_pins', 'pinmux_serial2_rtscts_pins', 'pinmux_serial2_rxtx_pins', 'pinmux_spi0_cs0', 'pinmux_spi0_cs3_pin', 'pinmux_spi0_pins', 'pinmux_spi1_cs0', 'pinmux_spi1_pins', 'vpif_capture_pins', 'vpif_display_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/da850-evm.dtb
	arch/arm/boot/dts/da850-lcdk.dtb

pinmux@14120: 'gpio-range', 'pinmux_ecap0_pins', 'pinmux_ecap1_pins', 'pinmux_ecap2_pins', 'pinmux_ehrpwm0a_pins', 'pinmux_ehrpwm0b_pins', 'pinmux_ehrpwm1a_pins', 'pinmux_ehrpwm1b_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_lcd', 'pinmux_lcd_pins', 'pinmux_mdio_pins', 'pinmux_mii_pins', 'pinmux_mmc_pins', 'pinmux_serial0_rtscts_pins', 'pinmux_serial0_rxtx_pins', 'pinmux_serial1_rtscts_pins', 'pinmux_serial1_rxtx_pins', 'pinmux_serial2_rtscts_pins', 'pinmux_serial2_rxtx_pins', 'pinmux_spi0_cs0', 'pinmux_spi0_cs3_pin', 'pinmux_spi0_pins', 'pinmux_spi1_cs0', 'pinmux_spi1_pins', 'vpif_capture_pins', 'vpif_display_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/da850-lego-ev3.dtb

pinmux@14120: 'gpio-range', 'pinmux_ecap0_pins', 'pinmux_ecap1_pins', 'pinmux_ecap2_pins', 'pinmux_ehrpwm0a_pins', 'pinmux_ehrpwm0b_pins', 'pinmux_ehrpwm1a_pins', 'pinmux_ehrpwm1b_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_lcd_pins', 'pinmux_mdio_pins', 'pinmux_mii_pins', 'pinmux_mmc_pins', 'pinmux_serial0_rtscts_pins', 'pinmux_serial0_rxtx_pins', 'pinmux_serial1_rtscts_pins', 'pinmux_serial1_rxtx_pins', 'pinmux_serial2_rtscts_pins', 'pinmux_serial2_rxtx_pins', 'pinmux_spi0_cs0', 'pinmux_spi0_cs3_pin', 'pinmux_spi0_pins', 'pinmux_spi1_cs0', 'pinmux_spi1_pins', 'vpif_capture_pins', 'vpif_display_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/da850-enbw-cmc.dtb

pinmux@2620690: 'pinmux_avsif_pins', 'pinmux_dfesync_rp1_pins', 'pinmux_gpio_dfeio_pins', 'pinmux_gpio_emifa_pins', 'pinmux_gpio_emu_pins', 'pinmux_gpio_spi2cs_pins', 'pinmux_gpio_timio_pins', 'pinmux_uart01_spi2_pins', 'pinmux_uart2_emifa_pins', 'pinmux_uart3_emifa_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/keystone-k2l-evm.dtb

pinmux@2621000: 'ecap0_pins', 'pinmux_dcan0_pins', 'pinmux_dcan1_pins', 'pinmux_emac_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_mcasp2_pins', 'pinmux_mdio_pins', 'pinmux_mmc0_pins', 'pinmux_mmc1_pins', 'pinmux_qspi_pins', 'pinmux_spi1_pins', 'pinmux_uart0_pins', 'pinmux_uart2_pins', 'pinmux_vout_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/keystone-k2g-evm.dtb

pinmux@2621000: 'pinmux_emac_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_mdio_pins', 'pinmux_mmc1_pins', 'pinmux_qspi_pins', 'pinmux_uart0_pins', 'pinmux_user_leds' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/keystone-k2g-ice.dtb

pinmux@30: 'aic33_pins', 'mcbsp2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap2420-n810.dtb

pinmux@30: 'backlight_pins_pinmux', 'hdq_pins', 'model', 'pinmux_bma180_pins', 'pinmux_bmp085_pins', 'pinmux_bt_pins', 'pinmux_camera_pins', 'pinmux_dss_dpi_pins', 'pinmux_gpmc_pins', 'pinmux_gps_pins', 'pinmux_hmc5843_pins', 'pinmux_hsusb2_pins', 'pinmux_irda', 'pinmux_itg3200_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcbsp4_pins', 'pinmux_mmc1_pins', 'pinmux_penirq_pins', 'pinmux_pps_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_wlan_irq_pin', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux@30: 'backlight_pins_pinmux', 'hdq_pins', 'pinmux_bma180_pins', 'pinmux_bmp085_pins', 'pinmux_bt_pins', 'pinmux_camera_pins', 'pinmux_dss_dpi_pins', 'pinmux_gps_pins', 'pinmux_hmc5843_pins', 'pinmux_hsusb2_pins', 'pinmux_irda', 'pinmux_itg3200_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcbsp4_pins', 'pinmux_mmc1_pins', 'pinmux_penirq_pins', 'pinmux_pps_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_wlan_irq_pin', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a5.dtb

pinmux@30: 'backlight_pins_pinmux', 'hdq_pins', 'pinmux_bma180_pins', 'pinmux_bmp085_pins', 'pinmux_camera_pins', 'pinmux_dss_dpi_pins', 'pinmux_gps_pins', 'pinmux_hmc5843_pins', 'pinmux_hsusb2_pins', 'pinmux_itg3200_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcbsp4_pins', 'pinmux_mmc1_pins', 'pinmux_penirq_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb

pinmux@30: 'fpga_boot0_pins', 'fpga_boot1_pins', 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_hsusbb2_pins', 'pinmux_i2c3_pins', 'pinmux_led_blue_pins', 'pinmux_led_green_pins', 'pinmux_led_red_pins', 'pinmux_lte430_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcspi1_pins', 'pinmux_mcspi3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_powerdown_input_pins', 'pinmux_poweroff_pins', 'pinmux_sound2_pins', 'pinmux_touchscreen_irq_pins', 'pinmux_touchscreen_wake_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wlan_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-ha-lcd.dtb

pinmux@30: 'fpga_boot0_pins', 'fpga_boot1_pins', 'pinmux_hsusbb2_pins', 'pinmux_i2c3_pins', 'pinmux_led_blue_pins', 'pinmux_led_green_pins', 'pinmux_led_red_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcspi1_pins', 'pinmux_mcspi3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_powerdown_input_pins', 'pinmux_poweroff_pins', 'pinmux_sound2_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wlan_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-ha.dtb

pinmux@30: 'hdq_pins', 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins1', 'pinmux_gpio_key_pins', 'pinmux_hsusb_otg_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_isp_pins', 'pinmux_led_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mm3_pins', 'pinmux_mmc1_pins', 'pinmux_panel_pwr_pins', 'pinmux_pwm_pins', 'pinmux_tsc2004_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dtb

pinmux@30: 'pinmux_accelerator_pins', 'pinmux_debug_led_pins', 'pinmux_display_pins', 'pinmux_dsi_pins', 'pinmux_mmc2_pins', 'pinmux_modem_core1_pins', 'pinmux_spi4_pins', 'pinmux_ssi_pins', 'pinmux_ssi_pins_idle', 'pinmux_uart2_pins', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-n950.dtb

pinmux@30: 'pinmux_accelerator_pins', 'pinmux_debug_led_pins', 'pinmux_mmc2_pins', 'pinmux_modem_core1_pins', 'pinmux_ssi_pins', 'pinmux_ssi_pins_idle', 'pinmux_uart2_pins', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-n9.dtb

pinmux@30: 'pinmux_acx565akm_pins', 'pinmux_camera', 'pinmux_debug_led_pins', 'pinmux_dss_sdi_pins', 'pinmux_ethernet_pins', 'pinmux_gpmc_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_mcspi4_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_modem', 'pinmux_ssi', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_wl1251' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-n900.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lb035_pins', 'pinmux_led_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_w3cbw003c_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-alto35.dtb
	arch/arm/boot/dts/omap3-overo-storm-alto35.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lb035_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_w3cbw003c_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-palo35.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo35.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lte430_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_w3cbw003c_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-palo43.dtb
	arch/arm/boot/dts/omap3-overo-storm-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-storm-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo43.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb0_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_sb_t35_audio_amp', 'pinmux_sb_t35_usb_hub_pins', 'pinmux_smsc1_pins', 'pinmux_smsc2_pins', 'pinmux_tfp410_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-sbc-t3530.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb0_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_sb_t35_audio_amp', 'pinmux_sb_t35_usb_hub_pins', 'pinmux_smsc1_pins', 'pinmux_smsc2_pins', 'pinmux_tfp410_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-sbc-t3730.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb0_pins', 'pinmux_i2c1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_smsc1_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-cm-t3530.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb0_pins', 'pinmux_i2c1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_smsc1_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-cm-t3730.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb1_phy_reset_pins', 'pinmux_hsusb2_phy_reset_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_aux_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_otg_drv_vbus', 'pinmux_sb_t35_audio_amp', 'pinmux_sb_t35_usb_hub_pins', 'pinmux_smsc2_pins', 'pinmux_tfp410_pins', 'pinmux_uart3_pins', 'pinmux_usb_hub_pins', 'pinmux_wl12xx_core_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-sbc-t3517.dtb

pinmux@30: 'pinmux_ads7846_pins', 'pinmux_dss_dpi_pins_cm_t35x', 'pinmux_dss_dpi_pins_common', 'pinmux_green_led_pins', 'pinmux_hsusb1_phy_reset_pins', 'pinmux_hsusb2_phy_reset_pins', 'pinmux_i2c1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_otg_drv_vbus', 'pinmux_uart3_pins', 'pinmux_usb_hub_pins', 'pinmux_wl12xx_core_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-cm-t3517.dtb

pinmux@30: 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_ethernet_pins', 'pinmux_hsusb1_rst_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_leds_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_pwm_pins', 'pinmux_rtc_pins', 'pinmux_tsc2004_pins', 'pinmux_uart2_pins', 'pinmux_wl12xx_buffer_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3517-evm.dtb

pinmux@30: 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_hsusbb2_pins', 'pinmux_i2c3_pins', 'pinmux_lte430_pins', 'pinmux_mcbsp3_pins', 'pinmux_mcspi1_pins', 'pinmux_mcspi3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wlan_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-thunder.dtb

pinmux@30: 'pinmux_button_pins', 'pinmux_dss_dpi_pins', 'pinmux_leds_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_penirq_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-pandora-1ghz.dtb
	arch/arm/boot/dts/omap3-pandora-600mhz.dtb

pinmux@30: 'pinmux_button_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_tps_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-echo.dtb

pinmux@30: 'pinmux_dp3t_sel_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_lp8720_en_pin', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_usb_otg_hs_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-sniper.dtb

pinmux@30: 'pinmux_dss_dpi_pins1', 'pinmux_gpio_key_pins', 'pinmux_hsusb2_pins', 'pinmux_hsusb_otg_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_lan9221_pins', 'pinmux_lcd_enable_pin', 'pinmux_led_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcspi1_pins', 'pinmux_mm3_pins', 'pinmux_mmc1_pins', 'pinmux_tsc2004_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dtb

pinmux@30: 'pinmux_dss_dpi_pins2', 'pinmux_ehci_port_select_pins', 'pinmux_hsusb2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_smsc911x_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-evm-37xx.dtb
	arch/arm/boot/dts/omap3-evm.dtb

pinmux@30: 'pinmux_dss_dpi_pins2', 'pinmux_hsusb2_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-beagle-xm-ab.dtb
	arch/arm/boot/dts/omap3-beagle-xm.dtb

pinmux@30: 'pinmux_dss_dpi_pins', 'pinmux_gpmc_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lbee1usjyc_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_smsc9221_pins', 'pinmux_tfp410_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0020.dtb

pinmux@30: 'pinmux_dss_dpi_pins', 'pinmux_gpmc_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lbep5clwmc_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_smsc9221_pins', 'pinmux_tfp410_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0020-rev-f.dtb

pinmux@30: 'pinmux_dss_dpi_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_w3cbw003c_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-storm-summit.dtb
	arch/arm/boot/dts/omap3-overo-storm-tobi.dtb
	arch/arm/boot/dts/omap3-overo-summit.dtb
	arch/arm/boot/dts/omap3-overo-tobi.dtb

pinmux@30: 'pinmux_dss_dpi_pins', 'pinmux_hsusb2_pins', 'pinmux_tfp410_pins', 'pinmux_twl4030_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-beagle-ab4.dtb
	arch/arm/boot/dts/omap3-beagle.dtb

pinmux@30: 'pinmux_dss_dpi_pins', 'pinmux_twl4030_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-devkit8000.dtb
	arch/arm/boot/dts/omap3-devkit8000-lcd43.dtb
	arch/arm/boot/dts/omap3-devkit8000-lcd70.dtb

pinmux@30: 'pinmux_gpio4_pins', 'pinmux_gpio5_pins', 'pinmux_hsusb1_pins', 'pinmux_hsusb_otg_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_lan9117_pins', 'pinmux_lcd_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_spi1_pins', 'pinmux_spi2_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-lilly-dbb056.dtb

pinmux@30: 'pinmux_gpio_key_pins', 'pinmux_mmc1_pins', 'pinmux_musb_pins', 'pinmux_twl4030_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-ldp.dtb

pinmux@30: 'pinmux_gpmc_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lbee1usjyc_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0030.dtb

pinmux@30: 'pinmux_gpmc_pins', 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_lbep5clwmc_pins', 'pinmux_leds_pins', 'pinmux_mcbsp2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0030-rev-g.dtb

pinmux@30: 'pinmux_hsusb2_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_twl4030_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_w3cbw003c_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-storm-tobiduo.dtb
	arch/arm/boot/dts/omap3-overo-tobiduo.dtb

pinmux@30: 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_mmc3_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-zoom3.dtb

pinmux@30: 'pinmux_tps_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3517-craneboard.dtb

pinmux@30: 'pinmux_twl4030_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3430-sdp.dtb

pinmux@40: 'gpio_led_pmx', 'pinmux_bt_pins', 'pinmux_button_pins', 'pinmux_dss_dpi_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hsusbb1_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcpdm_pins', 'pinmux_tfp410_pins', 'pinmux_tpd12s015_pins', 'pinmux_twl6030_pins', 'pinmux_twl6040_pins', 'pinmux_uart2_pins', 'pinmux_wl12xx_gpio', 'pinmux_wl12xx_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-panda-es.dtb

pinmux@40: 'palmas_msecure_pins', 'pinctrl_power_button_pin', 'pinmux_dss_hdmi_pins', 'pinmux_i2c1_pins', 'pinmux_i2c4_pins', 'pinmux_led_gpio_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcpdm_pins', 'pinmux_mcspi2_pins', 'pinmux_mcspi3_pins', 'pinmux_mmc3_pins', 'pinmux_tpd12s015_pins', 'pinmux_twl6040_pins', 'pinmux_uart1_pins', 'pinmux_uart3_pins', 'pinmux_uart5_pins', 'pinmux_usbhost_pins', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-igep0050.dtb

pinmux@40: 'palmas_msecure_pins', 'pinmux_dss_hdmi_pins', 'pinmux_evm_keys_gpio_pins', 'pinmux_i2c1_pins', 'pinmux_i2c5_pins', 'pinmux_led_gpio_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcpdm_pins', 'pinmux_mcspi2_pins', 'pinmux_mcspi3_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_tpd12s015_pins', 'pinmux_twl6040_pins', 'pinmux_uart1_pins', 'pinmux_uart3_pins', 'pinmux_uart5_pins', 'pinmux_usbhost_pins', 'pinmux_wlan_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-uevm.dtb

pinmux@40: 'pinmux_als_proximity_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hdmi_hpd_pins', 'pinmux_hdq_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcbsp3_pins', 'pinmux_mmc3_pins', 'pinmux_poweroff_pins', 'pinmux_tmp105_irq', 'pinmux_touchscreen_pins', 'pinmux_uart1_pins', 'pinmux_uart3_pins', 'pinmux_uart4_pins', 'pinmux_usb_gpio_mux_sel1_pins', 'pinmux_usb_mdm6600_pins', 'pinmux_usb_ulpi_pins', 'pinmux_usb_utmi_pins', 'pinmux_vibrator_direction_pin', 'pinmux_vibrator_enable_pin' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-droid4-xt894.dtb
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dtb

pinmux@40: 'pinmux_backlight_pins', 'pinmux_dss_dpi_pins', 'pinmux_dss_hdmi_pins', 'pinmux_gpio_key_pins', 'pinmux_gpio_led_pins', 'pinmux_hdmi_hpd_pins', 'pinmux_hsusbb1_phy_rst_pins', 'pinmux_hsusbb1_pins', 'pinmux_i2c1_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_ks8851_irq_pins', 'pinmux_mcpdm_pins', 'pinmux_mcsasp_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc4_pins', 'pinmux_mmc5_pins', 'pinmux_tsc2004_pins', 'pinmux_twl6030_pins', 'pinmux_twl6040_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_wl12xx_ctrl_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-var-dvk-om44.dtb
	arch/arm/boot/dts/omap4-var-stk-om44.dtb

pinmux@40: 'pinmux_button_pins', 'pinmux_dss_dpi_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hsusbb1_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcpdm_pins', 'pinmux_tfp410_pins', 'pinmux_tpd12s015_pins', 'pinmux_twl6030_pins', 'pinmux_twl6040_pins', 'pinmux_wl12xx_gpio', 'pinmux_wl12xx_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-panda-a4.dtb
	arch/arm/boot/dts/omap4-panda.dtb

pinmux@40: 'pinmux_button_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hsusb1phy_pins', 'pinmux_hsusbb1_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_led_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcpdm_pins', 'pinmux_mmc1_pins', 'pinmux_mmc5_pins', 'pinmux_smsc_pins', 'pinmux_twl6030_pins', 'pinmux_twl6040_pins', 'pinmux_w2cbw0015_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-duovero-parlor.dtb

pinmux@40: 'pinmux_dmic_pins', 'pinmux_dss_hdmi_pins', 'pinmux_enet_enable_gpio', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_ks8851_pins', 'pinmux_mcbsp1_pins', 'pinmux_mcbsp2_pins', 'pinmux_mcpdm_pins', 'pinmux_mcspi1_pins', 'pinmux_tpd12s015_pins', 'pinmux_twl6030_pins', 'pinmux_twl6040_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_uart4_pins', 'pinmux_wl12xx_gpio', 'pinmux_wl12xx_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-sdp.dtb
	arch/arm/boot/dts/omap4-sdp-es23plus.dtb

pinmux@40: 'pinmux_dss_dpi_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hdmi_conn_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c4_pins', 'pinmux_lcd_pins', 'pinmux_led_gpio_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_aux_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_mmc3_pins', 'pinmux_usbhost_pins', 'pinmux_wlan_gpios_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-sbc-t54.dtb

pinmux@40: 'pinmux_dss_dpi_pins', 'pinmux_dss_hdmi_pins', 'pinmux_hdmi_conn_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_lcd_pins', 'pinmux_led_gpio_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_mmc3_pins', 'pinmux_usbhost_pins', 'pinmux_wlan_gpios_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-cm-t54.dtb

pinmux@40: 'pinmux_hsusbb1_hub_rst_pins', 'pinmux_hsusbb1_phy_clk_pins', 'pinmux_lan7500_rst_pins', 'pinmux_twl6030_wkup_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-var-dvk-om44.dtb
	arch/arm/boot/dts/omap4-var-stk-om44.dtb

pinmux@40: 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_i2c3_pins', 'pinmux_i2c4_pins', 'pinmux_mmc2_pins', 'pinmux_twl6030_pins', 'pinmux_uart3_pins', 'pinmux_usb_otg_hs_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-kc1.dtb

pinmux@40: 'pinmux_leds_wkpins', 'pinmux_twl6030_wkup_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-panda-a4.dtb
	arch/arm/boot/dts/omap4-panda.dtb
	arch/arm/boot/dts/omap4-panda-es.dtb

pinmux@40: 'pinmux_twl6030_wkup_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-duovero-parlor.dtb
	arch/arm/boot/dts/omap4-kc1.dtb
	arch/arm/boot/dts/omap4-sdp.dtb
	arch/arm/boot/dts/omap4-sdp-es23plus.dtb

pinmux@40: 'pinmux_usb_gpio_mux_sel2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap4-droid4-xt894.dtb
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dtb

pinmux@480025a0: 'pinmux_button_pins', 'pinmux_hsusb2_2_pins', 'pinmux_led_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-storm-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-storm-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo35.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo43.dtb

pinmux@480025a0: 'pinmux_control_pins', 'pinmux_hsusb2_2_pins', 'pinmux_mmc3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-pandora-1ghz.dtb

pinmux@480025a0: 'pinmux_ehci_phy_pins', 'pinmux_hsusb2_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-evm-37xx.dtb

pinmux@480025a0: 'pinmux_gpio1_pins', 'pinmux_hsusb1_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-lilly-dbb056.dtb

pinmux@480025a0: 'pinmux_hsusb2_2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dtb
	arch/arm/boot/dts/omap3-beagle-xm-ab.dtb
	arch/arm/boot/dts/omap3-beagle-xm.dtb

pinmux@480025a0: 'pinmux_hsusb2_2_pins', 'pinmux_led_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-storm-summit.dtb

pinmux@480025a0: 'pinmux_hsusb2_2_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-storm-alto35.dtb
	arch/arm/boot/dts/omap3-overo-storm-tobi.dtb
	arch/arm/boot/dts/omap3-overo-storm-tobiduo.dtb

pinmux@480025a0: 'pinmux_hsusb2_2_pins', 'spi_gpio_pinmux' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux@480025a0: 'pinmux_hsusb2_core2_pins', 'pinmux_leds_core2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0030.dtb
	arch/arm/boot/dts/omap3-igep0030-rev-g.dtb

pinmux@480025a0: 'pinmux_hsusbb1_pins', 'pinmux_leds_pins', 'pinmux_mmc1_cd_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-igep0020.dtb
	arch/arm/boot/dts/omap3-igep0020-rev-f.dtb

pinmux@480025a0: 'pinmux_mmc3_2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-zoom3.dtb

pinmux@480025a0: 'pinmux_mmc3_core2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dtb

pinmux@480025a0: 'pinmux_mmc3_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-echo.dtb

pinmux@480025a0: 'pinmux_modem_core2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-n950.dtb
	arch/arm/boot/dts/omap3-n9.dtb

pinmux@480025d8: 'pinmux_button_pins', 'pinmux_hsusb2_2_pins', 'pinmux_led_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-palo35.dtb
	arch/arm/boot/dts/omap3-overo-palo43.dtb

pinmux@480025d8: 'pinmux_control_pins', 'pinmux_hsusb2_2_pins', 'pinmux_mmc3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-pandora-600mhz.dtb

pinmux@480025d8: 'pinmux_ehci_phy_pins', 'pinmux_hsusb2_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-evm.dtb

pinmux@480025d8: 'pinmux_hsusb1_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3517-evm.dtb

pinmux@480025d8: 'pinmux_hsusb2_2_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-beagle-ab4.dtb
	arch/arm/boot/dts/omap3-beagle.dtb

pinmux@480025d8: 'pinmux_hsusb2_2_pins', 'pinmux_led_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-summit.dtb

pinmux@480025d8: 'pinmux_hsusb2_2_pins', 'pinmux_w3cbw003c_2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-alto35.dtb
	arch/arm/boot/dts/omap3-overo-tobi.dtb
	arch/arm/boot/dts/omap3-overo-tobiduo.dtb

pinmux@800: 'backlight_pins', 'beeper_pins_default', 'beeper_pins_sleep', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'dcan0_default_pins', 'dcan0_sleep_pins', 'dcan1_default_pins', 'dcan1_sleep_pins', 'ddr_vtt_toggle_default', 'display_mux_pins', 'dss_pins', 'emmc_pins_default', 'emmc_pins_sleep', 'gpio0_pins', 'i2c0_pins', 'i2c1_pins', 'matrix_keypad_default', 'matrix_keypad_sleep', 'mcasp1_pins', 'mcasp1_sleep_pins', 'nand_flash_x8', 'pinmux_debugss_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins_default', 'pinmux_mmc3_pins_sleep', 'pinmux_wlan_pins_default', 'pinmux_wlan_pins_sleep', 'pixcir_ts_pins', 'uart0_pins_default', 'uart0_pins_sleep', 'uart3_pins', 'unused_pins', 'vpfe0_pins_default', 'vpfe0_pins_sleep', 'vpfe1_pins_default', 'vpfe1_pins_sleep' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-gp-evm.dtb

pinmux@800: 'backlight_pins', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'dcan1_pins_default', 'lcd_pins_s0', 'matrix_keypad_s0', 'mcasp1_pins', 'mcasp1_pins_sleep', 'nandflash_pins_s0', 'pinmux_clkout2_pin', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_wlan_pins', 'volume_keys_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-evm.dtb

pinmux@800: 'backlight_pins', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'dss_pins', 'edt_ft5306_ts_pins', 'i2c0_pins', 'i2c1_pins', 'lcd_pins', 'leds_pins', 'matrix_keypad_pins', 'mcasp1_pins', 'mcasp1_pins_sleep', 'pinmux_clkout1_pin', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins_default', 'pinmux_mmc3_pins_sleep', 'pinmux_uart1_bt_pins_default', 'pinmux_uart1_bt_pins_sleep', 'pinmux_wlan_pins_default', 'pinmux_wlan_pins_sleep', 'qspi_pins', 'usb1_pins', 'usb2_pins', 'vpfe0_pins_default', 'vpfe0_pins_sleep' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-sk-evm.dtb

pinmux@800: 'backlight_pins', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'gpio_keys_s0', 'lcd_pins_default', 'lcd_pins_sleep', 'mcasp1_pins', 'mcasp1_pins_sleep', 'pinmux_clkout2_pin', 'pinmux_i2c0_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_uart0_pins', 'pinmux_wl12xx_gpio', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-evmsk.dtb

pinmux@800: 'backlight_pins_default', 'backlight_pins_sleep', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'display_mux_pins', 'dss_pins', 'matrix_keypad_default', 'matrix_keypad_sleep', 'mcasp1_pins', 'mcasp1_sleep_pins', 'nand_flash_x8_default', 'nand_flash_x8_sleep', 'pinmux_hdq_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins_default', 'pinmux_mmc1_pins_sleep', 'pinmux_spi0_pins_default', 'pinmux_spi0_pins_sleep', 'pinmux_spi1_pins_default', 'pinmux_spi1_pins_sleep', 'pixcir_ts_pins_default', 'pixcir_ts_pins_sleep', 'qspi1_pins_default', 'qspi1_pins_sleep', 'uart0_pins_default', 'uart0_pins_sleep', 'unused_pins', 'usb2_phy1_default', 'usb2_phy1_sleep', 'usb2_phy2_default', 'usb2_phy2_sleep', 'vpfe1_pins_default', 'vpfe1_pins_sleep' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am43x-epos-evm.dtb

pinmux@800: 'backlight_pins_default', 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'gpio_keys_pins_default', 'i2c0_pins_default', 'i2c0_pins_sleep', 'i2c2_pins_default', 'i2c2_pins_sleep', 'pinmux_mmc1_pins_default', 'pinmux_mmc1_pins_sleep', 'qspi_pins_default', 'qspi_pins_sleep', 'spi1_pins_default', 'spi1_pins_sleep' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-idk-evm.dtb

pinmux@800: 'cm_t43_led_pins', 'cpsw_default', 'davinci_mdio_default', 'dss_pinctrl_default', 'emmc_pins', 'i2c0_pins', 'i2c1_pins', 'i2c2_pins', 'nand_flash_x8', 'pinmux_mmc1_pins', 'pinmux_spi0_pins', 'uart0_pins_default', 'usb2_phy1_default', 'usb2_phy2_default' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-sbc-t43.dtb

pinmux@800: 'cm_t43_led_pins', 'cpsw_default', 'davinci_mdio_default', 'emmc_pins', 'i2c0_pins', 'nand_flash_x8', 'pinmux_spi0_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am437x-cm-t43.dtb

pinmux@800: 'cpsw-default', 'cpsw-sleep', 'davinci-mdio-default', 'davinci-mdio-sleep', 'ethernet-interrupt', 'flash-enable', 'imu-interrupt', 'pinmux-clkout2-pin', 'user-leds-s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-osd3358-sm-red.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'i2c0_pins_default', 'mmc0_pins_default', 'spi0_pins_default', 'uart3_pins_default', 'user_leds' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-icev2.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'lcd_pins_default', 'lcd_pins_sleep', 'pinmux_bluetooth_pins', 'pinmux_dcan0_pins', 'pinmux_dcan1_pins', 'pinmux_ecap0_pins', 'pinmux_gpio_led_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_mcasp1_pins', 'pinmux_mmc1_pins', 'pinmux_nandflash_pins', 'pinmux_spi0_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_wifi_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sbc-t335.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'led_gpio_pins', 'nandflash_pins', 'pinmux_i2c0_pins', 'pinmux_sd_card', 'pinmux_uart0_pins', 'usb1_drvvbus' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-chiliboard.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'mcasp0_pins', 'nxp_hdmi_bonelt_off_pins', 'nxp_hdmi_bonelt_pins', 'pinmux_bt_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart3_pins', 'pinmux_wl18xx_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-boneblack-wireless.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'mcasp0_pins', 'nxp_hdmi_bonelt_off_pins', 'nxp_hdmi_bonelt_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_lps3331ap_pins', 'pinmux_mmc1_pins', 'pinmux_mpu6050_pins', 'pinmux_uart0_pins', 'usb_hub_ctrl', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sancloud-bbe.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'mcasp0_pins', 'nxp_hdmi_bonelt_off_pins', 'nxp_hdmi_bonelt_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_uart0_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-boneblack.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_dcan1_pins', 'pinmux_i2c1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_tca6416_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_user_leds', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-baltos-ir5221.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_dcan1_pins', 'pinmux_i2c1_pins', 'pinmux_mmc2_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_user_leds', 'pinmux_wl12xx_gpio', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-netcan-plus-1xx.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_dip_switches', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_mmc2_pins', 'pinmux_tca6416_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-netcom-plus-8xx.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_i2c1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_tca6416_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_user_leds', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-baltos-ir3220.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_i2c1_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_user_leds', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-baltos-ir2110.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'nandflash_pins_s0', 'pinmux_i2c1_pins', 'pinmux_mmc2_pins', 'pinmux_tps65910_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_user_leds', 'pinmux_wl12xx_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-netcom-plus-2xx.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_audio_mclk_pins', 'pinmux_audio_pa_pins', 'pinmux_audio_pins', 'pinmux_backlight0_pins', 'pinmux_backlight1_pins', 'pinmux_ehrpwm1a_pins', 'pinmux_emmc_pins', 'pinmux_emmc_pwrseq_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_lcd_pins', 'pinmux_led_pins', 'pinmux_lwb_pins', 'pinmux_mmc1_pins', 'pinmux_rtc0_irq_pins', 'pinmux_spi0_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart4_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sl50.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_bb_spi0_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_uart0_pins', 'usb_hub_ctrl', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sancloud-bbe-lite.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_bluetooth_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'usb_hub_ctrl', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_bluetooth_pins', 'pinmux_dcan0_pins', 'pinmux_dcan1_pins', 'pinmux_ecap0_pins', 'pinmux_gpio_led_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_mcasp1_pins', 'pinmux_mmc1_pins', 'pinmux_nandflash_pins', 'pinmux_spi0_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_wifi_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-cm-t335.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_bt_pins', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart3_pins', 'pinmux_wl18xx_pins', 'uart2_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-bonegreen-wireless.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_clkout2_pin', 'pinmux_ehrpwm1', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_mmc1_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart1', 'pinmux_uart2_pins', 'pinmux_uart4_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-shc.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_uart0_pins', 'uart2_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-bonegreen.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_clkout2_pin', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_uart0_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-bone.dtb

pinmux@800: 'cpsw_default', 'cpsw_sleep', 'davinci_mdio_default', 'davinci_mdio_sleep', 'pinmux_emmc_pins', 'pinmux_i2c0_pins', 'pinmux_mmc1_pins', 'pinmux_uart0_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-lxm.dtb

pinmux@800: 'cpsw_default', 'davinci_mdio_default', 'lcd_pins_s0', 'pinmux_clkout2_pin', 'pinmux_dcan0_pins', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_spi1_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart3_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-pdu001.dtb

pinmux@800: 'cpsw_default', 'davinci_mdio_default', 'pinmux_i2c0_pins', 'pinmux_i2c1_pins', 'pinmux_minipcie', 'pinmux_mmc0_pins', 'pinmux_mmc2_pins', 'pinmux_push_button', 'pinmux_spi0', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dtb

pinmux@800: 'cpsw_default', 'davinci_mdio_default', 'pinmux_i2c0_pins', 'pinmux_mmc1_pins', 'pinmux_push_button', 'pinmux_spi0', 'pinmux_spi1', 'pinmux_uart0_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-moxa-uc-2101.dtb

pinmux@800: 'gpio_led_bl_pins', 'pinmux_clkout2_pin', 'pinmux_dmtimer7_pins', 'pinmux_guardian_button_pins', 'pinmux_guardian_led_pins', 'pinmux_i2c0_pins', 'pinmux_interface_pins', 'pinmux_lcd_disen_pins', 'pinmux_lcd_pins_default', 'pinmux_lcd_pins_sleep', 'pinmux_mmc1_pins', 'pinmux_nandflash_pins', 'pinmux_spi0_pins', 'pinmux_uart0_pins', 'pinmux_uart2_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-guardian.dtb

pinmux@800: 'gpmc_pins', 'i2c0_pins', 'misc_pins', 'mmc1_pins', 'uart0_pins', 'uart1_pins', 'uart2_pins', 'uart3_pins', 'uart4_pins', 'uart5_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-nano.dtb

pinmux@800: 'nandflash_pins', 'pinmux_mcspi1_pins', 'pinmux_mmc_pins', 'pinmux_usb0_pins', 'pinmux_usb1_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dm8168-evm.dtb

pinmux@800: 'pinmux_accel', 'pinmux_audio', 'pinmux_emmc', 'pinmux_ethernet', 'pinmux_i2c0', 'pinmux_i2c1', 'pinmux_lcd', 'pinmux_mdio', 'pinmux_sd_card', 'pinmux_spi0', 'pinmux_uart0', 'pinmux_uart1', 'pinmux_usb', 'pinmux_user_buttons', 'pinmux_user_leds', 'pinmux_wireless' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-pepper.dtb

pinmux@800: 'pinmux_bt_pins', 'pinmux_dcan1_pins', 'pinmux_eqep0_pins', 'pinmux_eqep1_pins', 'pinmux_eqep2_pins', 'pinmux_i2c2_pins', 'pinmux_mmc1_pins', 'pinmux_mmc2_pins', 'pinmux_mmc3_pins', 'pinmux_uart0_pins', 'pinmux_uart1_pins', 'pinmux_uart2_pins', 'pinmux_uart3_pins', 'pinmux_uart4_pins', 'pinmux_uart5_pins', 'pinmux_wl18xx_pins', 'user_leds_s0' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-boneblue.dtb

pinmux@800: 'pinmux_cb_gpio', 'pinmux_dcan1', 'pinmux_emmc_pins', 'pinmux_ethernet0', 'pinmux_ethernet1', 'pinmux_i2c0', 'pinmux_mdio', 'pinmux_mmc1_pins', 'pinmux_nandflash', 'pinmux_spi0', 'pinmux_uart0', 'pinmux_uart1', 'pinmux_uart2', 'pinmux_uart3', 'pinmux_user_buttons', 'pinmux_user_leds' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-phycore-rdk.dtb

pinmux@800: 'pinmux_dcan0_pins_default', 'pinmux_dcan0_pins_sleep', 'pinmux_dcan1_pins_default', 'pinmux_dcan1_pins_sleep', 'pinmux_ehrpwm0_pins_default', 'pinmux_ehrpwm0_pins_sleep', 'pinmux_eth_slave1_pins_default', 'pinmux_eth_slave1_pins_sleep', 'pinmux_eth_slave2_pins_default', 'pinmux_eth_slave2_pins_sleep', 'pinmux_gpio_buttons_pins', 'pinmux_i2c0_pins_default', 'pinmux_i2c0_pins_gpio', 'pinmux_i2c0_pins_sleep', 'pinmux_i2c1_pins_default', 'pinmux_i2c1_pins_gpio', 'pinmux_i2c1_pins_sleep', 'pinmux_lcdc_pins_default', 'pinmux_lcdc_pins_sleep', 'pinmux_led_mod_pins', 'pinmux_leds_pins', 'pinmux_mcasp0_pins_default', 'pinmux_mcasp0_pins_sleep', 'pinmux_mdio_pins_default', 'pinmux_mdio_pins_sleep', 'pinmux_mmc1_pins_default', 'pinmux_mmc1_pins_sleep', 'pinmux_nand_pins_default', 'pinmux_nand_pins_sleep', 'pinmux_uart0_pins', 'pinmux_uart1_pins_default', 'pinmux_uart1_pins_sleep', 'pinmux_uart2_pins_default', 'pinmux_uart2_pins_sleep', 'pinmux_usb_pins' do not match any of the rege
 xes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-myirtech-myd.dtb

pinmux@800: 'pinmux_dcan1', 'pinmux_emmc_pins', 'pinmux_ethernet0', 'pinmux_ethernet1', 'pinmux_i2c0', 'pinmux_mcasp0', 'pinmux_mdio', 'pinmux_mmc1', 'pinmux_nandflash', 'pinmux_spi0', 'pinmux_uart0', 'pinmux_uart1_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-wega-rdk.dtb

pinmux@800: 'pinmux_dcan1', 'pinmux_emmc_pins', 'pinmux_ethernet0', 'pinmux_ethernet1', 'pinmux_i2c0', 'pinmux_mdio', 'pinmux_mmc1', 'pinmux_nandflash', 'pinmux_spi0', 'pinmux_uart0', 'pinmux_uart1_rs485_pins', 'pinmux_uart2', 'pinmux_user_gpios', 'pinmux_user_leds' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-regor-rdk.dtb

pinmux@800: 'pinmux_gpio1_pins', 'pinmux_gpio2_pins', 'pinmux_gpio4_pins', 'pinmux_mmc2_pins', 'pinmux_spi2_pins', 'pinmux_spi4_pins', 'pinmux_usb0_pins', 'pinmux_usb1_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3874-iceboard.dtb

pinmux@800: 'pinmux_i2c0_pins', 'pinmux_leds_base_pins', 'pinmux_leds_pins', 'pinmux_nandflash_pins', 'pinmux_nxp_hdmi_off_pins', 'pinmux_nxp_hdmi_pins', 'pinmux_uart0_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-base0033.dtb

pinmux@800: 'pinmux_P1_34_gpio', 'pinmux_P2_02_gpio', 'pinmux_P2_03_gpio', 'pinmux_P2_04_gpio', 'pinmux_P2_06_gpio', 'pinmux_P2_08_gpio', 'pinmux_P2_10_gpio', 'pinmux_P2_17_gpio', 'pinmux_P2_18_gpio', 'pinmux_P2_19_gpio', 'pinmux_P2_22_gpio', 'pinmux_P2_24_gpio', 'pinmux_P2_33_gpio' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-pocketbeagle.dtb

pinmux@800: 'pinmux_sd1_pins', 'pinmux_usb0_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dra62x-j5eco-evm.dtb

pinmux@800: 'pinmux_sd1_pins', 'pinmux_usb0_pins', 'pinmux_usb1_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dm8148-evm.dtb

pinmux@800: 'pinmux_sd2_pins', 'pinmux_usb0_pins', 'pinmux_usb1_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/dm8148-t410.dtb

pinmux@803000: 'audio_out_pmx_func', 'board_pmx_pins', 'emmc_pmx_func', 'emmc_pmx_idle', 'gpio-range', 'gpio_key_func', 'i2c0_pmx_func', 'i2c0_pmx_idle', 'i2c1_pmx_func', 'i2c1_pmx_idle', 'i2c2_pmx_func', 'i2c2_pmx_idle', 'i2c3_pmx_func', 'i2c3_pmx_idle', 'kpc_pmx_func', 'kpc_pmx_idle', 'nand_pmx_func', 'nand_pmx_idle', 'ranges', 'sd_pmx_func', 'sd_pmx_idle', 'sdio_pmx_func', 'sdio_pmx_idle', 'spi0_pmx_func', 'spi0_pmx_idle', 'spi1_pmx_func', 'spi1_pmx_idle', 'uart0_pmx_func', 'uart0_pmx_idle', 'uart1_pmx_func', 'uart1_pmx_idle', 'uart2_pmx_func', 'uart2_pmx_idle', 'uart3_pmx_func', 'uart3_pmx_idle', 'uart4_pmx_func', 'uart4_pmx_idle' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/hi3620-hi4511.dtb

pinmux@803000: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/hi3620-hi4511.dtb

pinmux@803800: 'audio_out_cfg_func', 'board_np_pins', 'board_pd_pins', 'board_pd_ps_pins', 'board_ps_pins', 'board_pu_pins', 'emmc_cfg_func', 'i2c0_cfg_func', 'i2c1_cfg_func', 'i2c2_cfg_func', 'i2c3_cfg_func', 'kpc_cfg_func', 'nand_cfg_func1', 'nand_cfg_func2', 'ranges', 'sd_cfg_func1', 'sd_cfg_func2', 'sdio_cfg_func', 'spi0_cfg_func1', 'spi0_cfg_func2', 'spi1_cfg_func1', 'spi1_cfg_func2', 'uart0_cfg_func', 'uart0_cfg_idle', 'uart1_cfg_func', 'uart1_cfg_idle', 'uart2_cfg_func', 'uart2_cfg_idle', 'uart3_cfg_func', 'uart3_cfg_idle', 'uart4_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/hi3620-hi4511.dtb

pinmux@803800: #size-cells:0:0: 0 was expected
	arch/arm/boot/dts/hi3620-hi4511.dtb

pinmux@840: 'pinmux_ads7846_pins', 'pinmux_palmas_sys_nirq_pins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-cm-t54.dtb
	arch/arm/boot/dts/omap5-sbc-t54.dtb

pinmux@840: 'pinmux_palmas_sys_nirq_pins', 'pinmux_usbhost_wkup_pins', 'pinmux_wlcore_irq_pin' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap5-igep0050.dtb
	arch/arm/boot/dts/omap5-uevm.dtb

pinmux@a00: 'pinmux_backlight_pins', 'pinmux_hsusb1_reset_pin', 'pinmux_led_pins_wkup', 'pinmux_twl4030_vpins', 'pinmux_wl127x_gpio_pin' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dtb

pinmux@a00: 'pinmux_button_pins', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-overo-alto35.dtb
	arch/arm/boot/dts/omap3-overo-storm-alto35.dtb

pinmux@a00: 'pinmux_dss_dpi_pins1', 'pinmux_gpio1_pins', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-beagle-xm-ab.dtb
	arch/arm/boot/dts/omap3-beagle-xm.dtb

pinmux@a00: 'pinmux_dss_dpi_pins1', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-evm-37xx.dtb
	arch/arm/boot/dts/omap3-evm.dtb

pinmux@a00: 'pinmux_dss_dpi_pins_cm_t3730', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-cm-t3730.dtb
	arch/arm/boot/dts/omap3-sbc-t3730.dtb

pinmux@a00: 'pinmux_gpio1_pins', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-beagle-ab4.dtb
	arch/arm/boot/dts/omap3-beagle.dtb
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux@a00: 'pinmux_gpio_key_pins_wkup', 'pinmux_isp1763_pins', 'pinmux_lan9221_pins', 'pinmux_mmc1_cd', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dtb

pinmux@a00: 'pinmux_lan9221_pins', 'pinmux_mmc1cd_pins', 'pinmux_tsc2048_pins', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-lilly-dbb056.dtb

pinmux@a00: 'pinmux_mmc1_cd_pin', 'pinmux_twl4030_vpins' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-sniper.dtb

pinmux@a00: 'pinmux_twl4030_vpins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3430-sdp.dtb
	arch/arm/boot/dts/omap3-cm-t3530.dtb
	arch/arm/boot/dts/omap3-devkit8000.dtb
	arch/arm/boot/dts/omap3-devkit8000-lcd43.dtb
	arch/arm/boot/dts/omap3-devkit8000-lcd70.dtb
	arch/arm/boot/dts/omap3-ha.dtb
	arch/arm/boot/dts/omap3-ha-lcd.dtb
	arch/arm/boot/dts/omap3-igep0020.dtb
	arch/arm/boot/dts/omap3-igep0020-rev-f.dtb
	arch/arm/boot/dts/omap3-igep0030.dtb
	arch/arm/boot/dts/omap3-igep0030-rev-g.dtb
	arch/arm/boot/dts/omap3-ldp.dtb
	arch/arm/boot/dts/omap3-n900.dtb
	arch/arm/boot/dts/omap3-overo-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-palo35.dtb
	arch/arm/boot/dts/omap3-overo-palo43.dtb
	arch/arm/boot/dts/omap3-overo-storm-chestnut43.dtb
	arch/arm/boot/dts/omap3-overo-storm-gallop43.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo35.dtb
	arch/arm/boot/dts/omap3-overo-storm-palo43.dtb
	arch/arm/boot/dts/omap3-overo-storm-summit.dtb
	arch/arm/boot/dts/omap3-overo-storm-tobi.dtb
	arch/arm/boot/dts/omap3-overo-storm-tobiduo.dtb
	arch/arm/boot/dts/omap3-overo-summit.dtb
	arch/arm/boot/dts/omap3-overo-tobi.dtb
	arch/arm/boot/dts/omap3-overo-tobiduo.dtb
	arch/arm/boot/dts/omap3-pandora-1ghz.dtb
	arch/arm/boot/dts/omap3-pandora-600mhz.dtb
	arch/arm/boot/dts/omap3-sbc-t3530.dtb
	arch/arm/boot/dts/omap3-thunder.dtb

pinmux@a00: 'pinmux_wl12xx_wkup_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3517-evm.dtb
	arch/arm/boot/dts/omap3-cm-t3517.dtb
	arch/arm/boot/dts/omap3-sbc-t3517.dtb

pinmux@a00: 'pinmux_wlan_host_wkup_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-zoom3.dtb

pinmux@e896c000: 'cam0_pwd_n_pmx_func', 'cam0_rst_pmx_func', 'cam1_pwd_n_pmx_func', 'cam1_rst_pmx_func', 'i2c3_pmx_func', 'i2c4_pmx_func', 'isp0_pmx_func', 'isp1_pmx_func', 'uart0_pmx_func', 'uart2_pmx_func', 'uart3_pmx_func', 'uart4_pmx_func', 'uart6_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@e896c000: 'cam0_rst_pmx_func', 'cam1_rst_pmx_func', 'csi0_pwd_n_pmx_func', 'csi1_pwd_n_pmx_func', 'i2c3_pmx_func', 'i2c4_pmx_func', 'isp0_pmx_func', 'isp1_pmx_func', 'pcie_perstn_pmx_func', 'pmu_pmx_func', 'pwr_key_pmx_func', 'uart0_pmx_func', 'uart1_pmx_func', 'uart2_pmx_func', 'uart3_pmx_func', 'uart4_pmx_func', 'uart5_pmx_func', 'uart6_pmx_func', 'usbhub5734_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@e896c800: 'cam0_pwd_n_cfg_func', 'cam0_rst_cfg_func', 'cam1_pwd_n_cfg_func', 'cam1_rst_cfg_func', 'i2c3_cfg_func', 'i2c4_cfg_func', 'isp0_cfg_func', 'isp1_cfg_func', 'uart0_cfg_func', 'uart2_cfg_func', 'uart3_cfg_func', 'uart4_cfg_func', 'uart6_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@e896c800: 'cam0_rst_cfg_func', 'cam1_rst_cfg_func', 'csi0_pwd_n_cfg_func', 'csi1_pwd_n_cfg_func', 'i2c3_cfg_func', 'isp0_cfg_func', 'isp1_cfg_func', 'pmu_cfg_func', 'pwr_key_cfg_func', 'uart0_cfg_func', 'uart1_cfg_func', 'uart2_cfg_func', 'uart3_cfg_func', 'uart4_cfg_func', 'uart5_cfg_func', 'uart6_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@f7010000: 'bl_pwm_pmx_func', 'boot_sel_pmx_func', 'bt_pmx_func', 'codec_clk_pmx_func', 'codec_pmx_func', 'emmc_pmx_func', 'fm_pmx_func', 'gpio-range', 'hkadc_ssi_pmx_func', 'i2c0_pmx_func', 'i2c1_pmx_func', 'i2c2_pmx_func', 'isp_pmx_func', 'pwm_in_pmx_func', 'sd_pmx_func', 'sd_pmx_idle', 'sdio_pmx_func', 'sdio_pmx_idle', 'spi0_pmx_func', 'uart0_pmx_func', 'uart1_pmx_func', 'uart2_pmx_func', 'uart3_pmx_func', 'uart4_pmx_func', 'uart5_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@f7010000: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@f7010800: 'bl_pwm_cfg_func', 'boot_sel_cfg_func', 'bt_cfg_func', 'bt_cfg_idle', 'codec_cfg_func1', 'codec_cfg_func2', 'codec_cfg_idle2', 'codec_clk_cfg_func', 'codec_clk_cfg_idle', 'emmc_cfg_func', 'emmc_clk_cfg_func', 'emmc_rst_cfg_func', 'fm_cfg_func', 'hkadc_ssi_cfg_func', 'i2c0_cfg_func', 'i2c1_cfg_func', 'i2c2_cfg_func', 'isp_cfg_func1', 'isp_cfg_func2', 'isp_cfg_idle1', 'pwm_in_cfg_func', 'sd_cfg_func', 'sd_cfg_idle', 'sd_clk_cfg_func', 'sd_clk_cfg_idle', 'sdio_cfg_func', 'sdio_cfg_idle', 'sdio_clk_cfg_func', 'sdio_clk_cfg_idle', 'spi0_cfg_func', 'uart0_cfg_func1', 'uart0_cfg_func2', 'uart1_cfg_func1', 'uart1_cfg_func2', 'uart2_cfg_func', 'uart3_cfg_func', 'uart4_cfg_func', 'uart5_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@f7010800: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@f8001800: 'jtag_tdo_cfg_func', 'pmu_peri_en_cfg_func', 'rf_reset_cfg_func', 'rstout_n_cfg_func', 'sysclk0_en_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@f8001800: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb

pinmux@fc182000: 'sdio_pmx_func' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@fc182800: 'sdio_cfg_func', 'sdio_clk_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@ff37e000: 'sd_pmx_func' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@ff37e800: 'sd_cfg_func', 'sd_clk_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@ff3b6000: 'spi3_pmx_func', 'ufs_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@ff3b6800: 'spi3_cfg_func', 'ufs_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@ff3fd000: 'sdio_pmx_func' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@ff3fd800: 'sdio_cfg_func', 'sdio_clk_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@fff11000: 'gpio185_pmx_func', 'gpio185_pmx_idle', 'i2c0_pmx_func', 'i2c1_pmx_func', 'i2c2_pmx_func', 'i2s2_pmx_func', 'pcie_clkreq_pmx_func', 'pd_pmx_func', 'pwr_key_pmx_func', 'spi0_pmx_func', 'spi2_pmx_func', 'spi3_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@fff11000: 'i2c0_pmx_func', 'i2c1_pmx_func', 'i2c7_pmx_func', 'i2s0_pmx_func', 'i2s2_pmx_func', 'pcie_pmx_func', 'slimbus_pmx_func', 'spi2_pmx_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux@fff11800: 'gpio185_cfg_func', 'gpio185_cfg_idle', 'i2c0_cfg_func', 'i2c1_cfg_func', 'i2c2_cfg_func', 'i2s2_cfg_func', 'pcie_clkreq_cfg_func', 'pwr_key_cfg_func', 'spi0_cfg_func', 'spi0_clk_cfg_func', 'spi2_cfg_func', 'spi2_clk_cfg_func', 'spi3_cfg_func', 'spi3_clk_cfg_func', 'usb_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb

pinmux@fff11800: 'i2c0_cfg_func', 'i2c1_cfg_func', 'i2c7_cfg_func', 'i2s0_cfg_func', 'i2s2_cfg_func', 'pcie_cfg_func', 'slimbus_cfg_func', 'spi2_cfg_func', 'usb_cfg_func' do not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb

pinmux_mcbsp1@48002274: $nodename:0: 'pinmux_mcbsp1@48002274' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux_mcbsp1@48002274: 'pinmux_mcbsp1_devconf0_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux_tv_out@480022d8: $nodename:0: 'pinmux_tv_out@480022d8' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

pinmux_tv_out@480022d8: 'pinmux_tv_acbias_devconf1_pins' does not match any of the regexes: '-pins((.*)?)$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/omap3-gta04a3.dtb
	arch/arm/boot/dts/omap3-gta04a4.dtb
	arch/arm/boot/dts/omap3-gta04a5.dtb
	arch/arm/boot/dts/omap3-gta04a5one.dtb

