Return-Path: <linux-omap+bounces-2493-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC99B3861
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 18:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44F9B1F22617
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 17:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48DE1DF72E;
	Mon, 28 Oct 2024 17:58:55 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960F11D6DB6;
	Mon, 28 Oct 2024 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138335; cv=none; b=nAN/ZWEzYEMe8LcSgHK+djGKZBQSRcULopR7a6EXy+DiS5aHjg0idsZlPffppmiGcOpRnQKEnuV6N3Pp4B8fE/+7Ft17Q2+eE3Fo03EtILA+G5rdds0BNZu/PJZOfeq8Pzg91EBCE5O3DX0xCJhQ39k0z7cjP6sYs2q43XY9GWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138335; c=relaxed/simple;
	bh=qQUJIc218FY4jP+zYDYMEfn40JNC6dBOJaSbdOuKCgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fgcFtGqHzXz5TjL+Dzn2q937b5ZZ1gdCNt9LJSLYm3Iyrrv+yImMexw/KCUouqHbXHj5NS3xgXP3kXU/hrx58PZ8lHKnC3eYBMkatsZ8OMCVIfZe0CDKgEg1DZS9nnQj9kCJf0WKf/qoaG744IWKZ7ftx5U9tahTPyRuo1yIl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1D29497;
	Mon, 28 Oct 2024 10:59:16 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A5BB3F66E;
	Mon, 28 Oct 2024 10:58:44 -0700 (PDT)
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
Subject: [PATCH 0/4] Fix omap-iommu bitrot
Date: Mon, 28 Oct 2024 17:58:34 +0000
Message-Id: <cover.1730136799.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
through the more recent evolution of the IOMMU API internals. These
patches attempt to bring it and its consumers sufficiently up-to-date
to work again, in a manner that's hopefully backportable. This is
largely all written by inspection, but I have managed to lightly boot
test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
working again.

This supersedes my previous patch[1]. Patches #1 and #2 are functionally
independent, and can be applied directly to their respective trees if
preferred.

Thanks,
Robin.

[1] https://lore.kernel.org/linux-iommu/c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com/


Robin Murphy (4):
  remoteproc/omap: Handle ARM dma_iommu_mapping
  media: omap3isp: Handle ARM dma_iommu_mapping
  iommu/omap: Add minimal fwnode support
  iommu: Make bus_iommu_probe() static

 drivers/iommu/iommu.c                    |  3 ++-
 drivers/iommu/omap-iommu.c               | 26 +++++++++++++++---------
 drivers/media/platform/ti/omap3isp/isp.c |  7 +++++++
 drivers/remoteproc/omap_remoteproc.c     | 17 ++++++++++++++++
 include/linux/iommu.h                    |  1 -
 5 files changed, 42 insertions(+), 12 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


