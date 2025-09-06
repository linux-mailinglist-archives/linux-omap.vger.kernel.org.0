Return-Path: <linux-omap+bounces-4594-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B5B46BAF
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 13:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A48583510
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 11:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099D8286898;
	Sat,  6 Sep 2025 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G792guHz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D13277C98;
	Sat,  6 Sep 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757158918; cv=none; b=aQpZ7tdbd3BkGU5nSGpctoifEicnNZrI+LxsaBz1uBhp/Avia3146H+E9bGjkNnLp5Fe1U5lAfIXcrBWJi7FMq1fjF/HYOy1OKUaOl/PEnOJCb4z74E8rK0sgWu6JGGp3jVwls/Z9YvYKTXerIGm/SQ+b/xarKiSM59hh8E2osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757158918; c=relaxed/simple;
	bh=04ePzdSGp+VYWT6RpXmxs/vJzPajiOMqBImddZxi1mY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEnMhAWdU9FN2Jb0YqxXqRayU1Uug/A7SkhiwLTJFqRP6cu441D4jXmlo1SRBsK6sWRQZKmd5dsN8tO1zhx+GWlvicVbF6jxtGLNwIXA/79yHyXjAWbdz/XCu3WsOkhml9Di+mwKGOrdlpemorQ+hwBw/QqwHfmSB9MDAb3HCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G792guHz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722c8d2694so2672570b3a.3;
        Sat, 06 Sep 2025 04:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757158916; x=1757763716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6DXPVZN/mH79rkdyc9JFtNCMULjM+sEP3RuEdXz1D4=;
        b=G792guHzVJhwMYxeEp6kng1zv0OaYPrmX7GMus5HeyNeo7ZDaz9mtl8+KbyjP723Ac
         g0SvSQfQLidIXhi0gtL30SzkdwtZWcwu0gMTTUCs7GYixQWYMxc6LpKcrQUcDFN4Kh64
         CaiiZlosEfqJI2Hy4AEbARXkgtTTJD5bbuFvWle5Ez2pYL547eESEmNmdEsIwh2ywNI6
         9auvi/spfzD5OlcT2Ixya0n7GFQw2sNNsm6OKNLYogFZAwN/2thCM7WKLrmZFIoITPl5
         y26lp0mw+Dl28fh1ZYPLm/QARqB2JaPoebDG1tB3YhxWlxAvTSBDBKfLLphgHXg5plsw
         YrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757158916; x=1757763716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6DXPVZN/mH79rkdyc9JFtNCMULjM+sEP3RuEdXz1D4=;
        b=uywH7fImRShSqzTmp1ru4gmIrF5+KRrv3Pg84pZ5eNMBWsjMoDJ3PJZlr2YiMLR/U3
         Y4+G6Mz2wRs6+zF5uzyyro0HXQXX6C2Fm6MDd1y0EFvVVedGhZ0XNULKKyBCXOrP75FX
         k1cd95mqBkTO+7kwoHgYrt54pYDVujPTDI32NXTnMEv2yZfprZp7p0p3Ns6wQOG/FZHt
         dUOiySDckE0oZ3KpMti6s+NRMSh+HErrAyaSljXmRK40VsZ+LgRe6LV6/JhBhW3xsBRu
         RgJg8UtuFZDnRtfhP0Ryt+NIJykABW83nwI83zZOn2zJkPvidlZ0fvttkrWujCNSqshA
         QJMA==
X-Forwarded-Encrypted: i=1; AJvYcCW04WOljCEq1VHPEKJwF3ANEQvwF0YfxvBEXjb0qJcqwpCAc8gqMAgSSy/vhv5pt+grGsyEOG8Wxjqe+0A0@vger.kernel.org, AJvYcCX/tEXk1az0j6bxEvOrhNWzC/cIbVr7HZDBH+J70NPT7Rqb2HIWfLpaoE9cMhPQ1Ja2BRPoup57NEN4dyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YycsYAoEQowpwS/9yztpEOI1xIGRLr0mz3MunpGQAW8C1EWtmUX
	cvVniGVkftWevTMeBCjxfnshXgDoHMOpkRidlz3F1+xj8zP/v3FPH+XQ
