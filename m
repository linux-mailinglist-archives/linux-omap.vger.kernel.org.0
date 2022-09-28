Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E0C5ED0BC
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 01:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbiI0XIO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 19:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiI0XIM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 19:08:12 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C353010CA7F
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 16:08:11 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so2408773pjb.0
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yeSMLt0QcWRozcoJu3RXA4AvoS1ZsHlIkOCTmTowx7I=;
        b=XLcAMNhytbBtG/x4qe4JVVXoU/oRahrzMNPA9XzB+cuOn8igGK7LvuqiDYN/KeMHep
         mEBzCU6kLdYlrA3J/EU3V9wS2irZUAE8JMJEsNz+88j4p7Ys0wisPZy0WomNwOWjOxYF
         hU9Rcpc+uPty0rtryu/ueazfzufLAL97Iops1jTr9An0Oy0cltL9JI0xUNdu0a5Y8nm9
         Fm5wb0hS8ZL9jaZD5CarJEhwytuP56ZeBIsQfTBITPWFLRxLN+tzpkAAhVx4veStuSGT
         SNhhIzPYoQcfyTADq7Bv6CfpdV9chQVSYo+myWL1CkJZoCjtF7pjeIFZsPwY6KRwSFR/
         tkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yeSMLt0QcWRozcoJu3RXA4AvoS1ZsHlIkOCTmTowx7I=;
        b=w2TSNniNTUJQIsHF/k0RiZDwfDy2xIg4rZyYy6RNc4Wcwfx9L133V7et1sqvVYGpLC
         IMjzCHoCt2XJzLNP/iMwhHdnsVMGPhWQajVIjhyeBabGCbO1Ui4EVvB6rILCivFVKmgJ
         wDQYW5CGTbIlvny6QRT4IJkMXkhoJBPnQTHCcNf8mdCYh5j8zOp02UvCl7qbkNJXZVn9
         z8OddUlzLQECxUCgqrWoQV/upJXrF7OdEod9Cvb+hTTSZW1BpS9KxGvUGIZLmNeC58p3
         vifnQja+KUkHyVxVE9hZ2z+yRbP/WArqZqNTdGFetGG1LM25i3UTLBbJ1UWaqcni3SBT
         LelA==
X-Gm-Message-State: ACrzQf0haA0vKmfDgHKDk9+E4fZ6f0VXvQrWudkTfJGACWw3BaUv1amr
        9xaxfe16FvLheF5/l3l4sgtyfg==
X-Google-Smtp-Source: AMsMyM5nOkGYTE6OZybegez1sBEh42c3rGjThtjItYnhiNhXeGlAfwkwT3KjR3niFYWOwRx+6naXRA==
X-Received: by 2002:a17:90b:1d8a:b0:203:6db:ed6f with SMTP id pf10-20020a17090b1d8a00b0020306dbed6fmr7148972pjb.228.1664320091272;
        Tue, 27 Sep 2022 16:08:11 -0700 (PDT)
Received: from localhost ([76.146.1.42])
        by smtp.gmail.com with ESMTPSA id i14-20020a636d0e000000b0043954df3162sm2097103pgc.10.2022.09.27.16.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 16:08:10 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        dmaengine@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: [PATCH v2 3/3] dma/ti: convert PSIL to be buildable as module
Date:   Tue, 27 Sep 2022 16:08:04 -0700
Message-Id: <20220927230804.4085579-4-khilman@baylibre.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220927230804.4085579-1-khilman@baylibre.com>
References: <20220927230804.4085579-1-khilman@baylibre.com>
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

Combine all the SoC specific files into a single lib that can be
built-in or built as a module.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/dma/ti/Kconfig   |  3 ++-
 drivers/dma/ti/Makefile  | 15 ++++++++-------
 drivers/dma/ti/k3-psil.c |  2 ++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index f196be3b222f..2adc2cca10e9 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -56,7 +56,8 @@ config TI_K3_UDMA_GLUE_LAYER
 	  If unsure, say N.
 
 config TI_K3_PSIL
-	bool
+       tristate
+       default TI_K3_UDMA
 
 config TI_DMA_CROSSBAR
 	bool
diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index d3a303f0d7c6..383bbd6d12b9 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -4,11 +4,12 @@ obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_DMA_OMAP) += omap-dma.o
 obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
 obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
-obj-$(CONFIG_TI_K3_PSIL) += k3-psil.o \
-			    k3-psil-am654.o \
-			    k3-psil-j721e.o \
-			    k3-psil-j7200.o \
-			    k3-psil-am64.o \
-			    k3-psil-j721s2.o \
-			    k3-psil-am62.o
+obj-$(CONFIG_TI_K3_PSIL) += k3-psil-lib.o
+k3-psil-lib-objs := k3-psil.o \
+		    k3-psil-am654.o \
+		    k3-psil-j721e.o \
+		    k3-psil-j7200.o \
+		    k3-psil-am64.o \
+		    k3-psil-j721s2.o \
+		    k3-psil-am62.o
 obj-$(CONFIG_TI_DMA_CROSSBAR) += dma-crossbar.o
diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
index 761a384093d2..8b6533a1eeeb 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
@@ -101,3 +102,4 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(psil_set_new_ep_config);
+MODULE_LICENSE("GPL v2");
-- 
2.34.0

