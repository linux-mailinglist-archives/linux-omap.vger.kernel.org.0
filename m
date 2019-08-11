Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFEA8890BB
	for <lists+linux-omap@lfdr.de>; Sun, 11 Aug 2019 10:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfHKIsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 11 Aug 2019 04:48:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43541 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfHKIsW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 11 Aug 2019 04:48:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id h15so2094912ljg.10;
        Sun, 11 Aug 2019 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXHasjFTPMOY9kq0PL7JOaC1aEi+PxAZiTuH1S1KxPY=;
        b=k62jIKVLNEu0Be0N/7l+wYBc7wVgvBzJUQXjpCeyJS3gbRqwdPYFBfHiK2zFRkxPO/
         OUsBzs1m/cwMfxr7+qlEX9MAa/8hNqiRwT/RaoxM7BDP93INRIHdW7ScRFJVXn93Zkg0
         D0joxhEV1nxkjYMotGQQW029J/hWfjQHoi2WPedN6XNWb1VHf+J1bEOLMEctkUerrI0d
         YvgQ/iazH+JjR4zwMrCP4RAVsA/XwZirTW2p2YnUH1y4Qkj78o/whSTzW5sVSlxtIOTk
         iPCaGFB1tf70KItAywSwXxscFYdixzF9Xl7grRT/iJVPb2V7u4P8TIz1fyoYDgr9QFvW
         /vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXHasjFTPMOY9kq0PL7JOaC1aEi+PxAZiTuH1S1KxPY=;
        b=fvC/y5bJWGTSd8j+kChL/sV39oAXhQiU2ENLuX9v2ph9eYAaDl1B7dqgjyIm3lYy7U
         Z6qxbKtbinrRokqcFF8TGBUKpVNAOTZddc1zYtZkPYw5gbC4BbbAgtkme+xxmvdtvvg7
         MHpZvRrxVGuARK1FxvQGOruO8gs4YuF7RweyYGuGcCYLjqGCq4delbOVMNJS3KH+pc4T
         tezuEG5BqhtIB4SPz4Bc/20URDIiXmkQvDKvQRdheBI26K62XyQGM4KsMt44uAAOho0Q
         tDTJT6WQ+7gKkGNfz23DRt+iGtQnGXWPZFu6jWLiQ17v68o9SwlXe4vckYIj5DSdlMrV
         JHrw==
X-Gm-Message-State: APjAAAXW5BFVUoAvgMuhWAYl2Ic5sWZFdonfrjw+jFoVSs8DnLFwQkBy
        1dZ4k1qQ8B03rO35suDZyC5ile8x
X-Google-Smtp-Source: APXvYqwnlKb4Nta1kIvQyP6WUPknA1M8NdVMu8eeJdxxX6zeqV5kJDCOIXhMt+XQpSwveJeh6SKI8A==
X-Received: by 2002:a2e:968f:: with SMTP id q15mr16037437lji.30.1565513300534;
        Sun, 11 Aug 2019 01:48:20 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id l22sm20242598ljc.4.2019.08.11.01.48.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 01:48:19 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH for v5.3] ARM: OMAP1: ams-delta-fiq: Fix missing irq_ack
Date:   Sun, 11 Aug 2019 10:48:02 +0200
Message-Id: <20190811084802.630-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Non-serio path of Amstrad Delta FIQ deferred handler depended on
irq_ack() method provided by OMAP GPIO driver.  That method has been
removed by commit 693de831c6e5 ("gpio: omap: remove irq_ack method").
Remove useless code from the deferred handler and reimplement the
missing operation inside the base FIQ handler.

Should another dependency - irq_unmask() - be ever removed from the OMAP
GPIO driver, WARN once if missing.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 3 ++-
 arch/arm/mach-omap1/ams-delta-fiq.c         | 4 +---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index 81159af44862..14a6c3eb3298 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -126,6 +126,8 @@ restart:
 	orr r11, r11, r13			@ mask all requested interrupts
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
 
+	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
+
 	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
 	beq hksw				@ no - try next source
 
@@ -133,7 +135,6 @@ restart:
 	@@@@@@@@@@@@@@@@@@@@@@
 	@ Keyboard clock FIQ mode interrupt handler
 	@ r10 now contains KEYBRD_CLK_MASK, use it
-	str r10, [r12, #OMAP1510_GPIO_INT_STATUS]	@ ack the interrupt
 	bic r11, r11, r10				@ unmask it
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
 
diff --git a/arch/arm/mach-omap1/ams-delta-fiq.c b/arch/arm/mach-omap1/ams-delta-fiq.c
index 43899fa56674..0254eb9cf8c6 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq.c
+++ b/arch/arm/mach-omap1/ams-delta-fiq.c
@@ -70,9 +70,7 @@ static irqreturn_t deferred_fiq(int irq, void *dev_id)
 			 * interrupts default to since commit 80ac93c27441
 			 * requires interrupt already acked and unmasked.
 			 */
-			if (irq_chip->irq_ack)
-				irq_chip->irq_ack(d);
-			if (irq_chip->irq_unmask)
+			if (!WARN_ON_ONCE(!irq_chip->irq_unmask))
 				irq_chip->irq_unmask(d);
 		}
 		for (; irq_counter[gpio] < fiq_count; irq_counter[gpio]++)
-- 
2.21.0

