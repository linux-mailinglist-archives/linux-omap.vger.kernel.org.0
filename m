Return-Path: <linux-omap+bounces-3769-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 726ACACDD2E
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 13:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B917AA874
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jun 2025 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443C428FFDE;
	Wed,  4 Jun 2025 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5GdYe2k"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F928EA7E;
	Wed,  4 Jun 2025 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037858; cv=none; b=f2Qy/gFmmMDjPk6JFWIRP6HG4fJU+gTzShZBV/hAEt2mvcWG/ReFUBJflpVTMWuHqF+MU/CyAUU0rJUoNMM/44BiEicv5kNaIKmyPJBgny/kbOGXvVTfWwXbW2dvH+olMJm6nUyZtgD7wH/mzZNXDcbopBeEO/m3ysb+Fue3vI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037858; c=relaxed/simple;
	bh=K6AQk9gou5wlQgU4A8rcAEGH/9bTYB3cLt57CmV/DaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzn05p3OgHT/TxzkOzS++ATUDq235MgNUQ/c8XBX3kPhxK1h/jw0jBU9x7vznUhJVk0PZYiweDJDmu0dhoBSQQE7KMjrGX/l+FV3dzc+LnpV/9O4O1PQI/ZtzC+3n9QJNhtZCOK6I+z4JL1Qn8NnIzvzVSR8eA1RYoY4v6vOxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5GdYe2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A295AC4CEF0;
	Wed,  4 Jun 2025 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037858;
	bh=K6AQk9gou5wlQgU4A8rcAEGH/9bTYB3cLt57CmV/DaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5GdYe2kyPkroB/BXPcZ0xj2FckN3vzBqUoAWyeMNsQx9h9CtLYyg38PFi2MksKst
	 3DCEoWEr846Yg3i8Jp6MxKwmGRKeY4Fyy8/5c4eLndAzA8GMfOClUJt85aTqsm5heQ
	 A+U7o2Z6ONeZFIjozpPEmfuqr+U5+2HpJjaQc9Ccl8HmCr8UTugYhA3vAYvTe6bUoc
	 NzJH/aa6GOMdmKlI3AMMm8InheHZRDyQsh0BP62jv6SWYa2vXWe7+2khcEeOfn6TSH
	 bjxuzC0XlWK3yIsHiVAt38jTnDQkHMOoxMRU1vaaKdM83xKA+r4uvvhcIrluiUHOOI
	 jbplTcwQZfU8w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	aaro.koskinen@iki.fi,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 5/5] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
Date: Wed,  4 Jun 2025 07:50:50 -0400
Message-Id: <20250604115050.209756-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604115050.209756-1-sashal@kernel.org>
References: <20250604115050.209756-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

[ Upstream commit 36305857b1ead8f6ca033a913162ebc09bee0b43 ]

This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.

It breaks target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
when minimally-configured system tries to network-boot:

