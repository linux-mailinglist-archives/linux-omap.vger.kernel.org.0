Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37743A441B
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 16:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhFKOdg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 10:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhFKOdg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 10:33:36 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDE9C061574
        for <linux-omap@vger.kernel.org>; Fri, 11 Jun 2021 07:31:29 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id d9so31326292ioo.2
        for <linux-omap@vger.kernel.org>; Fri, 11 Jun 2021 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=tJAR4vhVYOMfAtGex75lvXy3xP/Y9fwTx3Q/gNq0NiE=;
        b=FtTie2ljiy8+5ZZ15/Dw2KOXfTzWQSIfw+30xnrAzvrXp2hcbSxymVBmIOr3GhoPHt
         S7/66eOXmjkwxM89aZW818N4QmMeGhKPTG+d9MBKUybQmKjU9bs+VhGU00GPAUQOM/QF
         BdPj+1HqyqJJ+Y9OujoXiZNvGGWaL0a0+2Tc9sUJykuCrxbZx+A1U5LmbCprRjy3/WHH
         wi2dsvPZa5eTlArtpofnh2BvY4zLuakEX99zT6uv7tb0hwt+fnQqNx0wsmFXg/klhLFV
         jqaSypcrjoLRwrF34QG74wWiAu58W2td1Ao8McAeVvvpSI8DF2jUFQ2JApTPHCHew+jx
         mxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=tJAR4vhVYOMfAtGex75lvXy3xP/Y9fwTx3Q/gNq0NiE=;
        b=hplHRcpHC81IT61/V8nsKa+vrzWVohE+vG7xdLpn9BRdHh45tef1Ue0KTCThMdFqh2
         sp80nAHJ6w+1Ry72+2Pk3zZz03RYJ+vNudPhOlw5Ee6pJ06858HNYuv7clBKG7DXv0/D
         g0I3eGEwwC5vZ3XSoSE2kPviUIWg5WNGBP2FiZCKqWF2ORwHsi7oGBVucTxs0CE+xqD2
         wymRTGgvdqOLSzbMVJ4uLtykN04Bk4Vbaz80taAk6tI937abdlySEbUvzlTfFDTW8ko5
         YlT2216dVDWbss3csleuNjrOSZPP5+FPO37UcttujSGhlxcYs5cyI4akp+IFi1oSHPmA
         pSsQ==
X-Gm-Message-State: AOAM530ZLNPzHWrJBy30YxufYic5TsahPEHWkr7rhpu8nEqbW/yRALgr
        BYGFZxpB6V5ujUItF+KQL0gwshi49zjKgFDpVHbBRQgchDLMeQ==
X-Google-Smtp-Source: ABdhPJzav0Sf15t1RRPSiya+pnYgdCwIXDSt+QfPv2MvavWG+JoD6nxZ7jgZY9fK9aO+8mdFqinKcGRqNjkcKhQX2hQ=
X-Received: by 2002:a05:6638:140c:: with SMTP id k12mr4360939jad.126.1623421888518;
 Fri, 11 Jun 2021 07:31:28 -0700 (PDT)
