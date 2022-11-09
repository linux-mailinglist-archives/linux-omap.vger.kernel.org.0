Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8633C622FB4
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 17:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiKIQJe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 11:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiKIQJY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 11:09:24 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40848101C9
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:09:23 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a14so26487116wru.5
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy2f8+NzXqqh+hHluSqYA8rs21AngxEcIYG3EwxYgis=;
        b=XPHxngsFSQWue5/ZKwoWGPpRSKFXWSnBa+6is4ftxGzhgzZYsXOceU9y1WN5JtVn1B
         aUiiZwBBdtB41SEVfqzVa/PikXsXGL1DrArg8Wv69qjCeaX8lirPnjTb0ASfilOtraGy
         2EI8ckjZXxgHO+ndRxlRY1JuCfJ8MfSuOtzIuSRvvOZN4/Tbi7Ca2fLNVMOAlbe5auY1
         aqXuIGSemPtRn7gTm2BiU3i3V6pem2ToV6TF8q1WiPWNYfDhdj6cK1Z23+c2UpASLvQv
         i3iplUkCgb7oFZjHTmRTsIsFXPLboquP5m8L3JeS+GntDH7zb+pWOuXMKzyV4yKf5eu9
         O3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy2f8+NzXqqh+hHluSqYA8rs21AngxEcIYG3EwxYgis=;
        b=RLyQoSd3ZIkUQbdDiu6lKzzSx9Xxz2PLuHc1r936vpkPAnk/HaYolWpLRSKA8wHziK
         hMo7XjsROlfy4el6Nl9a7UvFN2miBugUq1uSWkx4Mw9s/Vm2FeI29As0qPGkCr+tE60u
         X+Wll1tFseEDNXGhVjTZIzDYBi7Jf7EGVy/vlcjvqX23LOkMnve0Vhi2tK0q9ci4nHIj
         dIaz4p7nGApFCjHKcp077k5lRWG8rAnsLeBhNTIUCmqHKeEWnbWMIoY/dPcgAxpm8m0w
         vXwWvBXqG3YOlyJxRqhyUPwaen98p72hFcxsnlbA0YLlVleb+Byp9vv5MgXRQ9TqvM7q
         9bow==
X-Gm-Message-State: ACrzQf3xKXB2FQ5PAqua6E41cdpi1xtOs0BgWKG38uUChwSPGE69+Y8V
        2MgrN95XT9B7CXuSy7j7Lp9bLA==
X-Google-Smtp-Source: AMsMyM4kMZdZIbntenev7NAd8FtPrEx319fPVgDr1A96WLsrqhQsOxDeGrhtoxh8EkTb1EysuRexfQ==
X-Received: by 2002:a5d:58d7:0:b0:236:6c53:6123 with SMTP id o23-20020a5d58d7000000b002366c536123mr39987592wrf.719.1668010162874;
        Wed, 09 Nov 2022 08:09:22 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm13307772wru.50.2022.11.09.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:09:22 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     Mark Jackson <mpfj@newflow.co.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: nanobone: Enable USB host
Date:   Wed,  9 Nov 2022 16:09:04 +0000
Message-Id: <20221109160904.183147-6-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109160904.183147-1-mpfj@newflow.co.uk>
References: <20221109160904.183147-1-mpfj@newflow.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add missing entry to enable the USB host.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 arch/arm/boot/dts/am335x-nano.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 728164298a5e..61af12b70688 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -423,6 +423,10 @@ &mmc1 {
 	wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
 };
 
+&usb0 {
+	dr_mode = "host";
+};
+
 #include "tps65217.dtsi"
 
 &tps {
-- 
2.34.1

