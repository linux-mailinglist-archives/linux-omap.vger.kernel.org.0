Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E02C629659
	for <lists+linux-omap@lfdr.de>; Tue, 15 Nov 2022 11:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiKOKwM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Nov 2022 05:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238345AbiKOKvJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Nov 2022 05:51:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890822612A
        for <linux-omap@vger.kernel.org>; Tue, 15 Nov 2022 02:50:55 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a29so23803904lfj.9
        for <linux-omap@vger.kernel.org>; Tue, 15 Nov 2022 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9ZjfVH6jTu5bXNrF+XB875QGxc7652/pclh4N/Z5xQ=;
        b=EyzBV46MfhFXmlHWdMTPkpFJQuzZCFfss5Hh/kVHC/PKRUnABUtqkUO++wp4zEszO/
         qU2YCuVj/RjqWKEyaV2vo9bSoiAPwK4kaiH8hsp+1w5651zS/PHwms/9q7CqFXdEXBZH
         aylGTWX+IwEpSehuBS7mi86RLkZ2+ZFvsFqrBYY3pRQqXcWnuESCdWQ1EEL7ohJ0GdnD
         G4Otry8cz7oVrJprGOCMfDL02gZAAdsfI+uEXI0IaZP3foOUtQOp4uPth66TKAUKNYS5
         dAErJdD39fPeDu0UFCcCXr/yk9o8doAwnAt7Jq7/eGVhyfPK0N1YWkf+40C2uHO5TBqg
         t13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9ZjfVH6jTu5bXNrF+XB875QGxc7652/pclh4N/Z5xQ=;
        b=XsD2noKXECgAAaNNJhBKba5QN1T5WpSkmHBe6Yhh8fqr+ZsJ9kH83cTsycxkzvr38m
         3fD6slCE9a5bCLOkNpIKfJt3jBaEOq6kNqj5dhVR0J77ipetY9B/Jw5GAr2OSQA5ROhX
         GmwCWrouPR6O16pt208izTP246DnqzpGG/iWt2vbhLd59CCo0LLaIMZjl/1OfMUZn/P5
         fZp2BxU2guOVepmrmLRfTo1vvBel/ZNszCqDv2w+LoySNfQa5MqgMfcqP7em9x+wd5Wn
         pc2L/ZhhzkMWIn8GxsAN3WnHgMnHDDZwX10CPRgU8QpWzTcyRacIhMOsMQ905hn2TM+E
         Z0+A==
X-Gm-Message-State: ANoB5pmve/30DBNV6Zyi1fixj58dr6cMWUpzf47HO3tk4NAgJWOsBUZt
        +9UUhdH5ZVjikjxFTY49T6hwfw==
X-Google-Smtp-Source: AA0mqf4bjEJfIVjFBb6mjsBSOPGtmgdvodsi52JsbMsEFcgBlCA8PCq8LsKmLSK2voBWiexU1aR/vA==
X-Received: by 2002:ac2:5cc3:0:b0:4b1:3931:af with SMTP id f3-20020ac25cc3000000b004b1393100afmr6074287lfq.394.1668509455096;
        Tue, 15 Nov 2022 02:50:55 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r17-20020a2e8e31000000b0027740a1b854sm2454692ljk.52.2022.11.15.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:50:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: omap: trim addresses to 8 digits
Date:   Tue, 15 Nov 2022 11:50:53 +0100
Message-Id: <20221115105053.95430-1-krzysztof.kozlowski@linaro.org>
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

Hex numbers in addresses and sizes should be rather eight digits, not
nine.  Drop leading zeros.  No functional change (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/am335x-evm.dts         | 2 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi   | 4 ++--
 arch/arm/boot/dts/am437x-idk-evm.dts     | 2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts      | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts     | 2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi   | 2 +-
 arch/arm/boot/dts/dra7-evm.dts           | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi  | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 6e34161d327b..5beabaa5ff6a 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -544,7 +544,7 @@ nand@0,0 {
 		#size-cells = <1>;
 		partition@0 {
 			label = "NAND.SPL";
-			reg = <0x00000000 0x000020000>;
+			reg = <0x00000000 0x00020000>;
 		};
 		partition@1 {
 			label = "NAND.SPL.backup1";
diff --git a/arch/arm/boot/dts/am335x-igep0033.dtsi b/arch/arm/boot/dts/am335x-igep0033.dtsi
index cc14415a4eb9..3fddf80dcf71 100644
--- a/arch/arm/boot/dts/am335x-igep0033.dtsi
+++ b/arch/arm/boot/dts/am335x-igep0033.dtsi
@@ -168,7 +168,7 @@ nand@0,0 {
 		/* MTD partition table */
 		partition@0 {
 			label = "SPL";
-			reg = <0x00000000 0x000080000>;
+			reg = <0x00000000 0x00080000>;
 		};
 
 		partition@1 {
@@ -188,7 +188,7 @@ partition@3 {
 
 		partition@4 {
 			label = "File System";
-			reg = <0x00780000 0x007880000>;
+			reg = <0x00780000 0x07880000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index 123a95f87554..e46cf2a9d075 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -452,7 +452,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.U_BOOT";
-			reg = <0x00000000 0x000080000>;
+			reg = <0x00000000 0x00080000>;
 		};
 		partition@1 {
 			label = "QSPI.U_BOOT.backup";
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 036f3831dc26..511a02e13e2c 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -763,7 +763,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.U_BOOT";
-			reg = <0x00000000 0x000080000>;
+			reg = <0x00000000 0x00080000>;
 		};
 		partition@1 {
 			label = "QSPI.U_BOOT.backup";
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 27f4ce855549..9fc915a2582e 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -919,7 +919,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.U_BOOT";
-			reg = <0x00000000 0x000080000>;
+			reg = <0x00000000 0x00080000>;
 		};
 		partition@1 {
 			label = "QSPI.U_BOOT.backup";
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index c06eda817242..7f092a8811e8 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -542,7 +542,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.SPL";
-			reg = <0x00000000 0x000040000>;
+			reg = <0x00000000 0x00040000>;
 		};
 		partition@1 {
 			label = "QSPI.u-boot";
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 68c43eb12c1a..4cdffd6db740 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -151,7 +151,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.SPL";
-			reg = <0x00000000 0x000010000>;
+			reg = <0x00000000 0x00010000>;
 		};
 		partition@1 {
 			label = "QSPI.SPL.backup1";
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 87deb6a76eff..8cbcf55a5a33 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -483,7 +483,7 @@ nand@0,0 {
 		#size-cells = <1>;
 		partition@0 {
 			label = "NAND.SPL";
-			reg = <0x00000000 0x000020000>;
+			reg = <0x00000000 0x00020000>;
 		};
 		partition@1 {
 			label = "NAND.SPL.backup1";
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 8948e10dbeb8..c79ba671ec2b 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -356,7 +356,7 @@ nand@0,0 {
 		#size-cells = <1>;
 		partition@0 {
 			label = "NAND.SPL";
-			reg = <0x00000000 0x000020000>;
+			reg = <0x00000000 0x00020000>;
 		};
 		partition@1 {
 			label = "NAND.SPL.backup1";
@@ -490,7 +490,7 @@ flash@0 {
 		 */
 		partition@0 {
 			label = "QSPI.SPL";
-			reg = <0x00000000 0x000010000>;
+			reg = <0x00000000 0x00010000>;
 		};
 		partition@1 {
 			label = "QSPI.SPL.backup1";
-- 
2.34.1

