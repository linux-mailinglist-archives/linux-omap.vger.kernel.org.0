Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 214D9622FB7
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 17:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiKIQJh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 11:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiKIQJW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 11:09:22 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E95422B04
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:09:21 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so2729667wmi.1
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=377Ez3nMEOPsVJyOk9EU2zrf00KSzX6iezf+doSoqP4EwlPVho/P2c/4Dsw6l08Uag
         nckthQtc9HYabWQCcL635gyXZ+dB/nsRVPMzAJn0R3yN9XDN4b+HpIY2Z5Q9gBDdCeWY
         dbwAN0k842AreXl4x2vy13s61CUYP9oQ6nHsalUNghnpQ7gnZ93DuTafisM5LLKU6SqB
         qY7h1ILnHhyyI6ewmk0Md81vMlaon3GMytyG67jkWz5OSS9JuSHv7MJynrDn9OH17e8O
         R7YcuD4F4SsaKrO8i7r01RQq79hRgCu1vRyGb29jxv7dsDA0YYVcSwYmgJdmU1PziKSu
         DwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=J0BTjWcgiZpAD3+OtQpuipSQAwgzYujX1ui9tvIRZNKp901HYcS25vYLgJ9fnETNIi
         z1N43lpbhg58G4x7n+VgnS1jgIwmGz6i0MBt1+GEE/Gnk90oW1t1cOAhYXPV9WO/7Wwj
         tkkj0DY/khqPkE20bVxVlpKAogKef/PWinvPct/6PAzDo//CektJOyVRupvra9D2SmVh
         par4rBiXSJd0ROj6oflnlKrGW7CPNv05lKVO+Vaw35zAE5LdBcc/qTkdtdQnX7wfF9en
         HgOK8YH28kp4VTPW3x13vTcAtsRGTfZATMQz3LQ6BUxrxxfiwSPWJV57eyaVyLB/YiIZ
         edHg==
X-Gm-Message-State: ACrzQf1bZ3smfzeP+ylGlOd1U1iFZ3yZUDqT4voLIx1HYFOkFf4ma/wT
        oXBnOZ5Lng9YTdmLeb9xxrdJJA==
X-Google-Smtp-Source: AMsMyM7+khYv7wfGDyVeza0q4glxHNafVvw+j7sShpEgka0sA6UXyNEiYYmHkYcmvorKtb+0Rq3E2w==
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id l10-20020a7bc34a000000b003c6e069d41cmr51051209wmj.180.1668010159869;
        Wed, 09 Nov 2022 08:09:19 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm13307772wru.50.2022.11.09.08.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:09:19 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     Mark Jackson <mpfj@newflow.co.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: nanobone: Enable RS485 mode for UART3 & 4
Date:   Wed,  9 Nov 2022 16:09:01 +0000
Message-Id: <20221109160904.183147-3-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109160904.183147-1-mpfj@newflow.co.uk>
References: <20221109160904.183147-1-mpfj@newflow.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

UART3 & 4 are both RS485 ports.
So we need to configure and enable this by default.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 arch/arm/boot/dts/am335x-nano.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 05cbfe24f778..cecc2afaeff4 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -187,12 +187,22 @@ &uart2 {
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
+	rts-gpio = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 	status = "okay";
 };
 
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins>;
+	rts-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 	status = "okay";
 };
 
-- 
2.34.1

