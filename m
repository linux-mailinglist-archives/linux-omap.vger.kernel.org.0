Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753B8696498
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbjBNNXl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbjBNNXk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:40 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CE53C32
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381002; x=1678973002;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8xy/K+4z50iTJ0iawcWRl+mC77/bLmBwoTEX0QSeD4Y=;
        b=XTtV0or7IREHc4d7JErr5TBd9STvfgxNDPRWonBOMxPXkhYV5xuzHbREpidPHtIO
        Ora+jYeS9aRc12o/jRsonOF/fznSzdbGAOYHiEtsQWm8j59yW/fey8mtkosyW2+u
        TYw14NA4T2HzM7Q/q3LhH/9RbyM77vhhosFuqjxJ9dk=;
X-AuditID: ac14000a-917fe70000007ecb-ef-63eb8b4ac19e
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 31.D9.32459.A4B8BE36; Tue, 14 Feb 2023 14:23:22 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:22 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 6/8] ARM: dts: am335x-phycore-som: Remove underscore in node names.
Date:   Tue, 14 Feb 2023 14:23:00 +0100
Message-ID: <20230214132302.39087-6-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRpKBV9er+3Wywfl1QhZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBlPGvvZCq7yVqx+cpilgXE/dxcjJ4eEgIlE34FLjF2MXBxCAouZJFYd
        +csMkhASeMwosfG6KIjNJqAuMX/vd3YQW0RAQeLIkSZWkAZmgQ5GieaZ3WAJYYFgiYVzTwPZ
        HBwsAqoS9zckg4R5BcwkWhZ+YYFYJi+x/+BZsPmcAuYSyye8YYPYZSbRfvgOC0S9oMTJmU/A
        bGag+uats5khbAmJgy9eQN0mJzHn1EdmmJnTzr2GskMlOv/cZ5nAKDQLyahZSEbNQjJqASPz
        Kkah3Mzk7NSizGy9gozKktRkvZTUTYygWBBh4NrB2DfH4xAjEwfjIUYJDmYlEV7hpy+ShXhT
        EiurUovy44tKc1KLDzFKc7AoifPe72FKFBJITyxJzU5NLUgtgskycXBKNTBmM5cndwcaJn5Q
        7u7kkVQ4J2wi3mdw6uYUl8+3TzBffabhznwu+5rJu89We0RFJMUOFjnPvp3vNy/Y4vQRm41e
        dX37NdP1OT9wRu42PRDhzGwpold09VZamn/malmdU4zXp56dslFslfWvv9fvTY/fwqnosCDe
        ciWbvtm1tyd/vOM8IrsrfqkSS3FGoqEWc1FxIgANTR93cwIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove underscore in node names following conventions.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index 6819cec588a7..5bb05620da56 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -49,7 +49,7 @@ &sham {
 
 /* EMMC */
 &am33xx_pinmux {
-	emmc_pins: pinmux_emmc_pins {
+	emmc_pins: pinmux-emmc-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN1, PIN_INPUT_PULLUP, MUX_MODE2)	/* gpmc_csn1.mmc1_clk */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN2, PIN_INPUT_PULLUP, MUX_MODE2)	/* gpmc_csn2.mmc1_cmd */
@@ -125,7 +125,7 @@ &mac_sw {
 
 /* I2C Busses */
 &am33xx_pinmux {
-	i2c0_pins: pinmux_i2c0 {
+	i2c0_pins: pinmux-i2c0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT, MUX_MODE0)
@@ -165,7 +165,7 @@ i2c_rtc: rtc@68 {
 
 /* NAND memory */
 &am33xx_pinmux {
-		nandflash_pins: pinmux_nandflash {
+		nandflash_pins: pinmux-nandflash {
 			pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_AD0, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_GPMC_AD1, PIN_INPUT_PULLUP, MUX_MODE0)
@@ -317,7 +317,7 @@ vmmc_reg: regulator@12 {
 
 /* SPI Busses */
 &am33xx_pinmux {
-	spi0_pins: pinmux_spi0 {
+	spi0_pins: pinmux-spi0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT_PULLDOWN, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT_PULLDOWN, MUX_MODE0)
-- 
2.34.1

