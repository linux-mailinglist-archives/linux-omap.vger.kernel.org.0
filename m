Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489C15EAF99
	for <lists+linux-omap@lfdr.de>; Mon, 26 Sep 2022 20:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiIZSWg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Sep 2022 14:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiIZSWR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Sep 2022 14:22:17 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDFE6DFB9
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 11:18:52 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id v4so7267645pgi.10
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/0Wgb/pUWIq+NWeSNBH6i++oWwTqz1d9Kg9pALwjvjA=;
        b=OAbnJpnmU6XFNt5nES+EJFQyCvS7N43F1TH8Qvar/5VyAvdmf04DqJIB+zQlY/21Fo
         KevaxR1gGYYO1iMedhUOPk6f4fg1m93ghagAUs06mw/zHuzurupi7t21VCRdiV8CW5bd
         xPdL9ubtYkZSyTQrRPXPJ11aj2Wb/IYTA/AmLxTalsQlXxUYKFCqvrGNDIJWFrQpL50m
         /mj3thiS3dYLLd2s/Wa/3QPVv4QHWMrEuvmV2vW4pLQvVBTZvFHMRZmrHU6xpPDntZqo
         fnzHYGEr6VxiwHkg+cXT3hAp4a1o3uiIPGNdBn91PmQXB5U81wCzSzuGjnX8yhOxKnXy
         f0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/0Wgb/pUWIq+NWeSNBH6i++oWwTqz1d9Kg9pALwjvjA=;
        b=IxUCgssOZ2oel9vxsWDwqZTFtOwy3OXHhYOluUyjAyDOfqadOf2kWljrT4ELbBfl2I
         e/X+0VOd4iQT9fW9Ystq+c1HUnPaIDQ+QR+VosVJcWavgLcrN4jVVPIyyyzsa5p5pDgJ
         xetvEufvs7XpLk2KOyEoVknPkvtw8A9gkmGlSwn3U3PcGPE+XAdEVOxKiSoioxAb2L9W
         MXctGfX+CK4aKR+m9ibRE49CkAMx7E6RswPmnWabBDSfJDGP8oNWeEktQZGwz5itxNkI
         mxsHEOSs4jw5j6mxHILZ+A1PtstC8xudR1018owcZsgjqEKk3GBOoTSTr7CCsSfHBAKv
         CgIA==
X-Gm-Message-State: ACrzQf12FNgcU8EMLbvY+klMIOdhtvaR2SHNgXX2qgOAtc1aZ86bNVXA
        kN29VFMWMJkOj1HYmGNS9i9EPg==
X-Google-Smtp-Source: AMsMyM7ITbNUZuCGG4FQ4Hb14MHVV8qELDpnSpkbJKtx6Z/tP/VCS6/W2sMfgf6huxANh254I8Kr1Q==
X-Received: by 2002:aa7:9af5:0:b0:54e:5455:2b8c with SMTP id y21-20020aa79af5000000b0054e54552b8cmr25379183pfp.63.1664216332104;
        Mon, 26 Sep 2022 11:18:52 -0700 (PDT)
Received: from localhost ([76.146.1.42])
        by smtp.gmail.com with ESMTPSA id z16-20020aa79e50000000b00537d7cc774bsm12510356pfq.139.2022.09.26.11.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 11:18:51 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        dmaengine@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: [PATCH 1/3] of/irq: export of_msi_get_domain
Date:   Mon, 26 Sep 2022 11:18:46 -0700
Message-Id: <20220926181848.2917639-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220926181848.2917639-1-khilman@baylibre.com>
References: <20220926181848.2917639-1-khilman@baylibre.com>
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

Export of_mis_get_domain to enable it for users from outside.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20200122104723.16955-1-peter.ujfalusi@ti.com
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index d22f605fa7ee..c9308baa32c5 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -727,6 +727,7 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(of_msi_get_domain);
 
 /**
  * of_msi_configure - Set the msi_domain field of a device
-- 
2.34.0

