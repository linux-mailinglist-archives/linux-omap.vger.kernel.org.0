Return-Path: <linux-omap+bounces-2343-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F2994ED2
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 15:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99F25B2998D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CE91DEFC8;
	Tue,  8 Oct 2024 13:17:54 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683FD1DE88F
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393473; cv=none; b=AgeFE1kEyv90ldZWaNIsEk7MJ9FrZnL5FSNTZ5hSLSUupJmN8OTT1ssBQJiEcLnD4KQvoStSLORIY73OOi9VNvnmRp8bInwp0OQirNjaEXfQUSAIa+RtCoi44NOxNwo4V9bZ8v7wH1vC62qTjL86YPa+H2Jk89AD+VlctyNaXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393473; c=relaxed/simple;
	bh=b3gscylhJq0HJq57Wu9T5f3FPDlL8fSY3iQUh87Ep0w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D1Jtisyax6KHowtZnB8t6Rt+POGIzOVlpeRRqfeoIIMrCHcwR+5LTLUf/ac0z9gNyUejJMZv8nKvlSY/n9U7tH7EWSfGZAT4cdtRx7fmi1HMZzH3+/Ry54y0pQOZB6M/BbRQZTXtp78rd8mFx4ThKv5yh4JheJat12do7EmTrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E17DDA7;
	Tue,  8 Oct 2024 06:18:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B840B3F640;
	Tue,  8 Oct 2024 06:17:47 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	jgg@nvidia.com,
	linux-omap@vger.kernel.org,
	Beleswar Padhi <b-padhi@ti.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] iommu/omap: Don't register ops by fwnode
Date: Tue,  8 Oct 2024 14:17:38 +0100
Message-Id: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OMAP driver still has its own traditional firmware parsing and
instance handling in omap_iommu_probe_device(), rather than using the
generic fwnode-based paths. However, it also passes a hwdev to
iommu_device_register(), thus registering a fwnode for each ops
instance, wherein __iommu_probe_device() then fails to find matching ops
for a client device with no fwspec and thus a NULL iommu_fwnode.

Since omap-iommu is not known to coexist with any other IOMMU hardware
and shares the same ops between all instances, we can reasonably remove
the hwdev/fwnode registration to put it back into "legacy" mode where
the ops are effectively global and ->probe_device remains responsible
for filtering individual clients.

Reported-by: Beleswar Padhi <b-padhi@ti.com>
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/omap-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c9528065a59a..425ae8e551dc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1230,7 +1230,7 @@ static int omap_iommu_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 
-		err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
+		err = iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);
 		if (err)
 			goto out_sysfs;
 		obj->has_iommu_driver = true;
-- 
2.39.2.101.g768bb238c484.dirty