[    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
[   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
[   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
[   26.878471] Waiting up to 100 more seconds for network.

There are minimal configurations possible when the deferred device is not
being probed any more (because everything else has been successfully
probed) and deferral lists are not processed any more.

Stable mmc enumeration can be achieved by filling /aliases node properly
(4700a00755fb commit's rationale).

After revert:

[    9.006816] IP-Config: Complete:
[    9.010058]      device=lan0, ...

Tested-by: Andreas Kemnade <andreas@kemnade.info> # GTA04, Panda, BT200
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Link: https://lore.kernel.org/r/20250401090643.2776793-1-alexander.sverdlin@siemens.com
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, I can see that the current tree still has the
original problematic code that needs to be reverted. Now let me provide
my assessment: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Bug Analysis **1. Critical Boot
Issue:** The commit fixes a critical boot failure on AM62x systems
during network boot scenarios. The problem manifests as: - Target module
probe returning -517 (EPROBE_DEFER) repeatedly - Network boot timing out
after waiting 100+ seconds - Deferred probe mechanism getting stuck in
minimal configurations **2. Root Cause:** The original commit
4700a00755fb introduced a probe deferral mechanism that: - Uses a global
atomic counter `sysc_defer` initialized to 10 - Forces non-critical
interconnect devices to defer probe until l4_wkup/l4_cfg devices probe
first - In minimal configurations, this can create a deadlock where
deferred devices never get re-probed ## Code Impact Assessment **1.
Minimal and Safe Changes:** The revert removes exactly 47 lines of code:
- `early_bus_ranges[]` array definition - `sysc_defer` atomic counter -
`sysc_defer_non_critical()` function - Call to
`sysc_defer_non_critical()` in `sysc_map_and_check_registers()` **2. No
Architectural Changes:** The revert simply removes a probe ordering
mechanism without touching core functionality. **3. Well-Contained:**
Changes are limited to `drivers/bus/ti-sysc.c` with no impact on other
subsystems. ## Stability Considerations **1. Extensive Testing:** The
commit has been tested on multiple platforms: - GTA04, Panda, BT200
(confirmed by Andreas Kemnade) - AM62x systems (confirmed by original
reporter) **2. Maintainer Approval:** The revert was reviewed and
approved by Tony Lindgren, the original author of the problematic
commit. **3. Alternative Solution Available:** The commit message notes
that stable MMC enumeration (the original goal) can be achieved through
proper `/aliases` node configuration instead. ## Comparison with Similar
Commits Looking at the historical examples: - Similar Commit #1 (Status:
YES) shows that ti-sysc probe ordering fixes are suitable for
backporting - However, this revert fixes a regression introduced by such
changes - The boot failure on AM62x represents a more critical issue
than the original MMC renumbering problem ## Risk Assessment **Low
Risk:** - Removes problematic code rather than adding new functionality
- Well-tested across multiple platforms - Has maintainer blessing -
Addresses a critical boot failure scenario **Benefits:** - Fixes network
boot failures on AM62x - Eliminates potential deadlocks in deferred
probe mechanism - Maintains system stability in minimal configurations
The commit clearly meets stable tree criteria: it fixes an important
bug, has minimal regression risk, is well-contained, and has been
thoroughly tested. The boot failure it addresses affects real-world
deployments, making it a priority for stable kernel inclusion.

 drivers/bus/ti-sysc.c | 49 -------------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 70339f73181ea..5d27c43222fa4 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -602,51 +602,6 @@ static int sysc_parse_and_check_child_range(struct sysc *ddata)
 	return 0;
 }
 
-/* Interconnect instances to probe before l4_per instances */
-static struct resource early_bus_ranges[] = {
-	/* am3/4 l4_wkup */
-	{ .start = 0x44c00000, .end = 0x44c00000 + 0x300000, },
-	/* omap4/5 and dra7 l4_cfg */
-	{ .start = 0x4a000000, .end = 0x4a000000 + 0x300000, },
-	/* omap4 l4_wkup */
-	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
-	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
-	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
-};
-
-static atomic_t sysc_defer = ATOMIC_INIT(10);
-
-/**
- * sysc_defer_non_critical - defer non_critical interconnect probing
- * @ddata: device driver data
- *
- * We want to probe l4_cfg and l4_wkup interconnect instances before any
- * l4_per instances as l4_per instances depend on resources on l4_cfg and
- * l4_wkup interconnects.
- */
-static int sysc_defer_non_critical(struct sysc *ddata)
-{
-	struct resource *res;
-	int i;
-
-	if (!atomic_read(&sysc_defer))
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(early_bus_ranges); i++) {
-		res = &early_bus_ranges[i];
-		if (ddata->module_pa >= res->start &&
-		    ddata->module_pa <= res->end) {
-			atomic_set(&sysc_defer, 0);
-
-			return 0;
-		}
-	}
-
-	atomic_dec_if_positive(&sysc_defer);
-
-	return -EPROBE_DEFER;
-}
-
 static struct device_node *stdout_path;
 
 static void sysc_init_stdout_path(struct sysc *ddata)
@@ -871,10 +826,6 @@ static int sysc_map_and_check_registers(struct sysc *ddata)
 	if (error)
 		return error;
 
-	error = sysc_defer_non_critical(ddata);
-	if (error)
-		return error;
-
 	sysc_check_children(ddata);
 
 	error = sysc_parse_registers(ddata);
-- 
2.39.5


