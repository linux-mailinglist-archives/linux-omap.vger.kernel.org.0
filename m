Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7982D77ED
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 15:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406264AbgLKOcl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 09:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406257AbgLKOcU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 09:32:20 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370A9C0611BB
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:50 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id l11so13629221lfg.0
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TC3nvcCsKElennu363xgzX81b8s+QPHA8xr9Tbhrl4w=;
        b=fInATpmn5aXIMdqqCMq1nnYMD46JaKgeio7qqkIWPAy5iyQuaCf5xpZAzST7LnZiTm
         pT70ncVHd2lqP67P4nbKHZ9a+8Iw2NPSoqecYwa0jtOBDVCG+mIRCn0Q6jO27a7E9Jem
         ahwGZg63orgPCV+6S6kwJOvwUqast68vh5XMgDJ2lWzJngEVaQ00QMHEZAiTifJToCsP
         xK98/H2A+EoE7gRboeajuRtpbjG80nnEqCp0WgPh88s/1f3JHi7gPkc9WG1gTYUtugLy
         IlUJihn1oN5NSWXah1ZJG90tgoB8u82HSIRq82qIFd/JIvwvjQvTjDA9uoxSlHc0qgOo
         iOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TC3nvcCsKElennu363xgzX81b8s+QPHA8xr9Tbhrl4w=;
        b=cpfw/zUY4b90KxcBSUH/wGlklpUUTJLVLdfpwLOpZm9HT6Uy5oDQUV9fdDICdJIcYR
         pkxp3j3apo+T7WE5C4VoGP/zsfPc0QOPqe2dwEkdU2kBEVzg9/V05opovHb4GiTF/2Ve
         lcutfrHJFjxUD4C7IR/KEtwPd0meK763pWBMXbswUeYs/DfqKABGjHz4DTVKlwmFaa2s
         7wdHguAs0ASghx9DnPOh1sBD2HROrSMY0k3ESphYXGoJYHW2qDQ8vw00SGQQecHAp1wg
         Fd7juGxtbUO6BEM8Qo4jPRiLoOO3TGmb3TV0N4D9SktaxEsCUTw2NryHZuq0Idh3W8hy
         AYHg==
X-Gm-Message-State: AOAM530BmYEhIa1ULLeirfLrc0/p92Nz28FQsyhgjdvan5swbbYLvU2j
        1WnxwZrhaS2PT8b3HESJbm/9gA==
X-Google-Smtp-Source: ABdhPJxMxrQ4KNASC27zblm4T7/0+PW+bq/u7+d/RQzYScHtQ48AArv3ONiHIP4xpRXDnTufQITTrA==
X-Received: by 2002:a19:5f5d:: with SMTP id a29mr4517141lfj.212.1607697048664;
        Fri, 11 Dec 2020 06:30:48 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:48 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 5/5] remoteproc: pru: Configure firmware based on client setup
Date:   Fri, 11 Dec 2020 15:29:33 +0100
Message-Id: <20201211142933.25784-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Client device node property firmware-name is now used to configure
firmware for the PRU instances. The default firmware is also
restored once releasing the PRU resource.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index ac13e4452a57..fed7a2051ebf 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -170,6 +170,23 @@ void pru_control_set_reg(struct pru_rproc *pru, unsigned int reg,
 	spin_unlock_irqrestore(&pru->rmw_lock, flags);
 }
 
+/**
+ * pru_rproc_set_firmware() - set firmware for a pru core
+ * @rproc: the rproc instance of the PRU
+ * @fw_name: the new firmware name, or NULL if default is desired
+ *
+ * Return: 0 on success, or errno in error case.
+ */
+static int pru_rproc_set_firmware(struct rproc *rproc, const char *fw_name)
+{
+	struct pru_rproc *pru = rproc->priv;
+
+	if (!fw_name)
+		fw_name = pru->fw_name;
+
+	return rproc_set_firmware(rproc, fw_name);
+}
+
 static struct rproc *__pru_rproc_get(struct device_node *np, int index)
 {
 	struct device_node *rproc_np = NULL;
@@ -230,6 +247,8 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	struct rproc *rproc;
 	struct pru_rproc *pru;
 	struct device *dev;
+	const char *fw_name;
+	int ret;
 
 	rproc = __pru_rproc_get(np, index);
 	if (IS_ERR(rproc))
@@ -254,7 +273,21 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	if (pru_id)
 		*pru_id = pru->id;
 
+	ret = of_property_read_string_index(np, "firmware-name", index,
+					    &fw_name);
+	if (!ret) {
+		ret = pru_rproc_set_firmware(rproc, fw_name);
+		if (ret) {
+			dev_err(dev, "failed to set firmware: %d\n", ret);
+			goto err;
+		}
+	}
+
 	return rproc;
+
+err:
+	pru_rproc_put(rproc);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(pru_rproc_get);
 
@@ -276,6 +309,8 @@ void pru_rproc_put(struct rproc *rproc)
 	if (!pru->client_np)
 		return;
 
+	pru_rproc_set_firmware(rproc, NULL);
+
 	mutex_lock(&pru->lock);
 	pru->client_np = NULL;
 	rproc->deny_sysfs_ops = false;
-- 
2.29.0