X-Gm-Gg: ASbGncvvfxsq4U8c3JRariXEqjkFHBfBUuPizdtdomTAD/ZW5xDL0cVglIY/teLg6mN
	MC+DwrwICERew63qvCWbQP68Ucnuc8qkIlrCwMVBKhkx+zV0rINiFW12Qstqbts4EfuWxsC05V4
	d2fsYxqDhU7N+Dg+Wdibpvn8KUHuhf+qd5RWaMfCuhlh85liqGgAiWFTwBNuyDXd9xHTBN6VY6I
	MpsZ98JFAlBN+1QjknafqC//UCyntkVqkv8cyR8NMUBw2X2YmiRiMd07t3ILCHo4EfUXLajHlAc
	aMIry6iNpSsALKLMWsrN9CvkwNt6C5W8bNmQG4W0Qmji4vpy6v2dNLMO2P9Vjrguc0j+vs4BNuZ
	d99ofalvfZhmhiaEm8f+1EvnB92MmC/sAyrOBpCwVf5TnlbBWva2OjrTy37cRtqxV4BO77+Y5fn
	8kEg==
X-Google-Smtp-Source: AGHT+IGqmDZVvpvSMlY5+f0EsxnHnb1NU7laNricHF/y7LtLxD3ZRnKA/Vm5kephIxA8q1iQCEA6eA==
X-Received: by 2002:a05:6a20:3d8b:b0:252:2bfe:b65d with SMTP id adf61e73a8af0-2533d5fed6dmr3076517637.2.1757158915863;
        Sat, 06 Sep 2025 04:41:55 -0700 (PDT)
Received: from fedora.. (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725b974350sm16533214b3a.72.2025.09.06.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 04:41:55 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	ebiggers@google.com,
	tj@kernel.org,
	u.kleine-koenig@baylibre.com,
	sakari.ailus@linux.intel.com,
	ovidiu.panait.oss@gmail.com
Cc: linux-omap@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH] crypto: omap - convert from tasklet to BH workqueue
Date: Sat,  6 Sep 2025 11:41:35 +0000
Message-ID: <20250906114135.76961-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tasklet has been marked deprecated and it's planned to be
removed. Make omap crypto drivers to use BH workqueue which
is the new interface for executing in BH context in place
of tasklet.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
---

Hi!

The background on tasklet -> BH workqueue conversion can be found here[0].
system_bh_wq is used as suggested.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/all/20240130091300.2968534-1-tj@kernel.org/

---
 drivers/crypto/omap-aes.c  | 15 ++++++++-------
 drivers/crypto/omap-aes.h  |  2 +-
 drivers/crypto/omap-des.c  | 17 +++++++++--------
 drivers/crypto/omap-sham.c | 15 ++++++++-------
 4 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index 244e24e52..3cc802622 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -32,6 +32,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include "omap-crypto.h"
 #include "omap-aes.h"
@@ -221,7 +222,7 @@ static void omap_aes_dma_out_callback(void *data)
 	struct omap_aes_dev *dd = data;
 
 	/* dma_lch_out - completed */
-	tasklet_schedule(&dd->done_task);
+	queue_work(system_bh_wq, &dd->done_task);
 }
 
 static int omap_aes_dma_init(struct omap_aes_dev *dd)
@@ -494,9 +495,9 @@ static void omap_aes_copy_ivout(struct omap_aes_dev *dd, u8 *ivbuf)
 		((u32 *)ivbuf)[i] = omap_aes_read(dd, AES_REG_IV(dd, i));
 }
 
