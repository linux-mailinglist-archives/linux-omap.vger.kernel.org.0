Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AD3511368
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 10:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359367AbiD0IWj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 04:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344335AbiD0IWj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 04:22:39 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AB25132E;
        Wed, 27 Apr 2022 01:19:28 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q14so1593382ljc.12;
        Wed, 27 Apr 2022 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Menmuaf0e0Qo4q5+TG+xw4d45Ug3x7/RbPb1vBLZhMU=;
        b=UnZ43Ud4hbgbtFF3APhThOuGig2R6GeS2MtctK5XAkNB5jpjt2UxhrH+O8TD0LR52Q
         03LwYpa1Y/DaOfP+cZkHdulnS4VGJaKoGqjn/UI9z8xlDcz+VqGzWmh7pISUR3JL8ub0
         RAdjk4K35Kpf3bIBWrOzlFbm9B8rF+9/3Peu2kJ4UkKF3jXWJvcqMUIlVUTc5orghafQ
         NlK+aSqD9Qc1bArI7m8ZQOFe8RLyRNA7zk7DFzPhjajikdvY3ftj62wgg1dFrYEqsxvb
         tLFu5AK6HAmLeAZdxEdljisw2+tUxdSbF3NM99GJrc3Go8cErkvZSm9Qy/AzTLylRGJT
         ngVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Menmuaf0e0Qo4q5+TG+xw4d45Ug3x7/RbPb1vBLZhMU=;
        b=c8UuaJhhVPjrlujslL2ViqdBjpPbJxBOCUPkZX2m3OQpCGUW5NqBAudDKkl21cD+0x
         09zwTLbIQe919gYlBkXH/O5UNjSgGw5a3kPipxC/sgMkclRbG1kxbdaRXvzjmxANUvwl
         qzAWxPbfWY9kqljiQc1VOVn3BjSCHXHmdciDn3fgLu2GQ9AS7K/2e1RYXtLaAzzGsrue
         KnChwQrqdtFJoW2zhhM2er1bn3i9sMfEGf1+Ad+4ztyqzoyoOGAA3rHduApqYl41UXGV
         nprzIuCQmdB8NAKhH9vFavRxPOKKIPCRHGr9yVYYBrbmJi0wVAE2cpdGxzmJjAd3NS4Z
         mbqw==
X-Gm-Message-State: AOAM5304QheCDkwPUTa8mVYnqtAgsKupyci8VaBklkvvo9TxvytaqxYN
        SxK9JrXwuIoa3Nzvl8FF/DyoSHJsgoMueECaeba6Qg==
X-Google-Smtp-Source: ABdhPJyv+gVl16YvzgbFljhJtF6IzdeX5XODLb8i5OwfH7WfoTJNZJOOhPjTtCD+5pP02tb1GThmFw==
X-Received: by 2002:a05:651c:210d:b0:24f:146c:698a with SMTP id a13-20020a05651c210d00b0024f146c698amr7911463ljq.362.1651047565989;
        Wed, 27 Apr 2022 01:19:25 -0700 (PDT)
Received: from shc.milas.spb.ru ([188.243.217.78])
        by smtp.gmail.com with ESMTPSA id y10-20020a2e978a000000b0024f17b6db32sm526092lji.97.2022.04.27.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:19:25 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/2] ARM: dts: am335x-myirtech: Update NAND default partition table layout
Date:   Wed, 27 Apr 2022 11:19:14 +0300
Message-Id: <20220427081914.6773-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427081914.6773-1-eagle.alexander923@gmail.com>
References: <20220427081914.6773-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch replaces the legacy partition table layout with a modern style.
As an additional change, we are reserving space for three backup MLO entries
and increasing space for the main bootloader.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi |  3 ---
 arch/arm/boot/dts/am335x-myirtech-myd.dts  | 20 +++++++++++++-------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
index d94e096983c7..6eea18b29355 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
+++ b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
@@ -131,9 +131,6 @@ nand0: nand@0,0 {
 		gpmc,wr-data-mux-bus-ns = <0>;
 		ti,elm-id = <&elm>;
 		ti,nand-ecc-opt = "bch8";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/am335x-myirtech-myd.dts b/arch/arm/boot/dts/am335x-myirtech-myd.dts
index 1479fd95dec2..9d81d4cc6890 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/am335x-myirtech-myd.dts
@@ -227,14 +227,20 @@ &mmc1 {
 };
 
 &nand0 {
-	partition@0 {
-		label = "MLO";
-		reg = <0x00000 0x20000>;
-	};
+	nand_parts: partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-	partition@20000 {
-		label = "boot";
-		reg = <0x20000 0x80000>;
+		partition@0 {
+			label = "MLO";
+			reg = <0x00000 0x20000>;
+		};
+
+		partition@80000 {
+			label = "boot";
+			reg = <0x80000 0x100000>;
+		};
 	};
 };
 
-- 
2.32.0

