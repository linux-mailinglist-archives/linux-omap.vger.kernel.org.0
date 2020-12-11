Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B647A2D7EDD
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 19:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgLKSw0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 13:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391175AbgLKStS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 13:49:18 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8086CC0611D0
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:38 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so14696985lfd.9
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=23e4OtAdhS6/eJqfaLbIjryiFMaMMoJbdSAg/gW4lu0=;
        b=q79X2koiMjIHXybLkIW4FWzjM/9/iZFbs+VMBdG6rVDGEHSeJh7EPaE+HbHzPrq7oU
         CigCr/VHSjXJfVgBpTI05X1oJY0g2BT7jjhHlm8w95330FvCWsMNYmSxXdDpJVmFmPCr
         e44f0E+2RX6RkzuqcEu7hYqwHNCk0Fgt/1stP62U0Bf9vCOmyivfbb5QoggKNVfBRwDq
         tyVkLBum85kpO75FYOeuReJgHBG/cTqxY6ZQ7d6g4B6GFz9YYlnKzo2ZmTKZ2oKf6Jth
         JorAl48lb+ppozzchngCQK6trkAGU1w+3jFsWLCbO/BO503e01IXfdV/PMFSpRF/8/RR
         MBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=23e4OtAdhS6/eJqfaLbIjryiFMaMMoJbdSAg/gW4lu0=;
        b=rR6cameEQlmWegm12WhXswqaoLb8Dmfcw/7KsKZRWYNiaSjvpV6gNvQl8bgkQ5iqXn
         7fj0+Tq5ztJZqEyz0gWqvOki/tDsEdDXPrz2VXrDooZt7m1/HmDb/IXselYUX4z0zqsM
         oNNd1mrySNX7S+ich4BBfht+fSDpXbJzac93PeZVw5d1IarzXAfEiRlnXJauPB7Ply/E
         y6fgUZLa8+VGRNndds8eNObMgaDyYuuD/QEdfRpzlppUsJhJ8xQsqdm0lrcpBOePwDeT
         TAjw2F3/kjKHMRQjWEgVc5wrp+Qh2uQcJU206w02sMlzSn/+W55TWasYG7plDkZdMNRo
         bAjQ==
X-Gm-Message-State: AOAM5326gA6DKSLh/679P8TFxwNxHVktru28OHaa1iFAQcCFkAEKtjLt
        YFQDhu/EykuEoKZ38E0bnw5XTA==
X-Google-Smtp-Source: ABdhPJwBXyi9c57tCqFnSmFEnnzvpT/Tkl6e6mKo5DWEtSjfh992tfxLK1CtEZXWJGwrSMr9Q9C2vA==
X-Received: by 2002:ac2:5451:: with SMTP id d17mr2678709lfn.222.1607712517070;
        Fri, 11 Dec 2020 10:48:37 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:36 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 6/6] soc: ti: pruss: Add helper functions to get/set PRUSS_CFG_GPMUX
Date:   Fri, 11 Dec 2020 19:48:11 +0100
Message-Id: <20201211184811.6490-7-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
References: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add two new helper functions pruss_cfg_get_gpmux() & pruss_cfg_set_gpmux()
to get and set the GP MUX mode for programming the PRUSS internal wrapper
mux functionality as needed by usecases.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 include/linux/pruss_driver.h | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index e2d5477225c6..3312281ef4c1 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -35,4 +35,48 @@ struct pruss {
 	struct clk *iep_clk_mux;
 };
 
+/**
+ * pruss_cfg_get_gpmux() - get the current GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: pointer to store the current mux value into
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static inline int pruss_cfg_get_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 *mux)
+{
+	int ret = 0;
+	u32 val;
+
+	if (pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
+		return -EINVAL;
+
+	ret = pruss_cfg_read(pruss, PRUSS_CFG_GPCFG(pru_id), &val);
+	if (!ret)
+		*mux = (u8)((val & PRUSS_GPCFG_PRU_MUX_SEL_MASK) >>
+			    PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+	return ret;
+}
+
+/**
+ * pruss_cfg_set_gpmux() - set the GPMUX value for a PRU device
+ * @pruss: pruss instance
+ * @pru_id: PRU identifier (0-1)
+ * @mux: new mux value for PRU
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
+				      enum pruss_pru_id pru_id, u8 mux)
+{
+	if (mux >= PRUSS_GP_MUX_SEL_MAX ||
+	    pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
+		return -EINVAL;
+
+	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
+				PRUSS_GPCFG_PRU_MUX_SEL_MASK,
+				(u32)mux << PRUSS_GPCFG_PRU_MUX_SEL_SHIFT);
+}
+
 #endif	/* _PRUSS_DRIVER_H_ */
-- 
2.29.0