MIME-Version: 1.0
From:   Mighty M <mightymb17@gmail.com>
Date:   Fri, 11 Jun 2021 20:01:17 +0530
Message-ID: <CACLAQJE+bybY4SZx==M0_MY+_S9-r7F=Go9HOi2WjwNXfSsdeQ@mail.gmail.com>
Subject: Patches for espresso3g
To:     philipp@uvos.xyz
Cc:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adding support for Samsung Galaxy Tab 2 (7 inch)
Cc: linux-omap@vger.kernel.org
---
diff --git a/arch/arm/boot/dts/omap4-samsung-espresso3g.dts
b/arch/arm/boot/dts/omap4-samsung-espresso3g.dts
new file mode 100644
index 0000000..9c1b14d
--- /dev/null
+++ b/arch/arm/boot/dts/omap4-samsung-espresso3g.dts
@@ -0,0 +1,504 @@
+/dts-v1/;
+#include "dt-bindings/gpio/gpio.h"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "omap443x.dtsi"
+
+/ {
+    model = "Samsung Galaxy Tab 2 3g 7-inch";
+    compatible = "samsung,espresso3g", "ti,omap4430", "ti,omap4";
+
+    memory@80000000 {
+        device_type = "memory";
+        reg = <0x80000000 0x40000000>; /* 1 GB */
+    };
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        ramoops_region@A0000000 {
+            no-map;
+
+            reg = <0xA0000000 0x200000>;
+
+        };
+
+        continuous_splash: framebuffer@bef00000{
+            reg = <0xbef00000 (1024 * 600 * 4)>;
+            no-map;
+        };
+    };
+
+    chosen {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
+
+    i2c-gpio-7 {
+        compatible = "i2c-gpio";
+        sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        i2c-gpio,delay-us = <3>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fuel-gauge@36 {
+            compatible = "maxim,max17042";
+            reg = <0x36>;
+            pinctrl-0 = <&fuel_alert_irq>;
+            pinctrl-names = "default";
+            interrupt-parent = <&gpio2>;
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+            maxim,rsns-microohm = <10000>;
+            //maxim,cold-temp = <-50>;
+            maxim,over-heat-temp = <500>;
+            maxim,dead-volt = <2500>;
+            maxim,over-volt = <4300>;
+        };
+    };
+
+    reg_espresso_vwlan: regulator-espresso-vwlan {
+        pinctrl-names = "default";
+        pinctrl-0 = <&wlanen_gpio>;
+        compatible = "regulator-fixed";
+        regulator-name = "vwl1271";
+        regulator-max-microvolt = <2000000>;
+        regulator-min-microvolt = <2000000>;
+        gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+        startup-delay-us = <70000>;
+        regulator-always-on;
+        enable-active-high;
+    };
+
+    reg_espresso_internal: regulator-espresso-internal {
+        compatible = "regulator-fixed";
+        regulator-name = "eMMC_LDO";
+        regulator-max-microvolt = <1800000>;
+        regulator-min-microvolt = <1800000>;
+        gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+        startup-delay-us = <100000>;
+        regulator-boot-on;
+        regulator-always-on;
+        enable-active-high;
+    };
+
+    reg_espresso_external: regulator-espresso-external {
+        compatible = "regulator-fixed";
+        regulator-name = "vmmc2";
+        regulator-max-microvolt = <2800000>;
+        regulator-min-microvolt = <2800000>;
+        gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+        regulator-always-on;
+        enable-active-high;
+    };
+
+    reg_touch_ldo_en: regulator-touch-ldo-en  {
+        compatible = "regulator-fixed";
+        regulator-name = "touch_ldo_en";
+        gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+        regulator-always-on;
+        enable-active-high;
+    };
+
+    reg_lcd: regulator-lcd  {
+        compatible = "regulator-fixed";
+        regulator-name = "lcd_en";
+        gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        //regulator-always-on;
+        regulator-boot-on;
+    };
+
+    pwm10: dmtimer-pwm-10 {
+        pinctrl-names = "default";
+        pinctrl-0 = <&pwm10_default>;
+
+        compatible = "ti,omap-dmtimer-pwm";
+        #pwm-cells = <3>;
+        ti,timers = <&timer10>;
+        ti,clock-source = <0x01>;
+    };
+
+    backlight: backlight {
+        compatible = "pwm-backlight";
+        pinctrl-names = "default";
+        pinctrl-0 = <&backlight_pins>;
+        pwms = <&pwm10 0 500000 0>;
+        power-supply = <&reg_lcd>;
+        enable-gpios = <&gpio3 31 0>;
+        brightness-levels = <0 4 8 16 32 64 128 255>;
+        default-brightness-level = <7>;
+    };
+
+    lvds-encoder {
+        compatible = "lvds-encoder", "doestek,dtc34lm85am";
+        powerdown-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+        power-supply = <&reg_lcd>;
+        ports {
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                bridge_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                bridge_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+
+    panel {
+        compatible ="samsung,ltn070nl01", "panel-lvds";
+        power-supply = <&reg_lcd>;
+        width-mm = <154>;
+        height-mm = <90>;
+        data-mapping = "jeida-24";
+        backlight = <&backlight>;
+        panel-timing {
+            clock-frequency = <28444445>;
+
+            hback-porch = <210>;
+            hactive = <1024>;
+            hfront-porch = <186>;
+            hsync-len = <50>;
+
+            vback-porch = <11>;
+            vactive = <600>;
+            vfront-porch = <24>;
+            vsync-len = <10>;
+
+            hsync-active = <0>;
+            vsync-active = <0>;
+            de-active = <1>;
+            pixelclk-active = <1>;
+        };
+
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&bridge_out>;
+            };
+        };
+    };
+};
+
+&omap4_pmx_wkup {
+    twl6030_wkup_pins: pinmux_twl6030_wkup_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x56, PIN_OUTPUT_PULLUP | MUX_MODE2) /*
fref_clk3_req.sys_drm_msecure */
+        >;
+    };
+};
+
+&omap4_pmx_core {
+    pwm10_default: pinmux_pwm10_default {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0X0D6, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE1)
+        >;
+    };
+
+    backlight_pins: pinmux_backlight_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0X0D8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)
+        >;
+    };
+
+    i2c1_pins: pinmux_i2c1_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c1_scl */
+        OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c1_sda */
+        >;
+    };
+
+    i2c2_pins: pinmux_i2c2_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c2_scl */
+        OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c2_sda */
+        >;
+    };
+
+    i2c3_pins: pinmux_i2c3_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c3_scl */
+        OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c3_sda */
+        >;
+    };
+
+    i2c4_pins: pinmux_i2c4_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c4_scl */
+        OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c4_sda */
+        >;
+    };
+
+    mmc2_pins: pinmux_mmc2_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x040, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat0 */
+        OMAP4_IOPAD(0x042, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat1 */
+        OMAP4_IOPAD(0x044, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat2 */
+        OMAP4_IOPAD(0x046, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat3 */
+        OMAP4_IOPAD(0x048, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat4 */
+        OMAP4_IOPAD(0x04a, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat5 */
+        OMAP4_IOPAD(0x04c, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat6 */
+        OMAP4_IOPAD(0x04e, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_dat7 */
+        OMAP4_IOPAD(0x082, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_clk */
+        OMAP4_IOPAD(0x084, PIN_INPUT_PULLUP | MUX_MODE1)    /* sdmmc2_cmd */
+        >;
+    };
+
+    mmc1_pins: pinmux_mmc1_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLDOWN | MUX_MODE0)    /* sdmmc1_clk */
+        OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)    /* sdmcc1_cmd */
+        OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)    /* sdmcc1_dat0 */
+        OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)    /* sdmmc1_dat1 */
+        OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)    /* sdmmc1_dat2 */
+        OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)    /* sdmmc1_dat3 */
+        >;
+    };
+
+    mmc5_pins: pinmux_mmc5_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x148, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_clk.sdmmc5_clk */
+        OMAP4_IOPAD(0x14a, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_cmd.sdmmc5_cmd */
+        OMAP4_IOPAD(0x14c, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_dat0.sdmmc5_dat0 */
+        OMAP4_IOPAD(0x14e, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_dat1.sdmmc5_dat1 */
+        OMAP4_IOPAD(0x150, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_dat2.sdmmc5_dat2 */
+        OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0) /*
sdmmc5_dat3.sdmmc5_dat3 */
+        >;
+    };
+
+    dss_dpi_pins: pinmux_dss_dpi_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x162, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data23 */
+        OMAP4_IOPAD(0x164, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data22 */
+        OMAP4_IOPAD(0x166, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data21 */
+        OMAP4_IOPAD(0x168, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data20 */
+        OMAP4_IOPAD(0x16a, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data19 */
+        OMAP4_IOPAD(0x16c, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data18 */
+        OMAP4_IOPAD(0x16e, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data15 */
+        OMAP4_IOPAD(0x170, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data14 */
+        OMAP4_IOPAD(0x172, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data13 */
+        OMAP4_IOPAD(0x174, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data12 */
+        OMAP4_IOPAD(0x176, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data11 */
+
+        OMAP4_IOPAD(0x1b4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data10 */
+        OMAP4_IOPAD(0x1b6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data9 */
+        OMAP4_IOPAD(0x1b8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data16 */
+        OMAP4_IOPAD(0x1ba, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data17 */
+        OMAP4_IOPAD(0x1bc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_hsync */
+        OMAP4_IOPAD(0x1be, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /* dispc2_pclk */
+        OMAP4_IOPAD(0x1c0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_vsync */
+        OMAP4_IOPAD(0x1c2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /* dispc2_de */
+        OMAP4_IOPAD(0x1c4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data8 */
+        OMAP4_IOPAD(0x1c6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data7 */
+        OMAP4_IOPAD(0x1c8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data6 */
+        OMAP4_IOPAD(0x1ca, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data5 */
+        OMAP4_IOPAD(0x1cc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data4 */
+        OMAP4_IOPAD(0x1ce, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data3 */
+
+        OMAP4_IOPAD(0x1d0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data2 */
+        OMAP4_IOPAD(0x1d2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data1 */
+        OMAP4_IOPAD(0x1d4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)    /*
dispc2_data0 */
+        >;
+    };
+
+    wlanen_gpio: pinmux_wlanen_gpio {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3) /* gpmc_ncs7.gpio_104 */
+        >;
+    };
+
+    twl6030_pins: pinmux_twl6030_pins {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x19e, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE0)
/*sys_nirq1.sys_nirq1*/
+        >;
+    };
+
+    fuel_alert_irq: fuel-alert-irq {
+        pinctrl-single,pins = <
+        OMAP4_IOPAD(0x068, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
  /*gpmc_a20.gpio_44*/
+        >;
+    };
+};
+
+&i2c1 {
+    // We need i2c1 muxed early on the boot process for pmic
+    // bootloader already done it for us
+    // pinctrl-names = "default";
+    // pinctrl-0 = <&i2c1_pins>;
+
+    clock-frequency = <400000>;
+
+    twl: twl@48 {
+        reg = <0x48>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <
+            &twl6030_pins
+            &twl6030_wkup_pins
+        >;
+
+        /* SPI = 0, IRQ# = 7, 4 = active high level-sensitive */
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N
cascaded to gic */
+        interrupt-parent = <&gic>;
+    };
+};
+
+#include "twl6032.dtsi"
+
+&i2c2 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c3 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&i2c3_pins>;
+
+    touchscreen@48 {
+        compatible = "melfas,mms114";
+        reg = <0x48>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+        touchscreen-size-x = <1024>;
+        touchscreen-size-y = <600>;
+        avdd-supply = <&reg_touch_ldo_en>;
+        vdd-supply = <&vcxio>;
+    };
+};
+
+&i2c4 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&i2c4_pins>;
+
+    accelerometer@18 {
+        compatible = "bosch,bma254";
+        reg = <0x18>;
+        vdd-supply = <&ldo5>;
+        vddio-supply = <&vaux2>;
+        interrupt-parent = <&gpio4>;
+        interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>
+                  , <26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
+    };
+};
+
+&dss {
+    status = "okay";
+    pinctrl-names = "default";
+    pinctrl-0 = <&dss_dpi_pins>;
+    port {
+        dpi_out: endpoint {
+            remote-endpoint = <&bridge_in>;
+            data-lines = <24>;
+        };
+    };
+};
+
+&twl_usb_comparator {
+    usb-supply = <&vusb>;
+};
+
+&usb_otg_hs {
+    interface-type = <1>;
+    mode = <3>;
+    power = <50>;
+};
+
+&mmc1 {
+    status = "ok";
+    pinctrl-names = "default";
+    pinctrl-0 = <&mmc1_pins>;
+    vmmc-supply = <&reg_espresso_external>;
+    bus-width = <4>;
+};
+
+&mmc2 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&mmc2_pins>;
+    vmmc-supply = <&reg_espresso_internal>;
+    ti,non-removable;
+    bus-width = <8>;
+};
+
+&mmc3 {
+    status = "disabled";
+};
+
+&mmc4 {
+    status = "disabled";
+};
+
+&mmc5 {
+    status = "okay";
+    #address-cells = <1>;
+    #size-cells = <0>;
+    non-removable;
+    bus-width = <4>;
+    vmmc-supply = <&reg_espresso_vwlan>;
+    pinctrl-names = "default";
+    pinctrl-0 = <&mmc5_pins>;
+
+    brcmf: wifi@1 {
+        compatible = "brcm,bcm4330-fmac";
+        reg = <1>;
+        interrupt-parent = <&gpio3>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "host-wake";
+    };
+};

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab..dc382e9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -836,6 +836,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
        am335x-wega-rdk.dtb \
        am335x-osd3358-sm-red.dtb
 dtb-$(CONFIG_ARCH_OMAP4) += \
+       omap4-samsung-espresso3g.dtb \
        omap4-droid-bionic-xt875.dtb \
        omap4-droid4-xt894.dtb \
        omap4-duovero-parlor.dtb \

diff --git a/arch/arm/configs/omap2plus_defconfig
b/arch/arm/configs/omap2plus_defconfig
index 02b07b4a7..23882e6e5 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -104,6 +104,41 @@ CONFIG_NET_SWITCHDEV=y
 CONFIG_CAN=m
 CONFIG_CAN_C_CAN=m
 CONFIG_CAN_C_CAN_PLATFORM=m
+CONFIG_B43=m
+CONFIG_B43_BUSES_BCMA_AND_SSB=y
+CONFIG_B43_SDIO=y
+CONFIG_BRCMUTIL=m
+CONFIG_BRCMFMAC=m
+CONFIG_BRCMFMAC_PROTO_BCDC=y
+CONFIG_BRCMFMAC_SDIO=y
 CONFIG_BT=m
 CONFIG_BT_RFCOMM=m
 CONFIG_BT_RFCOMM_TTY=y
@@ -245,6 +280,7 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
+CONFIG_TOUCHSCREEN_MMS114=m
 CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
 CONFIG_TOUCHSCREEN_PIXCIR=m
 CONFIG_TOUCHSCREEN_TSC2004=m
@@ -299,6 +335,7 @@ CONFIG_W1_SLAVE_DS250X=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_BQ27XXX=m
+CONFIG_BATTERY_MAX17042=m
 CONFIG_CHARGER_ISP1704=m
 CONFIG_CHARGER_TWL4030=m
 CONFIG_CHARGER_BQ2415X=m
@@ -358,6 +395,8 @@ CONFIG_VIDEO_OMAP3=m
 CONFIG_VIDEO_TVP5150=m
 CONFIG_VIDEO_MT9P031=m
 CONFIG_DRM=m
+CONFIG_DRM_MIPI_DSI=m
+CONFIG_DRM_KMS_HELPER=m
 CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
 CONFIG_OMAP2_DSS_SDI=y
@@ -365,7 +404,9 @@ CONFIG_OMAP2_DSS_DSI=y
 CONFIG_DRM_OMAP_PANEL_DSI_CM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_DSI_CM=m
 CONFIG_DRM_PANEL_LG_LB035Q02=m
+CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
 CONFIG_DRM_PANEL_SONY_ACX565AKM=m
@@ -375,6 +416,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
+CONFIG_DRM_LVDS_CODEC=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
@@ -586,3 +628,14 @@ CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
+CONFIG_I2C_MUX=m
+CONFIG_BCMA=m
+CONFIG_BCMA_HOST_PCI=y
+CONFIG_BCMA_DRIVER_PCI=y
+CONFIG_BMA180=m

diff --git a/drivers/input/touchscreen/mms114.c
b/drivers/input/touchscreen/mms114.c
index 16557f51b09d..131c1136d01c 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Melfas MMS114/MMS152 touchscreen device driver
+// Melfas MMS114/MMS136/MMS152 touchscreen device driver
 //
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 // Author: Joonyoung Shim <jy0922.shim@samsung.com>
@@ -44,7 +44,8 @@
 #define MMS114_MAX_AREA            0xff

 #define MMS114_MAX_TOUCH        10
-#define MMS114_PACKET_NUM        8
+#define MMS114_EVENT_SIZE        8
+#define MMS136_EVENT_SIZE        6

 /* Touch type */
 #define MMS114_TYPE_NONE        0
@@ -53,6 +54,7 @@

 enum mms_type {
     TYPE_MMS114    = 114,
+    TYPE_MMS136    = 136,
     TYPE_MMS152    = 152,
     TYPE_MMS345L    = 345,
 };
@@ -209,7 +211,11 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
     if (packet_size <= 0)
         goto out;

-    touch_size = packet_size / MMS114_PACKET_NUM;
+    /* MMS136 has slightly different event size */
+    if (data->type == TYPE_MMS136)
+        touch_size = packet_size / MMS136_EVENT_SIZE;
+    else
+        touch_size = packet_size / MMS114_EVENT_SIZE;

     error = __mms114_read_reg(data, MMS114_INFORMATION, packet_size,
             (u8 *)touch);
@@ -275,6 +281,7 @@ static int mms114_get_version(struct mms114_data *data)
         break;

     case TYPE_MMS114:
+    case TYPE_MMS136:
         error = __mms114_read_reg(data, MMS114_TSP_REV, 6, buf);
         if (error)
             return error;
@@ -297,8 +304,9 @@ static int mms114_setup_regs(struct mms114_data *data)
     if (error < 0)
         return error;

-    /* Only MMS114 has configuration and power on registers */
-    if (data->type != TYPE_MMS114)
+    /* Only MMS114 and MMS136 have configuration and power on registers */
+    if (data->type != TYPE_MMS114 &&
+        data->type != TYPE_MMS136)
         return 0;

     error = mms114_set_active(data, true);
@@ -480,7 +488,8 @@ static int mms114_probe(struct i2c_client *client,
                      0, data->props.max_y, 0, 0);
     }

-    if (data->type == TYPE_MMS114) {
+    if ((data->type == TYPE_MMS114) ||
+        (data->type == TYPE_MMS136)) {
         /*
          * The firmware handles movement and pressure fuzz, so
          * don't duplicate that in software.
@@ -604,6 +613,9 @@ static const struct of_device_id mms114_dt_match[] = {
     {
         .compatible = "melfas,mms114",
         .data = (void *)TYPE_MMS114,
+    }, {
+        .compatible = "melfas,mms136",
+        .data = (void *)TYPE_MMS136,
     }, {
         .compatible = "melfas,mms152",
         .data = (void *)TYPE_MMS152,
--
