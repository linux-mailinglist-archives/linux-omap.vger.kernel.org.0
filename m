Return-Path: <linux-omap+bounces-1492-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F658FF2E8
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 18:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F14128DA24
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 16:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCD5197A88;
	Thu,  6 Jun 2024 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPzhtYHB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C417374F1;
	Thu,  6 Jun 2024 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692672; cv=none; b=ibuMwF2brT5kY/wNEFsOrVo5cY+fcWLu0O4uIbVx8RgYInIoRO/y76myJeDbEpwglL5XJBDm8uW0zrzYb92m02bVZNSGZeXQ9aaYWChCFgK2Vsu9PQ+vVLxBuqSFTRYbaue6lgwsQhFL7GMClRIG5oK0nvZYLxuQSe/kmdnPF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692672; c=relaxed/simple;
	bh=mU0GEeJExfu4WFvL5Dq9VO5VIFqHpZfWtvi7arJG77M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssGN/RsvQHFcvffpThBsItqWDRgiiteqvgC8C1nVbPObEGZYMDwRfWqNeH+PcpaWuATQ27KRDYq4JMsXDS7cHUSLxZJWI0yQtWDb5x4mtLg1NSt4vY2R6PZsUEupfd/r37Zyq8UlQBunAvYfsgUuG45gAkAdMzQ88XG/45ui/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPzhtYHB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717692671; x=1749228671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mU0GEeJExfu4WFvL5Dq9VO5VIFqHpZfWtvi7arJG77M=;
  b=kPzhtYHB6SGZZ9v5bj9SofHKaXe2A5KjsAYScigKH0ZG+hNsWheK3Mrg
   NBpahdRNXSY1KNtxvZpMrCB5HMdKBel77ESxwXxSfrN/Oc48EKE3nzBJW
   pPw/OG3yy3rhhaxZ3w2hpmd6wl/WjWuPR0vpzgF0V1m2Je+EvkG1t3PuH
   Ly7Oj579OSVC97bqAVVTddhmhB6dzjAEy9dMoSKfDoopQ65P79Lbq7m9r
   LS5WDOoCA84LS3fkb+LuAt8EY6fSd7h3bsM21WKWtqyFqpit6Z0MfKjTT
   suZ6Fu3py4zjuvQKB6QiCmZw0BiGfx8RNI6A6WdqYWR3+VkatmWgSzX/q
   A==;
X-CSE-ConnectionGUID: 2L8TS+oRTwyXW0DKZ/BqZw==
X-CSE-MsgGUID: uaMyBY3cQUyr8V9nvhchGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25009372"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25009372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:51:10 -0700
X-CSE-ConnectionGUID: ZB5/aMQGR4GBY5auLydIdA==
X-CSE-MsgGUID: u5OO8FzUT7yoPx5KkQPwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38591945"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 06 Jun 2024 09:51:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EC8E52A4; Thu, 06 Jun 2024 19:51:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 1/1] ARM: omap2: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:51:04 +0300
Message-ID: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-omap2/omap_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index fca7869c8075..800980057373 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -315,7 +315,7 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
 
 	od->hwmods_cnt = oh_cnt;
 
-	hwmods = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
+	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
 	if (!hwmods)
 		goto oda_exit2;
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


