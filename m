Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4245F10D7
	for <lists+linux-omap@lfdr.de>; Fri, 30 Sep 2022 19:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbiI3R3S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Sep 2022 13:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiI3R3A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Sep 2022 13:29:00 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607661C2FB8
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:39 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n10so7844187wrw.12
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Vm4TpO3JY+1vWDls351l9UZb/Y7basVTL7Grm/yg+jM=;
        b=AG1ywY7gc8eweWCRMYD9l1xeuVWvjrZWx7+dHX3zI3CH7biq0V/89BLSi7C3ohPn42
         SMqTVcktNRBVpC6qkQVA+/cGJD1x/Ptk7VD4q4RyWdqGT7idOX+3TWdXzakQs2hu1rPo
         lcLrGbleSxVQp4Q8cAnbEC2/AbbAYmAkesLMbn10rEg+JD/OqWQUaGkiEnMsoZ0dl/mJ
         0W+O18C4E5oLv52iokVkjg6r+9ocy0SOTZ8xZvs8tCXn5PsMZFojlzChs9o7vdvd104/
         KNensBBdH9lMjBgO2Lv7sInwJlZ8Rb9EppzWUtx/CnVaG0j0Z6kdMkxYOsZsBsSkXH8x
         4Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Vm4TpO3JY+1vWDls351l9UZb/Y7basVTL7Grm/yg+jM=;
        b=ispxDh6qa+xL38a/QpTO0Nzc0bu6D443EZx+8cMdCT795Og3w+49gGhqY3eO5ETHAZ
         jE/QSyTUoqv4NkDq5bGRfLeLUvNGCu7wcwyO1xgHrg/DccKc3G+9kInkj3hlH0iRAE0M
         rUq2AkTLSCfw6N2XXGAzG5jnsh+zM6qLL6uOCeMJhku5fXGI/MUGmw/wIkrtDYaHOJRT
         FE/x4VH7udRIBPPUTPn89BQOj8//PsxX7jyNmFCXyw8ibdEsMiiU7NRI5UYHduslHyLD
         Na82gMzNdwZR4dQrQpMPFWisWhsRPZ1L7uJxIdIZVi29pxLEeD8Z/zUIKCw85Qup3OAy
         +sKw==
X-Gm-Message-State: ACrzQf14zYiDvuyRdbIwxows12sR6eL3BDyaUPLqAcWJVXtoTn7j7LMF
        ITgWJJMDBQxWm4OtFiueMgBMbzrHwXUZ9Trw
X-Google-Smtp-Source: AMsMyM446LRNJW8x7k8pG0/1PnITT3jj7wcPLz8OsFiS1LUmRhSfNehfesLHnoNyFBZ0Yo+ifaGZjw==
X-Received: by 2002:adf:b34a:0:b0:22c:bd74:1f06 with SMTP id k10-20020adfb34a000000b0022cbd741f06mr6794434wrd.77.1664558917678;
        Fri, 30 Sep 2022 10:28:37 -0700 (PDT)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:1a56:87a1:b5b8:453b])
        by smtp.gmail.com with ESMTPSA id bv14-20020a0560001f0e00b0022ae8b862a7sm2525407wrb.35.2022.09.30.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:28:37 -0700 (PDT)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
        glaroque@baylibre.com, granquet@baylibre.com,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: [PATCH 1/2] soc: ti: Convert allocations to devm
Date:   Fri, 30 Sep 2022 19:28:09 +0200
Message-Id: <20220930172810.199758-2-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930172810.199758-1-nfrayer@baylibre.com>
References: <20220930172810.199758-1-nfrayer@baylibre.com>
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

Changed the memory and resource allocations in the probe function
to devm. Also added a remove callback.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
---
 drivers/soc/ti/k3-socinfo.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 91f441ee6175..a29f5a23395f 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -96,21 +96,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
 		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
 
-	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0", variant);
-	if (!soc_dev_attr->revision) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "SR%x.0", variant);
+	if (!soc_dev_attr->revision)
+		return -ENOMEM;
 
 	ret = k3_chipinfo_partno_to_names(partno_id, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC JTAGID[0x%08X]\n", jtag_id);
-		ret = -ENODEV;
-		goto err_free_rev;
+		return -ENODEV;
 	}
 
 	node = of_find_node_by_path("/");
@@ -118,22 +115,26 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_node_put(node);
 
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev)) {
-		ret = PTR_ERR(soc_dev);
-		goto err_free_rev;
-	}
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	platform_set_drvdata(pdev, soc_dev);
 
 	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
 		 soc_dev_attr->family,
 		 soc_dev_attr->revision, jtag_id);
 
 	return 0;
+}
+
+static int k3_chipinfo_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
 
-err_free_rev:
-	kfree(soc_dev_attr->revision);
-err:
-	kfree(soc_dev_attr);
-	return ret;
+	if (soc_dev != NULL)
+		soc_device_unregister(soc_dev);
+
+	return 0;
 }
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
@@ -147,6 +148,7 @@ static struct platform_driver k3_chipinfo_driver = {
 		.of_match_table = k3_chipinfo_of_match,
 	},
 	.probe = k3_chipinfo_probe,
+	.remove = k3_chipinfo_remove,
 };
 
 static int __init k3_chipinfo_init(void)
-- 
2.25.1

