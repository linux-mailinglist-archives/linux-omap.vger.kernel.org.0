Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC6743423B
	for <lists+linux-omap@lfdr.de>; Wed, 20 Oct 2021 01:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhJSXnt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Oct 2021 19:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhJSXnr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Oct 2021 19:43:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05593C06161C;
        Tue, 19 Oct 2021 16:41:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 63-20020a1c0042000000b0030d60716239so6385959wma.4;
        Tue, 19 Oct 2021 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQM7560niPcf8GUHkEig/paB8tgdSzM7i6A+3PQ9XbY=;
        b=fqSzBjumPhiqcB85nZUL7r1HosmqwgJYyCVeflqY/hyv4qeluaksQE28Q+Yi9Lr5ik
         7IPpEhBMZJotuqM+il+XY+VotQdVt7hUGdJqKN2KPul60SGSSW9V+XwJAKdojwrgfOOk
         XEmdEWeUqblayDNg2gqK2co8MJi9TKXoCL0NVmHdhSLSmdEThWLLREoyJGKDrdzH4rof
         rJExE4bbRv95s3vKq4NEaQnbdDuBc1uAWy7VGYJlO7GWfnaCFIIVIHKyWbTyHOf151JP
         /FuYSmyEZsnUN8MXPqPayEXxp0t++W5gtrBfkQhJW2Zt2Aczn84eghXf+4BYClh0IyGA
         g+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQM7560niPcf8GUHkEig/paB8tgdSzM7i6A+3PQ9XbY=;
        b=QEqDNF9gDmL09O9z83bJtq8HIZUTDSefIHe2SnSXIA5sEB3HwYqvvhNqP9J3VHc48j
         DF8SiE1QX2L7maxU1XWLfUFD+Jwgav5zBnxYoCkIicLo8x9gAIqxaZ4lMqX7ounk7di/
         YTlFa+Uz1x0/357XraQqziC0NFbJ8QyT7qNj5B9ksmdHs0+Te7XicW58O+7acG0ecSBA
         B27X7SiMcpSqf3VkboAQTfUJsAmMvYSjbu7xT8SzcfldE4tmprVJ+T31T08jZEB+rWog
         I3sppr0P50OLRdQMygNv4tsgIhbEDliEfpju/O9ENKY14PhUcLM/G0gIqD1cFgZF43cF
         aWew==
X-Gm-Message-State: AOAM531KQfwxXuqTTXhmz0Ihn0wiU6SAvvlZkJruMIMpSzjSlbK6OF60
        gUGbUzfqS+CR8FURubK8U/c=
X-Google-Smtp-Source: ABdhPJzGbfbmOs36wsuvADCvsgYd48T7QFbZCacg8//QDJXOCsETVzvklvcpG+U4eJTLg+aleT1mcg==
X-Received: by 2002:adf:a413:: with SMTP id d19mr48749150wra.246.1634686892470;
        Tue, 19 Oct 2021 16:41:32 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.gmail.com with ESMTPSA id g70sm414807wme.29.2021.10.19.16.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 16:41:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v1] ARM: dts: elpida_ecb240abacn: Change Elpida compatible
Date:   Wed, 20 Oct 2021 02:40:59 +0300
Message-Id: <20211019234059.29877-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Vendor prefix shouldn't start with capital letter. The Elpida Memory
compatible was never used in practice, hence just correct the compatible.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/elpida_ecb240abacn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
index d87ee4794f83..9698801cbcfb 100644
--- a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
+++ b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
@@ -5,7 +5,7 @@
 
 / {
 	elpida_ECB240ABACN: lpddr2 {
-		compatible	= "Elpida,ECB240ABACN","jedec,lpddr2-s4";
+		compatible	= "elpida,ECB240ABACN","jedec,lpddr2-s4";
 		density		= <2048>;
 		io-width	= <32>;
 
-- 
2.32.0

