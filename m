Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23DC677F4B
	for <lists+linux-omap@lfdr.de>; Mon, 23 Jan 2023 16:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbjAWPQV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Jan 2023 10:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbjAWPP5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Jan 2023 10:15:57 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC8028D0B
        for <linux-omap@vger.kernel.org>; Mon, 23 Jan 2023 07:15:35 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id q8so9262872wmo.5
        for <linux-omap@vger.kernel.org>; Mon, 23 Jan 2023 07:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWAQjSOi13aBCxQ19WRdS3HTe/RxmEH0TVj9PZ91KvQ=;
        b=sqGhRhnh5j+fCwU8OnlvQHyyleTPWiYMuSdo/PkbC7+kseo1mRUwT5HM2jwZQe9oCG
         4xD72Q8t2VaZoElqubUr2mdzyyPN7F6+arU9qjHRbYLkgRTVCmg3MHcNre+f/Yf2Q7TM
         /580B9/8bOUm7ZOVyYCRQgBB7Vr0MEBtO6YkMXpzx/lqWVY9z+RpnT/ENkzwvToGIGeC
         GaJuQyzw1L3MTIIobEjLaPR8mEyWGKTdE0AvwkxqK25gADXi+tn1pYUbouzySBWKgNqX
         bfTqKXgO65hDC9yMY/MUY7X8v8xD0PLgxtQx4EMx+DIGNlACYqM0Fn3y9EpIqVbMTNsH
         Qa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWAQjSOi13aBCxQ19WRdS3HTe/RxmEH0TVj9PZ91KvQ=;
        b=pAUGarGAkBB5FIw2lrdRPCHENruXqoSgLbqNZ6Ufrvhi1dFOz4y8+ABo+ObqiJMHnc
         yDCB3tG2rWcK4z8oUASbz5UpQhQQj/CCvilYCH38N7tRN2Ht2WgU/oa872xgRSy2Q5VL
         rV1LDh8DNI754y2vaIy+8JzFvD7Dq/62fIB4ZrabCHzJbMNpGOHh5zhYtXOsqZL0PZGu
         a86llwsqyE929i5Byorpe259DndII32rcFIkf2HtOag1bXP+ZYt0cJmgZj0f1QKrBkN0
         rCViozSFcFWEoTP/7wSw5MtaaXrOhDRlCFrY3xy5LqOQ8zvaSgmtiuwdqJycD1oRmYCu
         zHdg==
X-Gm-Message-State: AFqh2krAQ605xPqBsgcPTQyUuFBNwTB8MoKTGq/AFLt3If5ZaCfR0Sel
        oc7YOPQJIUbpEBI5sjxcfTZblQ==
X-Google-Smtp-Source: AMrXdXtThWQ6lVueaaCAa0LEOvsD5PloZt+g2WnEjEBhjrLmQOvc0jbFEVU7lKNZxBP/TRUcXxPwmQ==
X-Received: by 2002:a05:600c:34d1:b0:3db:1434:c51a with SMTP id d17-20020a05600c34d100b003db1434c51amr18691958wmq.40.1674486933463;
        Mon, 23 Jan 2023 07:15:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s5-20020a1cf205000000b003b47b80cec3sm10871971wmc.42.2023.01.23.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:15:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: omap: align UART node name with bindings
Date:   Mon, 23 Jan 2023 16:15:31 +0100
Message-Id: <20230123151531.369419-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect UART/serial node names to be "serial".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/omap-zoom-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap-zoom-common.dtsi b/arch/arm/boot/dts/omap-zoom-common.dtsi
index 1e96c865d41d..8adc0ef01f6c 100644
--- a/arch/arm/boot/dts/omap-zoom-common.dtsi
+++ b/arch/arm/boot/dts/omap-zoom-common.dtsi
@@ -14,7 +14,7 @@ &gpmc {
 	 * they probably share the same GPIO IRQ
 	 * REVISIT: Add timing support from slls644g.pdf
 	 */
-	uart@3,0 {
+	serial@3,0 {
 		compatible = "ns16550a";
 		reg = <3 0 8>;	/* CS3, offset 0, IO size 8 */
 		bank-width = <2>;
@@ -50,7 +50,7 @@ uart@3,0 {
 		gpmc,wr-data-mux-bus-ns = <45>;
 		gpmc,wr-access-ns = <145>;
 	};
-	uart@3,1 {
+	serial@3,1 {
 		compatible = "ns16550a";
 		reg = <3 0x100 8>;	/* CS3, offset 0x100, IO size 8 */
 		bank-width = <2>;
@@ -61,7 +61,7 @@ uart@3,1 {
 		clock-frequency = <1843200>;
 		current-speed = <115200>;
 	};
-	uart@3,2 {
+	serial@3,2 {
 		compatible = "ns16550a";
 		reg = <3 0x200 8>;	/* CS3, offset 0x200, IO size 8 */
 		bank-width = <2>;
@@ -72,7 +72,7 @@ uart@3,2 {
 		clock-frequency = <1843200>;
 		current-speed = <115200>;
 	};
-	uart@3,3 {
+	serial@3,3 {
 		compatible = "ns16550a";
 		reg = <3 0x300 8>;	/* CS3, offset 0x300, IO size 8 */
 		bank-width = <2>;
-- 
2.34.1