-static void omap_aes_done_task(unsigned long data)
+static void omap_aes_done_task(struct work_struct *t)
 {
-	struct omap_aes_dev *dd = (struct omap_aes_dev *)data;
+	struct omap_aes_dev *dd = from_work(dd, t, done_task);
 
 	pr_debug("enter done_task\n");
 
@@ -925,7 +926,7 @@ static irqreturn_t omap_aes_irq(int irq, void *dev_id)
 
 		if (!dd->total)
 			/* All bytes read! */
-			tasklet_schedule(&dd->done_task);
+			queue_work(system_bh_wq, &dd->done_task);
 		else
 			/* Enable DATA_IN interrupt for next block */
 			omap_aes_write(dd, AES_REG_IRQ_ENABLE(dd), 0x2);
@@ -1140,7 +1141,7 @@ static int omap_aes_probe(struct platform_device *pdev)
 		 (reg & dd->pdata->major_mask) >> dd->pdata->major_shift,
 		 (reg & dd->pdata->minor_mask) >> dd->pdata->minor_shift);
 
-	tasklet_init(&dd->done_task, omap_aes_done_task, (unsigned long)dd);
+	INIT_WORK(&dd->done_task, omap_aes_done_task);
 
 	err = omap_aes_dma_init(dd);
 	if (err == -EPROBE_DEFER) {
@@ -1229,7 +1230,7 @@ static int omap_aes_probe(struct platform_device *pdev)
 
 	omap_aes_dma_cleanup(dd);
 err_irq:
-	tasklet_kill(&dd->done_task);
+	cancel_work_sync(&dd->done_task);
 err_pm_disable:
 	pm_runtime_disable(dev);
 err_res:
@@ -1264,7 +1265,7 @@ static void omap_aes_remove(struct platform_device *pdev)
 
 	crypto_engine_exit(dd->engine);
 
-	tasklet_kill(&dd->done_task);
+	cancel_work_sync(&dd->done_task);
 	omap_aes_dma_cleanup(dd);
 	pm_runtime_disable(dd->dev);
 }
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 41d67780f..99c36a777 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -159,7 +159,7 @@ struct omap_aes_dev {
 	unsigned long		flags;
 	int			err;
 
-	struct tasklet_struct	done_task;
+	struct work_struct	done_task;
 	struct aead_queue	aead_queue;
 	spinlock_t		lock;
 
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index 9c5538ae1..149ebd777 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -32,6 +32,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include "omap-crypto.h"
 
@@ -130,7 +131,7 @@ struct omap_des_dev {
 	unsigned long		flags;
 	int			err;
 
-	struct tasklet_struct	done_task;
+	struct work_struct	done_task;
 
 	struct skcipher_request	*req;
 	struct crypto_engine		*engine;
@@ -325,7 +326,7 @@ static void omap_des_dma_out_callback(void *data)
 	struct omap_des_dev *dd = data;
 
 	/* dma_lch_out - completed */
-	tasklet_schedule(&dd->done_task);
+	queue_work(system_bh_wq, &dd->done_task);
 }
 
 static int omap_des_dma_init(struct omap_des_dev *dd)
@@ -580,9 +581,9 @@ static int omap_des_crypt_req(struct crypto_engine *engine,
 	       omap_des_crypt_dma_start(dd);
 }
 
-static void omap_des_done_task(unsigned long data)
+static void omap_des_done_task(struct work_struct *t)
 {
-	struct omap_des_dev *dd = (struct omap_des_dev *)data;
+	struct omap_des_dev *dd = from_work(dd, t, done_task);
 	int i;
 
 	pr_debug("enter done_task\n");
@@ -890,7 +891,7 @@ static irqreturn_t omap_des_irq(int irq, void *dev_id)
 
 		if (!dd->total)
 			/* All bytes read! */
-			tasklet_schedule(&dd->done_task);
+			queue_work(system_bh_wq, &dd->done_task);
 		else
 			/* Enable DATA_IN interrupt for next block */
 			omap_des_write(dd, DES_REG_IRQ_ENABLE(dd), 0x2);
@@ -986,7 +987,7 @@ static int omap_des_probe(struct platform_device *pdev)
 		 (reg & dd->pdata->major_mask) >> dd->pdata->major_shift,
 		 (reg & dd->pdata->minor_mask) >> dd->pdata->minor_shift);
 
-	tasklet_init(&dd->done_task, omap_des_done_task, (unsigned long)dd);
+	INIT_WORK(&dd->done_task, omap_des_done_task);
 
 	err = omap_des_dma_init(dd);
 	if (err == -EPROBE_DEFER) {
@@ -1053,7 +1054,7 @@ static int omap_des_probe(struct platform_device *pdev)
 
 	omap_des_dma_cleanup(dd);
 err_irq:
-	tasklet_kill(&dd->done_task);
+	cancel_work_sync(&dd->done_task);
 err_get:
 	pm_runtime_disable(dev);
 err_res:
@@ -1077,7 +1078,7 @@ static void omap_des_remove(struct platform_device *pdev)
 			crypto_engine_unregister_skcipher(
 					&dd->pdata->algs_info[i].algs_list[j]);
 
-	tasklet_kill(&dd->done_task);
+	cancel_work_sync(&dd->done_task);
 	omap_des_dma_cleanup(dd);
 	pm_runtime_disable(dd->dev);
 }
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 6328e8026..ff8aac029 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -37,6 +37,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #define MD5_DIGEST_SIZE			16
 
@@ -217,7 +218,7 @@ struct omap_sham_dev {
 	int			irq;
 	int			err;
 	struct dma_chan		*dma_lch;
-	struct tasklet_struct	done_task;
+	struct work_struct	done_task;
 	u8			polling_mode;
 	u8			xmit_buf[BUFLEN] OMAP_ALIGNED;
 
@@ -561,7 +562,7 @@ static void omap_sham_dma_callback(void *param)
 	struct omap_sham_dev *dd = param;
 
 	set_bit(FLAGS_DMA_READY, &dd->flags);
-	tasklet_schedule(&dd->done_task);
+	queue_work(system_bh_wq, &dd->done_task);
 }
 
 static int omap_sham_xmit_dma(struct omap_sham_dev *dd, size_t length,
@@ -1703,9 +1704,9 @@ static struct ahash_engine_alg algs_sha384_sha512[] = {
 },
 };
 
-static void omap_sham_done_task(unsigned long data)
+static void omap_sham_done_task(struct work_struct *t)
 {
-	struct omap_sham_dev *dd = (struct omap_sham_dev *)data;
+	struct omap_sham_dev *dd = from_work(dd, t, done_task);
 	int err = 0;
 
 	dev_dbg(dd->dev, "%s: flags=%lx\n", __func__, dd->flags);
@@ -1739,7 +1740,7 @@ static void omap_sham_done_task(unsigned long data)
 static irqreturn_t omap_sham_irq_common(struct omap_sham_dev *dd)
 {
 	set_bit(FLAGS_OUTPUT_READY, &dd->flags);
-	tasklet_schedule(&dd->done_task);
+	queue_work(system_bh_wq, &dd->done_task);
 
 	return IRQ_HANDLED;
 }
@@ -2059,7 +2060,7 @@ static int omap_sham_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dd);
 
 	INIT_LIST_HEAD(&dd->list);
-	tasklet_init(&dd->done_task, omap_sham_done_task, (unsigned long)dd);
+	INIT_WORK(&dd->done_task, omap_sham_done_task);
 	crypto_init_queue(&dd->queue, OMAP_SHAM_QUEUE_LENGTH);
 
 	err = (dev->of_node) ? omap_sham_get_res_of(dd, dev, &res) :
@@ -2194,7 +2195,7 @@ static void omap_sham_remove(struct platform_device *pdev)
 					&dd->pdata->algs_info[i].algs_list[j]);
 			dd->pdata->algs_info[i].registered--;
 		}
-	tasklet_kill(&dd->done_task);
+	cancel_work_sync(&dd->done_task);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.47.1


