Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431B55A1509
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 17:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242550AbiHYPCf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 11:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238804AbiHYPCe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 11:02:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35E65D0FA
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:32 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w20so10732219edd.10
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sTmNCS3BDQYWVK5I66pzpL7PzH57eOVtLM0QGNLALRY=;
        b=TdXNpBzXdH6+m59PYn6PcZfud4Eg4HQ1bZCFJwu1VxIYbDsv1vPOZfn1rdqYs96Bxu
         vfHRALFTZsNArVYQ1t3ofMf4XE/+HpI84Lf7dabAGacHvdqEvxWQxpt8BTmKZRk+ENw8
         j/NV4onwuPbdekhVXixmyjI2QMZ06lHk0wtmBtnLzlDqg/9X4hor1FxqPw4sz7V6vSRf
         1Rwog7NLF8Ziwm/HjfqrTme6rww/9YmmIz6h26YWlLlAm210ZLeYdwrMM1oI6EzFwJMg
         Aw01w0oT0IxmdzHfMWkN95Ck8v7SQ8LzXqg2/Oj+Hax/1eS1Ib85kqHaC9Hy0q1+GOoJ
         pPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sTmNCS3BDQYWVK5I66pzpL7PzH57eOVtLM0QGNLALRY=;
        b=nZoYMjyx7n7vZ5/q3Mxz+m9hQfF5BY3TcCFBSiJ75YkdjOVAPPyGcvWANPN2Sw2Oq/
         J3QpSu90L4e4fVa2mKKFqv5n7j+BO6HE5lk/aSSv8OtB1/x46Qaz5jEA1jOUyhckA+h7
         hpwotoAT89/4cugHFsIgUZoQPg3g7WVO+C2mdxrB80vgNaox2EqiQ7vvT+ETwes6YxEM
         Ho3dSYKMQ82B880bIcTKZd7QL5ihhHDdhAwHIIP2tqmJluXYeRUM+7nKgFVwtAJ4hmKh
         0yWHVRqbkqxloMZNZ2vBU+sGcW+xEilL7sQs9rmQVq4DwB56/+mRG3aFEriFdLTqa6aQ
         TkeQ==
X-Gm-Message-State: ACgBeo0x/HzbjDaMJBIeuScvN2ElBcb0YFAprE+kUocoDY5MphmexH8a
        KAQ43Ay2jTpQpkMzd85TR/hHBw==
X-Google-Smtp-Source: AA6agR6WAtQBxbqsLo6ezFNHIy0cd1wvRB3JQylwjX3kYHNmuh+nAbeQw2kZ5TLsSXvf3ZhzSg6OVw==
X-Received: by 2002:a05:6402:348f:b0:446:c0ce:86ab with SMTP id v15-20020a056402348f00b00446c0ce86abmr3625331edc.386.1661439751202;
        Thu, 25 Aug 2022 08:02:31 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00732e3d94f4fsm2548771eje.124.2022.08.25.08.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:02:30 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 1/6] DONOTMERGE: arm64: dts: ti: Add TI TPS65219 PMIC support for AM642 SK board.
Date:   Thu, 25 Aug 2022 17:02:19 +0200
Message-Id: <20220825150224.826258-2-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825150224.826258-1-msp@baylibre.com>
References: <20220825150224.826258-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jerome Neanne <jneanne@baylibre.com>

Add support fot the TI Power Management IC TPS65219
on the AM642 SKEVM board.

Needed for driver testing but official board support pending.
TI commitment is required before board upstream kick-off.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 104 +++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 2620469a7517..565b50810579 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -150,6 +150,20 @@ wlan_en: regulator-2 {
 		vin-supply = <&com8_ls_en>;
 		gpio = <&main_gpio0 48 GPIO_ACTIVE_HIGH>;
 	};
+
+	vsel_sd_nddr: gpio-regulator {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel_sd_nddr_pins_default>;
+		regulator-name = "tps65219-LDO1-SEL-SD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&ldo1_reg>;
+		gpios = <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+	};
 };
 
 &main_pmx0 {
@@ -181,6 +195,13 @@ AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0) /* (E19) USB0_DRVVBUS */
 		>;
 	};
 
+	main_i2c0_pins_default: main-i2c0-pins-default {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x0260, PIN_INPUT_PULLUP, 0) /* (A18) I2C0_SCL */
+			AM64X_IOPAD(0x0264, PIN_INPUT_PULLUP, 0) /* (B18) I2C0_SDA */
+		>;
+	};
+
 	main_i2c1_pins_default: main-i2c1-pins-default {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0268, PIN_INPUT_PULLUP, 0) /* (C18) I2C1_SCL */
@@ -267,6 +288,12 @@ main_wlan_pins_default: main-wlan-pins-default {
 			AM64X_IOPAD(0x00bc, PIN_INPUT, 7) /* (U8) GPIO0_46 */
 		>;
 	};
+
+	vsel_sd_nddr_pins_default: vsel-sd-nddr-pins-default {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x00b8, PIN_INPUT, 7) /* (Y7) PRG1_PRU0_GPO0.GPIO0_45 */
+		>;
+	};
 };
 
 &mcu_uart0 {
@@ -315,6 +342,83 @@ &mcu_i2c1 {
 	status = "disabled";
 };
 
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	tps65219: pmic@30 {
+		compatible = "ti,tps65219";
+		reg = <0x30>;
+		system-power-controller;
+
+		buck1-supply = <&vcc_3v3_sys>;
+		buck2-supply = <&vcc_3v3_sys>;
+		buck3-supply = <&vcc_3v3_sys>;
+		ldo1-supply = <&vcc_3v3_sys>;
+		ldo2-supply = <&buck2_reg>;
+		ldo3-supply = <&vcc_3v3_sys>;
+		ldo4-supply = <&vcc_3v3_sys>;
+
+		regulators {
+			buck1_reg: buck1 {
+				regulator-name = "VDD_CORE";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2_reg: buck2 {
+				regulator-name = "VCC1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3_reg: buck3 {
+				regulator-name = "VDD_LPDDR4";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: ldo1 {
+				regulator-name = "VDDSHV_SD_IO_PMIC";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allow-bypass;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "VDDAR_CORE";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: ldo3 {
+				regulator-name = "VDDA_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: ldo4 {
+				regulator-name = "VDD_PHY_2V5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
 &main_i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c1_pins_default>;
-- 
2.37.2

