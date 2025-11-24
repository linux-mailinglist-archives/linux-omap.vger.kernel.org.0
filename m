Return-Path: <linux-omap+bounces-5029-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A12C7FFB8
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FC4D4E45D2
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 10:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE972550D5;
	Mon, 24 Nov 2025 10:48:18 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373103BB5A;
	Mon, 24 Nov 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981298; cv=none; b=BY/QhTbEyjNETZVhyCtgeoHsMv6x7442cQWA9b4fN3Il7CIZz94iuTRUbSkxXOIIlhq+xtoq1wEaghNE8cZffpt+AkGPYd1CC+wfzVC7FfJJGPZc4wJxlLn/++5I22C99SFVGXl6QKJND+DGUe6uGP6YT8tVONc43TSVMDCpBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981298; c=relaxed/simple;
	bh=dGk0+jMn4JTZB8duViqRYmM0wMvJqsPQj5OZTsHW0hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHHcL5Jc5GtYTa45nFdTyhJGvBleaCzcKzmMclIdmz1+9Ouc93UKhW81cYIijHcJtpRoo2VZ/SviTfYnYFjoA+ms578McJOis3pN76uBxbN7cMxjN+ki771PMmXN1P9jBaT9mRVL//52RcUWk3fqP8raOKJzPr2AxXNNrym2dLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowACXKsrpNyRptRXcAQ--.19738S2;
	Mon, 24 Nov 2025 18:48:11 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: andersson@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] hwspinlock: omap: Handle devm_pm_runtime_enable() errors
Date: Mon, 24 Nov 2025 18:48:05 +0800
Message-ID: <20251124104805.135-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXKsrpNyRptRXcAQ--.19738S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF45CF4rAw1UGr1kAw4ruFg_yoW8Jr1rpr
	WkXF9akryxK348Zw4DtFnaqFy5Can7K34UAryUWa4UZFyrZr18tas5JFyYva1vyr98JF9r
	Ww1xJw4xCFy5CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoQA2kj-2bYuwAAsu

Although unlikely, devm_pm_runtime_enable() can fail due to memory
allocations. Without proper error handling, the subsequent
pm_runtime_resume_and_get() call may operate on incorrectly
initialized runtime PM state.

Add error handling to check the return value of
devm_pm_runtime_enable() and return on failure.

Fixes: 25f7d74d4514 ("hwspinlock: omap: Use devm_pm_runtime_enable() helper")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/hwspinlock/omap_hwspinlock.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 27b47b8623c0..2d8de835bc24 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -88,7 +88,9 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	 * make sure the module is enabled and clocked before reading
 	 * the module SYSSTATUS register
 	 */
-	devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
 		return ret;
-- 
2.50.1.windows.1


