Return-Path: <linux-omap+bounces-4679-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6EBD900F
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 13:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6899C352405
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 11:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B4930F81B;
	Tue, 14 Oct 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfRUCQeJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F130CDA0
	for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441184; cv=none; b=bd+QvlSZNY/vX4F1wqpbo0mo09wwaMH/cjnBMfvKAxXiCK8AEXaTZlMaZqq8hXOscO2Eur/e98+YVIujyiDl1igmChfs/PmeDtqpuAVQpySgYXGgSh/ajX8e0dtMmZQi+jFaGaHj9lKTS9aLJD1jDhKCuubx46Z55YUNq4eYAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441184; c=relaxed/simple;
	bh=WBNPAOl1IiO5eOs4BLPmth1N0JvusJem9fVKugbEi0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQcGjFLUtXRBptQXvzOxxwNAjhAmmHtNb8mwkdsngAub16AGP6AhJWx9e6E5IgGitc/v57db7hekWRwj2Aa9kXNIyv9ta8DI90jf2t2Ya5n5ul/S4NvjZRppp6/1fzMXRmMpkn2vb62iQeP3vYSNZJmRkae6NyqNa2vaVD5Rklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfRUCQeJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e430494ccso29978355e9.1
        for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441181; x=1761045981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbYmHynLeWlw8u23NecrRWs1rFP/nnkTB1+gQnuvcng=;
        b=WfRUCQeJz/EQhr0GFi0+c8JpNb5W1PvgyGqLwmPyxI6XKo/Fh21ZWEgYBTEgy8eazz
         XkTsIoivhJzCbrm2BKaCLOUzY6v40vViafiTFxHf/LnJTkmOBy1eQlIIc/uj3Tke27Ev
         R8eSuYCNbGVaVq4b+t4GuRm/20UFZxUl1/UQ9JEsTl0WwMSEh3AuOEujAokfemtHbbCP
         r6Zx+VprRTQU+lSlLzLVaT8JaEiHg6wZBilGITHZViclqJcKGWcfyYrra0SmqZXokS15
         BZ5XmAd2MrSXb0hn/L6q+uSafm3FuHl7V+AhqSisMhU2NFaWMcRthYo/Zbxj+Proj4OD
         JYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441181; x=1761045981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbYmHynLeWlw8u23NecrRWs1rFP/nnkTB1+gQnuvcng=;
        b=JcCzeOM5jSgn/Cuphr154eO3ml2UMEWnXeXz46MFZSSlrnmd1+3uLLkEG07pKoyXvq
         7O3CLWfdTreTjmZfacJfLvrPv/OVqVHjXSz4yngQVYZ08RBmFr5HrtTWXyVkigpq1hSD
         d+z+yr8LO+b5XluhBzQwu91zxqiEgtq7tCUSdFJRtNpx6hOQBeVLLTGoimY4K1pbBVzf
         Q9jjspTOEzcBJprWYOnpqG/US4GoRE93zJ+qLqsIvBV72+P2JPpPGuqt58Oskp9wHmhr
         DjQehWEW4ee9jfoK83nyRNMUZ0JLEQnpW8EubKzt8v+a5+4/xaPmeLaAatny9RtPAMqd
         /+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX9SKM12nwXXh+b6bX6wxfBxR+QH64+B6Ta8MZ6Rdl0gPtv/RSOq1Qye0jL14zXJufa31jfdsuNCa0H@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCP63cs7o2J4a1E5v4E12Sj10YbDInpMaDfZa2/I0K+jlT3mo
	FN9UQHccKbTfNVKIDmYiGsh8dTHehIFBQeUdhzppKhGsyKURznpBF1dF
X-Gm-Gg: ASbGncvuhfoS2Ow3oWD7cfvhUaLb8z12kWUkPheEeJ0QtkahJZsQcEHhmRgiBpwBKRi
	nh/lyM7n0RfzEiQssUztfWMcQ4wxq+d1d7Z0yStiiXDVZC9QLpOp04pW9xgmKG0mk+hu+shgfpm
	MavP62OLb7cBP8so9pgJzftHwbyHrxehAlxaVluvoXYq3S6shuHQMHoLaMa7UAvLEPM6hp3uXag
	mXO/3yCSB0uZVKULhUjgaKpgTZhO8die6SC/Cb394628fc3oqaRNZd9OPwAYen5sEjeZSxPWeEU
	vQEnmlI6I0Zeg7FIEZmqB1Z3n0xe7Wc1ikpyZZb3XK+MoK1oVL1uyJkGxpsgE/GKPVoD2up09HQ
	2EG7RBoXPR04xTXyi6JQ/On5EBCMSoSRR/8cvupyvqo5ucNyIq2aGgu8/tw==
X-Google-Smtp-Source: AGHT+IFO2uKjeUaYUKbnwXbbO+Xo/HgCqYDDA6YUTOMYT5kkkih/xh4BWfPVSZJs7SLyBcg2m31Icw==
X-Received: by 2002:a05:600c:4745:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-46fa9af30e5mr188941035e9.19.1760441180577;
        Tue, 14 Oct 2025 04:26:20 -0700 (PDT)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265829845e9.0.2025.10.14.04.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:26:20 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator supplies
Date: Tue, 14 Oct 2025 12:25:49 +0100
Message-ID: <20251014112553.398845-3-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014112553.398845-1-ivitro@gmail.com>
References: <20251014112553.398845-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Some boards require external regulators to power PCIe endpoints.
Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
vpcie12v-supply.

Use devm_regulator_get_enable_optional() to obtain and enable each
supply, so it will be automatically disabled when the driver is
removed.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..f29ce2aef04e 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include "../../pci.h"
 #include "pcie-cadence.h"
@@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
 
+static const char * const j721e_pcie_supplies[] = {
+	"vpcie12v", "vpcie3v3", "vpcie1v5"
+};
+
 static int j721e_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -480,6 +485,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct gpio_desc *gpiod;
 	void __iomem *base;
 	struct clk *clk;
+	unsigned int i;
 	u32 num_lanes;
 	u32 mode;
 	int ret;
@@ -565,6 +571,13 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	for (i = 0; i < ARRAY_SIZE(j721e_pcie_supplies); i++) {
+		ret = devm_regulator_get_enable_optional(dev, j721e_pcie_supplies[i]);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret, "can't enable regulator %s\n",
+					     j721e_pcie_supplies[i]);
+	}
+
 	dev_set_drvdata(dev, pcie);
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-- 
2.51.0


