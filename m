Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2362DC4C0
	for <lists+linux-omap@lfdr.de>; Wed, 16 Dec 2020 17:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgLPQy4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Dec 2020 11:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgLPQy4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Dec 2020 11:54:56 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783E4C0619D6
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 08:53:02 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id s26so15381975lfc.8
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QN2ZDNaFP2aT/ClXBsxAgxKdaK3vIBmK5H4WTk/CkiE=;
        b=F7PRpDU16rzweD3c39edlX+7YkESCotZA/8lVuw7u0iyFp6lxPyNoIfl0Gmn0GfPRu
         OCGSXbVPuEVr40Ead0jo3k1yeY70xXijLUCaTjfVxqHvWPzP3fy4QAOjarCRXxazAJe8
         cBhtLSxLpWkBBdgh1jN4e/08b0qSU+soXhcAIuMBp4olkK69NiLajmjSn24lGN9bQOw9
         srP1jHf1P3c1pu0FMOabufaANlqPNlridBo3+jdRcJ2s1XvU+OyO+3h0y87Dy//Igqhv
         ZtRI+fAbOWMuf2iRmbKTalhDEDfkjZwfKtLksMmH330rgoqwGh6ySl5KYrSbBLFiRBDZ
         8E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QN2ZDNaFP2aT/ClXBsxAgxKdaK3vIBmK5H4WTk/CkiE=;
        b=omW0TH5hihDGkdi8cmlngFS8QfcwGr/QJft57MXRtl0sUKYF/6TZTI8ENSnLdJpt0Q
         aLBH36QKHbHQ3DkaXdfzPfebJpOA0e+zrbena/bIhzawbqe96T4TX6h8R/nIpx0wbY6B
         IOkbJ/rTqMq/yKMbEn9xxroUuJDJiuYwiYXxDHbJEVwt/WorECAd5XinJYrS6QO6aVdy
         jvj5KgWvxxL0uSHBJ/js8ji/W74uLu296DHzvJfwzi2EByQY5eKVsBm0eK+82Vs0WAxG
         lFhrgPcQv7es1NoWqsegy79nlkum5gu5SZMnePeLXARRTBVmtvS2O78IidNKVAMvwyRF
         iPyw==
X-Gm-Message-State: AOAM530cmhvQy7mCAKRC5qzw//RC24Q/1BVJwPQpBjsQTi7AbOlt9lVP
        0bahfNCcwvrC7iickNZltjhLpg==
X-Google-Smtp-Source: ABdhPJxXwjufBrBS5p5gGK+QRTNfqS9gpkIv6Yx7cXPGiFdZEIUdxaMtfzMcrRCrrXmj0W3+90mb4A==
X-Received: by 2002:a2e:9f14:: with SMTP id u20mr5744528ljk.244.1608137579582;
        Wed, 16 Dec 2020 08:52:59 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id t3sm281645lfe.263.2020.12.16.08.52.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 08:52:58 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com, t-kristo@ti.com
Subject: [PATCH v2 5/5] remoteproc: pru: Configure firmware based on client setup
Date:   Wed, 16 Dec 2020 17:52:39 +0100
Message-Id: <20201216165239.2744-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
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
index a37c3f5838ea..4a9c7973bf3a 100644
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

