Return-Path: <linux-omap+bounces-2497-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F36889B386E
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 18:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A39D3B21C60
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B191DF98D;
	Mon, 28 Oct 2024 17:59:02 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE2C1DF981;
	Mon, 28 Oct 2024 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138342; cv=none; b=a8YovxkUok7qudMD++83ptmMuXGET8zBblrqqgWITEzfM96oSTwEPljiQPFz6bIf0JaQpH3CWyL+PnBWb4SUirhz3sacJZs6/46Jhcfx+bACzfczaF7TEZecsvM75TKPUJFwOiRyKwVNa+LrUIH5erd1HH5F4XyPkyLU5lnRSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138342; c=relaxed/simple;
	bh=1XinlaQYX4VTbf9PpKRFsKPKa188mq29XnCSiutCsuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzpFpaHRH7p70I52hGG0r78jKsGVpgq04imAIjO/5o1fJb9hjO7W4TKt8CVF38mCU+P1VzHEjE7JqsA6xziGB9IcPj37+6Sv8U3nSyPa8JlZVe4PNQiU0LctnZFhtbhTHPm16njHf1+x3GPQOdRrAKs2kI5c8D2KaXMC89uHZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 937BC1713;
	Mon, 28 Oct 2024 10:59:29 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D24B23F66E;
	Mon, 28 Oct 2024 10:58:57 -0700 (PDT)
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
Subject: [PATCH 4/4] iommu: Make bus_iommu_probe() static
Date: Mon, 28 Oct 2024 17:58:38 +0000
Message-Id: <a7511a034a27259aff4e14d80a861d3c40fbff1e.1730136799.git.robin.murphy@arm.com>
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

With the last external caller of bus_iommu_probe() now gone, make it
internal as it really should be.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c | 3 ++-
 include/linux/iommu.h | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c5..35291b02aab1 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -90,6 +90,7 @@ static const char * const iommu_group_resv_type_string[] = {
 #define IOMMU_CMD_LINE_DMA_API		BIT(0)
 #define IOMMU_CMD_LINE_STRICT		BIT(1)
 
+static int bus_iommu_probe(const struct bus_type *bus);
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
@@ -1795,7 +1796,7 @@ static void iommu_group_do_probe_finalize(struct device *dev)
 		ops->probe_finalize(dev);
 }
 
-int bus_iommu_probe(const struct bus_type *bus)
+static int bus_iommu_probe(const struct bus_type *bus)
 {
 	struct iommu_group *group, *next;
 	LIST_HEAD(group_list);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index bd722f473635..84a6ed5e803a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -784,7 +784,6 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 	};
 }
 
-extern int bus_iommu_probe(const struct bus_type *bus);
 extern bool iommu_present(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
-- 
2.39.2.101.g768bb238c484.dirty


