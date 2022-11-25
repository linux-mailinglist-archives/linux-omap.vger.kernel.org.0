Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7116638C71
	for <lists+linux-omap@lfdr.de>; Fri, 25 Nov 2022 15:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiKYOlZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Nov 2022 09:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiKYOlX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Nov 2022 09:41:23 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5173D915
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 06:41:21 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j4so7253217lfk.0
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 06:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwYdfVEjA0I8cGvM36xK+3JcAzQ/WaSGv27O7kQ7ryY=;
        b=P/SW7YAYm+YdfOkRBYX9BM8y0BKUBpbBYee8fqB8dHQKmSD+Xd3om0RtRwrj+1twck
         h3mmVEVc7jlHD4jw1krVynMMhaPPFUYDQwdNfkkjJM6ZzizXR6ibLRvv8l7JhH5mSWIi
         mWa7Y9YMcSlgMwRN2DqObDKnq+DRTzPsP3JIvewICZytx8Z9bwnpSQKS2oGxWIlZVNdk
         ll7aJZPM3WPZo1RxP13Nb1bYfaGt0K+r2FLGGrbLdesUXW/Wg3KeNzLIBZnUuRrbl1bn
         Sbtr5WelXtiGIFnavP7ZynSgJxutnpSvMutCXPdjc1Tib+lZP6wSXgEoZx7sZvJNv7Nd
         XZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwYdfVEjA0I8cGvM36xK+3JcAzQ/WaSGv27O7kQ7ryY=;
        b=nxfDORf9febf7hcYb8HKdoa+X3yRep8C3BtOMAAre2J1omnRDiL1baR9e5K3UUFynT
         exaKDHN02uBWQH3iN7/mr3YzYF6PEl1BBbpr8ub1V1t6cy0TdOAG1wf3/HuSFljiFD2G
         ZLw96CzDSGKdCFyk5xQ0E77oV4aiCyeEsDcMeSyzDvmVkn2asJnPmy1LMUgsU5FNkzzr
         ffxgmb72miegHm6lOQu4ZXTgR68TGtCaUNjVhRbqGyAW4CpIaamOahkYzgDzbqnwV19H
         q/NSiK3kK0ufRBuXtonK630V1TjoY8dQ7WrawG/8rn0WWWnIL0dT727pLW0fPB2T82Rj
         pZHA==
X-Gm-Message-State: ANoB5pnt8zTT569rxgJWNCnXiQK7a3NWrwpyIu4mTElfGpkjOnBdajmc
        FdL2p7huBpu9JtRm1VrNpTpKrQ==
X-Google-Smtp-Source: AA0mqf6SkzAPdxiTD5Dpwwolo4KLjrgXoTNLhNMabXSAFdZB9oAabGQ35jQNzq3SJs3KbWWkJ/cv4A==
X-Received: by 2002:ac2:4f0a:0:b0:4b4:12dd:3f4 with SMTP id k10-20020ac24f0a000000b004b412dd03f4mr14650076lfr.610.1669387279994;
        Fri, 25 Nov 2022 06:41:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b004994c190581sm553224lfr.123.2022.11.25.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:41:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: am335x: align LED node names with dtschema
Date:   Fri, 25 Nov 2022 15:41:18 +0100
Message-Id: <20221125144118.476905-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The node names should be generic and DT schema expects certain pattern:

  am335x-baltos-ir2110.dtb: leds: 'app', 'power', 'wlan' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/am335x-baltos-leds.dtsi | 6 +++---
 arch/arm/boot/dts/am335x-pocketbeagle.dts | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-leds.dtsi b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
index 9a79f727baf6..025014657d12 100644
--- a/arch/arm/boot/dts/am335x-baltos-leds.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
@@ -17,18 +17,18 @@ leds {
 
 		compatible = "gpio-leds";
 
-		power {
+		led-power {
 			label = "onrisc:red:power";
 			linux,default-trigger = "default-on";
 			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 		};
-		wlan {
+		led-wlan {
 			label = "onrisc:blue:wlan";
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-		app {
+		led-app {
 			label = "onrisc:green:app";
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index 5e415d8ffdd8..0ba4883cd4ef 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -23,28 +23,28 @@ leds {
 
 		compatible = "gpio-leds";
 
-		usr0 {
+		led-usr0 {
 			label = "beaglebone:green:usr0";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";
 		};
 
-		usr1 {
+		led-usr1 {
 			label = "beaglebone:green:usr1";
 			gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
 
-		usr2 {
+		led-usr2 {
 			label = "beaglebone:green:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
 			default-state = "off";
 		};
 
-		usr3 {
+		led-usr3 {
 			label = "beaglebone:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.34.1

