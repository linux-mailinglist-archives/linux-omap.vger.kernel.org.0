Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEF66387F2
	for <lists+linux-omap@lfdr.de>; Fri, 25 Nov 2022 11:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiKYKxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Nov 2022 05:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiKYKxi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Nov 2022 05:53:38 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083534A06F
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 02:53:34 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id t1so3148661wmi.4
        for <linux-omap@vger.kernel.org>; Fri, 25 Nov 2022 02:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppMSaTEj4JL58q2duGJ/6acd9q7ZP86JJkM9tAtSfh0=;
        b=HY2YQ0zU3TeiEiLi73QEKLAao3FUfjpLwPA+whRHuQEGrHBKgg/qDNhXOqfhkZmkvx
         o8NzGi66ugWWDVxrQuGYJPpsewsVm7PAaSFwzO9XC4h21Xc+yyQCKNiGVl4jJWykXex3
         Ah2NAYDBOebhQbUKw+pkRYV7wdJ7Kqqk9gkuq+jGXltTHy2kC+iAE2ZQpT+hMbIjYlej
         5Lpi+4/9+6sEaYEzWOZ+f4OSKKMvrrM2PYBtsrgmz1G0w6ycheRQPLWhEW91xw6P6gj2
         VtkccTBOODB/ryY0JXs/i9pmurSD2BwEPEkPhoJ4Rp59q9K4k6z8ypFELiDq2ozEMIDm
         +3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppMSaTEj4JL58q2duGJ/6acd9q7ZP86JJkM9tAtSfh0=;
        b=IR3R3sMvATA9Ej+P2nOfOiDRzZyYFDjjrtuuRpzDY0J3ynpMHu1DkvEJthB0wvo3BA
         ZM6geQSIiKtdcZHf0QQbiuAxuzdWbRTaR1wKQVPZuVdlFi0GeL3k4IAJpE0GP8e2V56y
         UhOBVIqcRoSga6atWhKh7TUyLI0FlklP82OIjsXk+p2J5a+fbmSJq6KfECv32RlFoS6C
         rbQiT7HNVVOTErNHbCmxBzEw3Nw04+eU/uIeUC05D3d9K4Us8R7WUX4d8+SSR6RqTp24
         wowtw3ToNb96u0P0ZzDEQTBu5IKUWdxa6uMAljt1Rv5w4vcP4AV7PGsMdXfUeaHp0+M6
         DgFw==
X-Gm-Message-State: ANoB5pnXdRj4o5Gt4llRb+pkcoInlo4q23YZOP1RsKa8Trk4ZdJk1RtF
        Xt5JYH3Yb3hdvIFHm/0xLYQtJw==
X-Google-Smtp-Source: AA0mqf4ZF7l2yedH8AbNFeQ5TCgCxH+aFRDygIJv64Z1XsHG+lfsc/aqfiT6o8pbn8wzHBs7CSelQQ==
X-Received: by 2002:a05:600c:4f90:b0:3c1:aeb9:29b6 with SMTP id n16-20020a05600c4f9000b003c1aeb929b6mr13426810wmq.97.1669373612538;
        Fri, 25 Nov 2022 02:53:32 -0800 (PST)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:fdd9:1fe6:bff6:fb20])
        by smtp.gmail.com with ESMTPSA id l11-20020a1c790b000000b003b4a699ce8esm8525529wme.6.2022.11.25.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 02:53:32 -0800 (PST)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     nm@ti.com, kristo@kernel.org, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     khilman@baylibre.com, glaroque@baylibre.com, nfrayer@baylibre.com
Subject: [RESEND PATCH v2] arm64: arch_k3: Replace select with imply for TI mailbox and TI SCI
Date:   Fri, 25 Nov 2022 11:53:25 +0100
Message-Id: <20221125105325.489068-1-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
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

In order to build TI mailbox and TI SCI as modules, replace
select with imply.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
---
v1->v2:
Use imply instead of removing select altogether and dropped
patches 2/3 and 3/3 from previous series as using imply makes
them redundant.

 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 912529ac58b38..288935638c7ad 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -126,8 +126,8 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
+	imply TI_MESSAGE_MANAGER
+	imply TI_SCI_PROTOCOL
 	select TI_SCI_INTR_IRQCHIP
 	select TI_SCI_INTA_IRQCHIP
 	help
-- 
2.25.1

