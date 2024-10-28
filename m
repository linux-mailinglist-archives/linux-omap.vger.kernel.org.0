Return-Path: <linux-omap+bounces-2496-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF799B386A
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 18:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BBB2830BF
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 17:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC431DF982;
	Mon, 28 Oct 2024 17:59:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250071DF74C;
	Mon, 28 Oct 2024 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138340; cv=none; b=Gt1S1bBEj2Ecx59Sbj7IRbC4fLeVB7B+XlTKLiWVFwuavlsd3awk+TKEK7wlVk2SNJAKBk/zMvSC52DGA9jZFnJxwFv3so2iqUL4pZ8fxmDz1SdOyfQgRxSPFs9Mu0haqCP2UrAhj1UCJdEiXoCSWP+eDYlWipUOq3OvGMEqPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138340; c=relaxed/simple;
	bh=rt//uHCkf6lFY54nkpmLvuouPGvdIxO+V4YFqOtr5CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dobd1iuOox+CNZNSalLr5JEBiUnqL5L2xxjFkZvRfJsM3b5fWf+gxARLIBNwSiBUmyFRgLbZWDR6mKgPJ63GdRQNv0zCLF66Zq6tcAfZdnMKm8cwkvkJ0egLE6XWsAwcsZr5Txi+fzx7lCI377CSfvhwRxhhMOnC+zfXPVFyeP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA6316F8;
	Mon, 28 Oct 2024 10:59:27 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D2133F66E;
	Mon, 28 Oct 2024 10:58:55 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: hns@goldelico.com,
	b-padhi@ti.com,
	andreas@kemnade.info,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/4] iommu/omap: Add minimal fwnode support
Date: Mon, 28 Oct 2024 17:58:37 +0000
Message-Id: <cfd766f96bc799e32b97f4664707adbcf99097b0.1730136799.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OMAP driver uses the generic "iommus" DT binding but is the final
holdout not implementing a corresponding .of_xlate method. Unfortunately
this now results in __iommu_probe_device() failing to find ops due to
client devices missing the expected IOMMU fwnode association. The legacy
DT parsing in omap_iommu_probe_device() could probably all be delegated
to generic code now, but for the sake of an immediate fix, just add a
minimal .of_xlate implementation to allow client fwspecs to be created
appropriately, and so the ops lookup to work again.

This means we also need to register the additional instances on DRA7 so
that of_iommu_xlate() doesn't defer indefinitely waiting for their ops
either, but we'll continue to hide them from sysfs just in case. This
also renders the bus_iommu_probe() call entirely redundant.

Reported-by: Beleswar Padhi <b-padhi@ti.com>
Link: https://lore.kernel.org/linux-iommu/0dbde87b-593f-4b14-8929-b78e189549ad@ti.com/
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Link: https://lore.kernel.org/linux-media/A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com/
Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/omap-iommu.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c9528065a59a..3f72aef8bd5b 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1230,25 +1230,24 @@ static int omap_iommu_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 
-		err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
-		if (err)
-			goto out_sysfs;
 		obj->has_iommu_driver = true;
 	}
 
+	err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
+	if (err)
+		goto out_sysfs;
+
 	pm_runtime_enable(obj->dev);
 
 	omap_iommu_debugfs_add(obj);
 
 	dev_info(&pdev->dev, "%s registered\n", obj->name);
 
-	/* Re-probe bus to probe device attached to this IOMMU */
-	bus_iommu_probe(&platform_bus_type);
-
 	return 0;
 
 out_sysfs:
-	iommu_device_sysfs_remove(&obj->iommu);
+	if (obj->has_iommu_driver)
+		iommu_device_sysfs_remove(&obj->iommu);
 	return err;
 }
 
@@ -1256,10 +1255,10 @@ static void omap_iommu_remove(struct platform_device *pdev)
 {
 	struct omap_iommu *obj = platform_get_drvdata(pdev);
 
-	if (obj->has_iommu_driver) {
+	if (obj->has_iommu_driver)
 		iommu_device_sysfs_remove(&obj->iommu);
-		iommu_device_unregister(&obj->iommu);
-	}
+
+	iommu_device_unregister(&obj->iommu);
 
 	omap_iommu_debugfs_remove(obj);
 
@@ -1723,12 +1722,19 @@ static void omap_iommu_release_device(struct device *dev)
 
 }
 
+static int omap_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	/* TODO: collect args->np to save re-parsing in probe above */
+	return 0;
+}
+
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= generic_single_device_group,
+	.of_xlate	= omap_iommu_of_xlate,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.39.2.101.g768bb238c484.dirty


