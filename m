Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EE37C02CA
	for <lists+linux-omap@lfdr.de>; Tue, 10 Oct 2023 19:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbjJJRfO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Oct 2023 13:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjJJRfN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Oct 2023 13:35:13 -0400
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217519D
        for <linux-omap@vger.kernel.org>; Tue, 10 Oct 2023 10:35:09 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id 0B4F385182;
        Tue, 10 Oct 2023 19:27:42 +0200 (CEST)
From:   =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date:   Tue, 10 Oct 2023 19:27:25 +0200
Subject: [PATCH v6 8/9] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231010-pxa1908-lkml-v6-8-b2fe09240cf8@skole.hr>
References: <20231010-pxa1908-lkml-v6-0-b2fe09240cf8@skole.hr>
In-Reply-To: <20231010-pxa1908-lkml-v6-0-b2fe09240cf8@skole.hr>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16658;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=YRazHYti+MZjMWKf0hEcao3uyTElViv5sUCL1PuzGEI=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlJYl59+MdDybh1QiWDYDefKmactN2+vDcf3S2l
 j1We8tGL/CJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZSWJeQAKCRCaEZ6wQi2W
 4eVjD/9048Tz3zYNdTffGy/ykqrXnvu2pFDTuv+lsfEk3/q7IpAAsuPQiZS6+T191gBT7NJ21S4
 LoeTXWWZgP7UHVEcGC4L9sBWylrmySfkWUq3++HHiPFHX4mWuKE27sHFL7YhIkl0N3bH18RryJx
 fQN1xN8Ekw/7OF7cxNhvdTlHMmElSPYH5SSXlkkL81c9TfPluQnt+t20+RQIe3WMTVkOP9OZaRw
 s2MUWy8LcZN4PP9iUGgka++ngnj6CmAELobvo+HQeWkq5Vsoa6VvRtZHtg8tzoMCN9zCVbd5uUP
 wUADXUF7hjnzJ/YYvswtYaSNXh8utg4gT4fqYCoHj+JtWGICBemS4AjzyLfWzp35kxJ8jIt+I9R
 4QhFQDvM+hlwY9OP6nMJNKbdCmqIVe/erFXfWmAHhFvYKJeh+J+DTle+MmnNQu/P6PoCcuEIG+C
 3Nd2IJFwYXal6JyqNkLRMnnR3hJ1BBO6yuL25SS+7QTgYVqg9Ir5Fv7H3IDEkU7C0WyQ3Tl9Ckh
 uV6kxJx3UZMOBEbzbAGCU1rsn1DH1fPwh2JEiXABzK3QZQHa2fN3mFVdesfTfpJlaZk14P9p38A
 RG5Xym+FpBkRBD0t22klH4n4tiEmefP8d289ro5pqVQP0pE+o/HlmSkCScnOhANpZWcYUefolfw
 FGzuQ2E+bxx+paQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add DTS for Marvell PXA1908 SoC and Samsung Galaxy Core Prime Value
Edition LTE, a smartphone based on said SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/boot/dts/marvell/Makefile               |   3 +
 .../dts/marvell/pxa1908-samsung-coreprimevelte.dts | 333 +++++++++++++++++++++
 arch/arm64/boot/dts/marvell/pxa1908.dtsi           | 295 ++++++++++++++++++
 3 files changed, 631 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/marvell/Makefile
