Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1570C3CC2E6
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jul 2021 14:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhGQMKS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Jul 2021 08:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbhGQMJ7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Jul 2021 08:09:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E078EC06175F;
        Sat, 17 Jul 2021 05:07:00 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r16so17906040ljk.9;
        Sat, 17 Jul 2021 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gdg71tTCXe3kkEI2aVUW18f+03eE3ZSaHmz55Gfl6UE=;
        b=rBnzXyvfUXb4WjBfq9f+r0hIqAF5wnjlgJ6/DpWELHG9NOUe2GcgdRbmNaIT3dniiv
         0HtojXxyrSHOgoDLVHdjYYlZfp7vudz9uplwIrf6BVNwspeZvEyzRsvMa1Gp2jm47UAs
         zrM96gVUBzSpTY+Bit5HoGlKP/o8ygVPi2UL4AjJ1fKskxu1mU2VmtIgUJ0BuqJxeYtQ
         pnAmO5Sr/ndyIfHXIdL1thOm/UZtW/RHh3L7MbQS23Cxpix7R406Mhp+dEupSKaYdBzb
         Fn9uAaRz62+mPBk7vW7d2Mddl10VustOAAKEXomavBnfrAHQfEu/MdL9WL5eoXrSzSN0
         xelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gdg71tTCXe3kkEI2aVUW18f+03eE3ZSaHmz55Gfl6UE=;
        b=LXRiWL7/t6tJpyKUFbpw3LmAlyzE8pZmHX0Ud/bdXk1PwgxaVn05eNJcgxft9AOJL0
         Ikux0m8fJbLrN4ub/6IInNcYJAxQ5Z53qIjpOeQzqtxpz1wC5fBbiuQHF2DNdVPGks3k
         WLrlAFVkh0aFvqtMUmaJnMqPjlIz6iNKjHidwOuqrpxbeEG4uMvRUu+H5CS8wX8r5riH
         QJ6G4GAMyDOtTvP/rz6QRhHOstxeGcSD8rzKE2fMc0/Gk0abU3tQy2p5fR9PJ/t8JRqu
         ZROE93X1ETF4U5bWpzXsAvvZSC0JrXFHQCsueM/vEWhJpfUTWZ8q359pZAMRrM9+Tc3d
         +onA==
X-Gm-Message-State: AOAM531hdhP29+/F5njvmeBWiI6rtU6qlo8Yd4Wl6OnFms0D3nf+luw3
        sER0SCCO8KX0zPB7SJ2ZNIk=
X-Google-Smtp-Source: ABdhPJx5iV2ursFpTumwwdRv2WmHY6XEz6KQk62nmH2mqIGsyvqPRdZnsscuF40P1nXwKvNm8Gzk6w==
X-Received: by 2002:a2e:b162:: with SMTP id a2mr13196945ljm.290.1626523619342;
        Sat, 17 Jul 2021 05:06:59 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id e5sm155334ljn.72.2021.07.17.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:06:58 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hns@goldelico.com
Subject: [PATCH 2/3] bus: ti-sysc: Add quirk for OMAP4 McASP to disable SIDLE mode
Date:   Sat, 17 Jul 2021 15:09:24 +0300
Message-Id: <20210717120925.24505-3-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
References: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The McASP module in OMAP4 does not work if the SIDLE mode is enabled, most
like due to module integration issue that the signaling is not working
correctly.
Add a quirk for the module to select only NOIDLE mode when it is in use.

Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9df1e674d3f2..9faae119774e 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1501,6 +1501,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_MODULE_QUIRK_SGX),
 	SYSC_QUIRK("lcdc", 0, 0, 0x54, -ENODEV, 0x4f201000, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+	SYSC_QUIRK("mcasp", 0, 0, 0x4, -ENODEV, 0x44306302, 0xffffffff,
+		   SYSC_QUIRK_SWSUP_SIDLE),
 	SYSC_QUIRK("rtc", 0, 0x74, 0x78, -ENODEV, 0x4eb01908, 0xffff00f0,
 		   SYSC_MODULE_QUIRK_RTC_UNLOCK),
 	SYSC_QUIRK("tptc", 0, 0, 0x10, -ENODEV, 0x40006c00, 0xffffefff,
@@ -1557,7 +1559,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
 	SYSC_QUIRK("iss", 0, 0, 0x10, -ENODEV, 0x40000101, 0xffffffff, 0),
 	SYSC_QUIRK("keypad", 0x4a31c000, 0, 0x10, 0x14, 0x00000020, 0xffffffff, 0),
-	SYSC_QUIRK("mcasp", 0, 0, 0x4, -ENODEV, 0x44306302, 0xffffffff, 0),
 	SYSC_QUIRK("mcasp", 0, 0, 0x4, -ENODEV, 0x44307b02, 0xffffffff, 0),
 	SYSC_QUIRK("mcbsp", 0, -ENODEV, 0x8c, -ENODEV, 0, 0, 0),
 	SYSC_QUIRK("mcspi", 0, 0, 0x10, -ENODEV, 0x40300a0b, 0xffff00ff, 0),
-- 
2.32.0

