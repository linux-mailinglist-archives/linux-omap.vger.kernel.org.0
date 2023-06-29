Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9BF7426FD
	for <lists+linux-omap@lfdr.de>; Thu, 29 Jun 2023 15:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjF2NKf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jun 2023 09:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjF2NKe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jun 2023 09:10:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAA430C4
        for <linux-omap@vger.kernel.org>; Thu, 29 Jun 2023 06:10:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so1010117e87.2
        for <linux-omap@vger.kernel.org>; Thu, 29 Jun 2023 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688044229; x=1690636229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RD+XvmYofIdVnW52L0rqU8XQMeF6GHo9WEelTLPpNE=;
        b=N1lnGocpxWgUKDGX79r12IAcdxENU1bP+px/srN1cj2qtddV9DcaKIZ5FvIuUUOdpR
         ARtOUEMCn8yirA5r+wELxTi+7fo+iMq6USuzFvp/Q8fgKtws0Ajc5askqqrAmNc5gPSy
         j+3YLcM5hKXGmW5lRnb06JLBLHnubeZW59XGlvkl4PcPufmoqxWqRJdkbqsouq5yxnnj
         A+m1B9A0BusxylW5cBGKDQHRp3hxRGIIYjdVu/urNKPI4kB17JoT3ar1DCP7NwYgAF9G
         20eYgpeoVUDIr/UImM/ckQQ88Q1kW/JGUuHIKAQu/0bi4+UmkHgaU9IyP1Ktgg043ped
         hPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688044229; x=1690636229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RD+XvmYofIdVnW52L0rqU8XQMeF6GHo9WEelTLPpNE=;
        b=YGsnworFif34m/dci+NOfsItietJQNU3eqUaGyA0CpMuSeKIL5z3VXiV9Zs2TyeBCZ
         Sf5zYKYoax2h6pKp5GiGuSHdGHxp1dw3L5YlP1q7L06CrUKz9xruJP3kZa8WVEJhw5q/
         HMw3YGWrnAzefUuJaMcQxSKCxw4bCGmObn8+H2KmlK1eT+L1zb/jd/OCL91ALp14OmYg
         xOtSg5LhvEpIetMbkfS2THfcQRsYoDKAj5PGqo0DaZU3hy6MRYQtS9kwP4fARIrKEuWO
         MnXmuq/m9QpsIaMSpATUxzgYCbKF+RN8PF9/o6BlEl2dzDPSY4NK9bDjQ7DbKcTM9DmG
         6Dyw==
X-Gm-Message-State: AC+VfDwiZOKsB52c2aYh0YA4A8VtUMVSptGq0SNTOxnUHDO57qc+wFPH
        4GuYN6V5+DA7j09ZNoEDNHgUlA==
X-Google-Smtp-Source: ACHHUZ4Z3EAwgY/V4Unkz37ntYnhQ2mYhLNcV2e860hITqCQ8/GsVE9R/rwx86zoGZZSzg0cLw4Log==
X-Received: by 2002:a19:4f49:0:b0:4f8:5ede:d452 with SMTP id a9-20020a194f49000000b004f85eded452mr18786375lfk.55.1688044229316;
        Thu, 29 Jun 2023 06:10:29 -0700 (PDT)
Received: from [127.0.1.1] ([77.205.21.223])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c214400b003fa95890484sm11885899wml.20.2023.06.29.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:10:29 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
Date:   Thu, 29 Jun 2023 15:09:55 +0200
Subject: [PATCH 1/3] ARM: dts: am335x-evm: Use usb0 as peripheral
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-usb0-as-peripheral-v1-1-167f78a11746@baylibre.com>
References: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
In-Reply-To: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vigneshr@ti.com, nm@ti.com,
        Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688044226; l=587;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=VuHnk9opfMZuly3Cn3AhAgy4Lfrk1vZA6lD6fSV4glg=;
 b=MCPZC7bjS+bEHmVydCJyhNBvWvM1NRzu2VVAy1nk8qfnkOUEue1MDrVZQ2msUd6lP303fCG4A
 xLBFUBpqFt6AZ5iSXGGqtFkQUWwmbOD95S9zBHiJ9az/itmHhT11kXS
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch configures usb0 dr_mode as peripheral.
This USB port is mainly used for RNDIS and DFU.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm/boot/dts/am335x-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 5beabaa5ff6a..75450458bcb8 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -411,6 +411,10 @@ tps: tps@2d {
 	};
 };
 
+&usb0 {
+	dr_mode = "peripheral";
+};
+
 &usb1 {
 	dr_mode = "host";
 };

-- 
2.37.3