index 79ac09b58a89..263be6ec7567 100644
--- a/arch/arm64/boot/dts/marvell/Makefile
+++ b/arch/arm64/boot/dts/marvell/Makefile
@@ -27,3 +27,6 @@ dtb-$(CONFIG_ARCH_MVEBU) += cn9132-db-B.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9130-crb-A.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9130-crb-B.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += ac5-98dx35xx-rd.dtb
+
+# MMP SoC Family
+dtb-$(CONFIG_ARCH_MMP) += pxa1908-samsung-coreprimevelte.dtb
diff --git a/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
new file mode 100644
index 000000000000..e3c863d517a8
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "pxa1908.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	model = "Samsung Galaxy Core Prime VE LTE";
+	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
+
+	aliases {
+		mmc0 = &sdh2; /* eMMC */
+		mmc1 = &sdh0; /* SD card */
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		fb0: framebuffer@17177000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			width = <480>;
+			height = <800>;
+			stride = <(480 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	/* Bootloader fills this in */
+	memory {
+		device_type = "memory";
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@17000000 {
+			reg = <0 0x17000000 0 0x1800000>;
+			no-map;
+		};
+
+		gpu@9000000 {
+			reg = <0 0x9000000 0 0x1000000>;
+		};
+
+		/* Communications processor, aka modem */
+		cp@3000000 {
+			reg = <0 0x3000000 0 0x5000000>;
+		};
+
+		cm3@a000000 {
+			reg = <0 0xa000000 0 0x80000>;
+		};
+
+		seclog@8000000 {
+			reg = <0 0x8000000 0 0x100000>;
+		};
+
+		ramoops@8100000 {
+			compatible = "ramoops";
+			reg = <0 0x8100000 0 0x40000>;
+			record-size = <0x8000>;
+			console-size = <0x20000>;
+			max-reason = <5>;
+		};
+	};
+
+
+	i2c-muic {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <3>;
+		i2c-gpio,timeout-ms = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_muic_pins>;
+
+		muic: extcon@14 {
+			compatible = "siliconmitus,sm5504-muic";
+			reg = <0x14>;
+			interrupt-parent = <&gpio>;
+			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins>;
+		autorepeat;
+
+		key-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
+		};
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+		};
+
+		key-voldown {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&smmu {
+	status = "okay";
+};
+
+&pmx {
+	pinctrl-single,gpio-range = <&range 55 55 0>,
+				    <&range 110 32 0>,
+				    <&range 52 1 0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&board_pins_1 &board_pins_2 &board_pins_3>;
+
+	board_pins_1: pinmux-board-1 {
+		pinctrl-single,pins = <
+			0x160 0
+			0x164 0
+			0x168 0
+			0x16c 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0x8000 0x8000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0x8000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	board_pins_2: pinmux-board-2 {
+		pinctrl-single,pins = <
+			0x44 1
+			0x48 1
+			0x20 1
+			0x18 1
+			0x14 1
+			0x10 1
+			0xc 1
+			0x8 1
+			0x68 1
+			0x58 0
+			0x54 0
+			0x7c 0
+			0x6c 0
+			0x70 0
+			0x4c 1
+			0x50 1
+			0xac 0
+			0x90 0
+			0x8c 0
+			0x88 0
+			0x84 0
+			0xc8 0
+			0x128 0
+			0x190 0
+			0x194 0
+			0x1a0 0
+			0x114 0
+			0x118 0
+			0x1d8 0
+			0x1e4 0
+			0xe8 0
+			0x100 0
+			0x204 0
+			0x210 0
+			0x218 0
+		>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xc000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	board_pins_3: pinmux-board-3 {
+		pinctrl-single,pins = <
+			0x260 0
+			0x264 0
+			0x268 0
+			0x26c 0
+			0x270 0
+			0x274 0
+			0x78 0
+			0x74 0
+			0xb0 1
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	uart0_pins: pinmux-uart0 {
+		pinctrl-single,pins = <
+			0x198 6
+			0x19c 6
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	gpio_keys_pins: pinmux-gpio-keys {
+		pinctrl-single,pins = <
+			0x11c 0
+			0x120 0
+			0x1a4 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa0000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	i2c_muic_pins: pinmux-i2c-muic {
+		pinctrl-single,pins = <
+			0x154 0
+			0x150 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	sdh0_pins_1: pinmux-sdh0-1 {
+		pinctrl-single,pins = <
+			0x108 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh0_pins_2: pinmux-sdh0-2 {
+		pinctrl-single,pins = <
+			0x94 0
+			0x98 0
+			0x9c 0
+			0xa0 0
+			0xa4 0
+		>;
+		pinctrl-single,drive-strength = <0x800 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh0_pins_3: pinmux-sdh0-3 {
+		pinctrl-single,pins = <
+			0xa8 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&twsi0 {
+	status = "okay";
+};
+
+&twsi1 {
+	status = "okay";
+};
+
+&twsi2 {
+	status = "okay";
+};
+
+&twsi3 {
+	status = "okay";
+};
+
+&usb {
+	extcon = <&muic>, <&muic>;
+};
+
+&sdh2 {
+	/* Disabled for now because initialization fails with -ETIMEDOUT. */
+	status = "disabled";
+	bus-width = <8>;
+	non-removable;
+	broken-cd;
+	mmc-ddr-1_8v;
+};
+
+&sdh0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdh0_pins_1 &sdh0_pins_2 &sdh0_pins_3>;
+	cd-gpios = <&gpio 11 0>;
+	cd-inverted;
+	bus-width = <4>;
+	wp-inverted;
+};
diff --git a/arch/arm64/boot/dts/marvell/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/pxa1908.dtsi
new file mode 100644
index 000000000000..55ed82efa247
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/pxa1908.dtsi
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+/ {
+	model = "Marvell Armada PXA1908";
+	compatible = "marvell,pxa1908";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 0>;
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 1>;
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 2>;
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 3>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smmu: iommu@c0010000 {
+			compatible = "arm,mmu-400";
+			reg = <0 0xc0010000 0 0x10000>;
+			#global-interrupts = <1>;
+			#iommu-cells = <1>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@d1df9000 {
+			compatible = "arm,gic-400";
+			reg = <0 0xd1df9000 0 0x1000>,
+				<0 0xd1dfa000 0 0x2000>,
+				/* The subsequent registers are guesses. */
+				<0 0xd1dfc000 0 0x2000>,
+				<0 0xd1dfe000 0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		apb@d4000000 {
+			compatible = "simple-bus";
+			reg = <0 0xd4000000 0 0x200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xd4000000 0x200000>;
+
+			pdma: dma-controller@0 {
+				compatible = "marvell,pdma-1.0";
+				reg = <0 0x10000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				dma-channels = <30>;
+				#dma-cells = <2>;
+			};
+
+			twsi1: i2c@10800 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10800 0x64>;
+				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI1>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			twsi0: i2c@11000 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x11000 0x64>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI0>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			twsi3: i2c@13800 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x13800 0x64>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI3>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			apbc: clock-controller@15000 {
+				compatible = "marvell,pxa1908-apbc";
+				reg = <0x15000 0x1000>;
+				#clock-cells = <1>;
+			};
+
+			uart0: serial@17000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_UART0>;
+				reg-shift = <2>;
+			};
+
+			uart1: serial@18000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_UART1>;
+				reg-shift = <2>;
+			};
+
+			gpio: gpio@19000 {
+				compatible = "marvell,mmp-gpio";
+				reg = <0x19000 0x800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&apbc PXA1908_CLK_GPIO>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "gpio_mux";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ranges = <0 0x19000 0x800>;
+
+				gpio@0 {
+					reg = <0x0 0x4>;
+				};
+
+				gpio@4 {
+					reg = <0x4 0x4>;
+				};
+
+				gpio@8 {
+					reg = <0x8 0x4>;
+				};
+
+				gpio@100 {
+					reg = <0x100 0x4>;
+				};
+			};
+
+			pmx: pinmux@1e000 {
+				compatible = "marvell,pxa1908-padconf", "pinconf-single";
+				reg = <0x1e000 0x330>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				#gpio-range-cells = <3>;
+				ranges;
+
+				#pinctrl-cells = <1>;
+				pinctrl-single,register-width = <32>;
+				pinctrl-single,function-mask = <7>;
+
+				range: gpio-range {
+					#pinctrl-single,gpio-range-cells = <3>;
+				};
+			};
+
+			uart2: serial@36000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x36000 0x1000>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbcp PXA1908_CLK_UART2>;
+				reg-shift = <2>;
+			};
+
+			twsi2: i2c@37000 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x37000 0x64>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbcp PXA1908_CLK_TWSI2>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			apbcp: clock-controller@3b000 {
+				compatible = "marvell,pxa1908-apbcp";
+				reg = <0x3b000 0x1000>;
+				#clock-cells = <1>;
+			};
+
+			mpmu: clock-controller@50000 {
+				compatible = "marvell,pxa1908-mpmu";
+				reg = <0x50000 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		axi@d4200000 {
+			compatible = "simple-bus";
+			reg = <0 0xd4200000 0 0x200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xd4200000 0x200000>;
+
+			usbphy: phy@7000 {
+				compatible = "marvell,pxa1928-usb-phy";
+				reg = <0x7000 0x200>;
+				clocks = <&apmu PXA1908_CLK_USB>;
+				#phy-cells = <0>;
+			};
+
+			usb: usb@8000 {
+				compatible = "chipidea,usb2";
+				reg = <0x8000 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_USB>;
+				phys = <&usbphy>;
+				phy-names = "usb-phy";
+			};
+
+			sdh0: mmc@80000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x80000 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH0>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			sdh1: mmc@80800 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x80800 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH1>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			sdh2: mmc@81000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x81000 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH2>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			apmu: clock-controller@82800 {
+				compatible = "marvell,pxa1908-apmu";
+				reg = <0x82800 0x400>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+};

-- 
2.42.0


