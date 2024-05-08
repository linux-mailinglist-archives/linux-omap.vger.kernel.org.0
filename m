Return-Path: <linux-omap+bounces-1357-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC48BFC58
	for <lists+linux-omap@lfdr.de>; Wed,  8 May 2024 13:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566452817AF
	for <lists+linux-omap@lfdr.de>; Wed,  8 May 2024 11:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E3183A09;
	Wed,  8 May 2024 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLY3Z30U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC3839FE;
	Wed,  8 May 2024 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168440; cv=none; b=C7exQuJQUENAqW/2CvBHxL/LH3vVfdvACBWnnm9eT1mmp+lsYqjLxu4ItW+tHgOiAgNPM9Ol07sapV3bj3FruPjilclbnBxXvJhZ7naghkCN+S3oJb2Pnq7mS95cHcM4OYRQvRlVRtw4icnTCYhGOKSgmwB0WjgWPqZR8Dn4IxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168440; c=relaxed/simple;
	bh=L553O5yxjkFAwL/t2j+02UPkkJnndDONYb+IspTlLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWAwhZPIQdm+2IJ8pvk+cGeM+boJyngwNA887KqTBvhEu9/mphuSf7z4TJPIX72j4P1JAk0YBAmI/oby83INdJG+QfpOpdbg5bB2iJf9f4GqDCFbG/gz3t2nWCc9c9WmuAKny1iMlm26beuffAx2jay78Ng7cb0rceb4wKcKJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLY3Z30U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715168439; x=1746704439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L553O5yxjkFAwL/t2j+02UPkkJnndDONYb+IspTlLIc=;
  b=CLY3Z30UzWKXjqMohvILI6xg4LORgf4BryW+xSShD0Qg1FK4v+DQR6E2
   oTu+4+NNsFgQAqoDCorccP6K3ozcMXX+IUK4n3AjNDQYx068vd0t62Rvr
   bFmjofV/hecMx31ZpczLSLokCYGSIYn0Ek1redwhq6oo01MY4Q7mdrU+/
   QuEjxIOtBnuJVa0wpgz5AjIZpXl+AZVPRAA8OTScyer6T11MG7RKGbPVo
   iqlzZQh0tPnIYAArysxaZWVXtrFMZ4rFYGoPqW4NadOhU6Ze68Pht2KPL
   c9ij95lXlEw8WOSug6q58jTtSNSESwNffh7U4Z9qv3CJFX1jRX07OPdVr
   g==;
X-CSE-ConnectionGUID: vIErpBS3QDinXvY2x+xe2w==
X-CSE-MsgGUID: 4eSTUCdIQWmtVm2O1r1ZfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10888806"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="10888806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:40:38 -0700
X-CSE-ConnectionGUID: 34J1j/zTST+kzKSWfK90Xw==
X-CSE-MsgGUID: p/T5EAlcQnemw3/ghHjRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33379940"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 04:40:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 53CD911F; Wed, 08 May 2024 14:40:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mfd: menelaus: Remove unused linux/gpio.h
Date: Wed,  8 May 2024 14:40:33 +0300
Message-ID: <20240508114033.952578-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/menelaus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index 662604ea97f2..787b9c2f3804 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -29,7 +29,6 @@
 #include <linux/bcd.h>
 #include <linux/slab.h>
 #include <linux/mfd/menelaus.h>
-#include <linux/gpio.h>
 
 #include <asm/mach/irq.h>
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


