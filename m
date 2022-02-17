Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BFF4BAC13
	for <lists+linux-omap@lfdr.de>; Thu, 17 Feb 2022 22:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245229AbiBQVug (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Feb 2022 16:50:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiBQVuf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Feb 2022 16:50:35 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8544168092
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 13:50:19 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f37so1749225lfv.8
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 13:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k02/bKS8aVI9os28coGbc487m6RW3DHQoe7DqZjzTCc=;
        b=LxPObU6Fzi5HT6pY2zP44/iObwpLjY6V7cEhfQnj7LrpgUAftUPZq3DAIRc6ItbOUU
         /78Td/LOWh0KzRCD1HKS/J9i4cxmSsGKPOwUsEGP47HwlxINFHgZklQnDlntvPUkIPKV
         c8TGFg0QD+7p7g2EZrKpeKn72QNg0hHAORjhmoklXDTijX3HRwCFEvUf7uHaIcPsp6OO
         vESiYJKn3mxom+lpUE1tK4ANgwK5cGhdNX8i+J+bQcQ1vIueOQHMxTE9w1nMidxv3coC
         aD5aEr6B4L0PUZzhO7jBdllQGNGQozfQKXJyX3ac6uBJKda6/K/3owkUZ0hVmXJpilPu
         UM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k02/bKS8aVI9os28coGbc487m6RW3DHQoe7DqZjzTCc=;
        b=lr9PtIr3RrOZV9ezyq/nQ7iEw5s5jFoFcm/80BfejmAn84VcnVtQmYiX8S498NXGqr
         OHTX3uOZe5CTidOzYXdCHhk4EbQ/4TKV6lIRSvw+9KfG48BuPGpkgHBLFaqGA/aMP3Oz
         hDJ51VC8ZtxLsPqEsxBuNq5c453qPht5bhNGJIUcyyeXSPoL2JPyyrN80JKTDWs3+SZs
         eXPzy9QXtVBT59p+ln+g5pyTD4o3E1PQdFts9RJiGbTdDi8R/8EFFlKFl2R/LcCTttdg
         habparsR9P6hkvRGzDYTbRJ/JQ9jNtMvyzaj5BpbG7xAVdihLuHHewrgEzOLESgUaooB
         ORiA==
X-Gm-Message-State: AOAM533f5EfIp/ChPtlDadShE4zJx1iKTpso//hl1DQpO/9VVPHOUDT8
        T7IOW1bDlGB3JM23q48Chgs=
X-Google-Smtp-Source: ABdhPJx+NO54QRpZFVUAQ3EaCL3piphY6Wa7kUc7muhaZDCVSY/xg8ysaFKrl1hSGDHPW4wMqZLx+A==
X-Received: by 2002:a19:5212:0:b0:443:5b82:b6b with SMTP id m18-20020a195212000000b004435b820b6bmr3418441lfb.232.1645134618142;
        Thu, 17 Feb 2022 13:50:18 -0800 (PST)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id j8sm99672lja.26.2022.02.17.13.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 13:50:17 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ARM: OMAP1: clock: Fix UART rate reporting algorithm
Date:   Thu, 17 Feb 2022 22:49:59 +0100
Message-Id: <20220217214959.419572-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since its introduction to the mainline kernel, omap1_uart_recalc() helper
makes incorrect use of clk->enable_bit as a ready to use bitmap mask while
it only provides the bit number.  Fix it.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 9d4a0ab50a46..d63d5eb8d8fd 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -41,7 +41,7 @@ static DEFINE_SPINLOCK(clockfw_lock);
 unsigned long omap1_uart_recalc(struct clk *clk)
 {
 	unsigned int val = __raw_readl(clk->enable_reg);
-	return val & clk->enable_bit ? 48000000 : 12000000;
+	return val & 1 << clk->enable_bit ? 48000000 : 12000000;
 }
 
 unsigned long omap1_sossi_recalc(struct clk *clk)
-- 
2.35.1

