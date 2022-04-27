Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B9E511366
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 10:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359365AbiD0IWd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 04:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344335AbiD0IWc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 04:22:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6E6326D9;
        Wed, 27 Apr 2022 01:19:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s27so1659704ljd.2;
        Wed, 27 Apr 2022 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=thO53jrsOAs+etGPIDbDDOLCF7ipiCwZm4mRmJqCtTU=;
        b=Qa5dd+ssUqh50/ykcVuGzQ8zbSJEJxchFGwT3Tvcbz/NHtln6T+aFY/sqp47SQx/jH
         4mw9ChFNbEMUMEwzUNJu5RS3YllnXrxxLfEE5NzghfAJgOmBqk1+8ycZbE8DB6NjW7nF
         1Qkk8a4zimYUGHHk2Nx4cOMyQPpG3V/utIeolahqKQ7N4bdx3HdQFYYo3OsrWTqVgpqr
         SSENCdF469BqR4yAxwTqKR+HqbJ/S9eySykyUrcIsNk93CBbprxlGGRnrrPiymDFJw4B
         0wxLdD/eXmHZ3m3wPOxnN8leLYjVcnal3bdPqJ9gROy+kuefDyC0mNg0dnlnsQs4rNMR
         jX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=thO53jrsOAs+etGPIDbDDOLCF7ipiCwZm4mRmJqCtTU=;
        b=h3Te5Vu4fRstGBGE9zbx0yPsMXXe1EsMiqnir63yTW9kdYaTtcrMzRyalLmK4YnF5E
         qm8CFLAvDmjvXnnPgJAv4DPd2XBT2cxb987K0a1JKE9mHWmnkjI4EJVuniyZfhSfW4Tq
         +Q6zCBR7ZLhRKDxTU+Uv2n7jvW8rSLKsF2F5D4Ge8jjzDJgaBZhRFqgVg+J4pCf5Efol
         5ENmslsYtk8wwDDHdR6jVHCePc8Nzzw7GA1/EkFCYN1O1glxP9yWvr/zPAoljApor4vf
         nUmEdhFDsQaVOrHEbGB0An09S5itpgkyrEu+yHFAAOzZxCUyG5SRK9LT7FmbuTl64E0F
         Wa1w==
X-Gm-Message-State: AOAM530g2azWF7KWAxzoM3RGHckH1+itIT4gEMjX/5l0tp43GMb+1Ypo
        DCqWpKUe6pNC2HJptm7LMeaXdaDkwj3L8c6tzNH4CQ==
X-Google-Smtp-Source: ABdhPJzuhkG2f1JAG17NHqxFNJHSMDgu1TKiTs+OPWZDKu3CRibtIRuGxBP8IDLhZMA/92nljuamVw==
X-Received: by 2002:a2e:8ec6:0:b0:24f:e8c:230f with SMTP id e6-20020a2e8ec6000000b0024f0e8c230fmr11085538ljl.530.1651047559622;
        Wed, 27 Apr 2022 01:19:19 -0700 (PDT)
Received: from shc.milas.spb.ru ([188.243.217.78])
        by smtp.gmail.com with ESMTPSA id y10-20020a2e978a000000b0024f17b6db32sm526092lji.97.2022.04.27.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:19:19 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/2] ARM: dts: am335x-myirtech: Add an external clock oscillator for CPU RTC
Date:   Wed, 27 Apr 2022 11:19:13 +0300
Message-Id: <20220427081914.6773-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.32.0
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

The CPU RTC has an external crystal, so to keep time, let's define
it for devicetree.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
index 245c35f41cdf..d94e096983c7 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
+++ b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
@@ -27,6 +27,13 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
+	clk32k: clk32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+
+		#clock-cells = <0>;
+	};
+
 	vdd_mod: vdd_mod_reg {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-mod";
@@ -149,6 +156,8 @@ eeprom: eeprom@50 {
 };
 
 &rtc {
+	clocks = <&clk32k>;
+	clock-names = "ext-clk";
 	system-power-controller;
 };
 
-- 
2.32.0

