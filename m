Return-Path: <linux-omap+bounces-2594-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76D9BE770
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 13:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9641C209B8
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 12:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C171DF721;
	Wed,  6 Nov 2024 12:14:18 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B06B1D416E
	for <linux-omap@vger.kernel.org>; Wed,  6 Nov 2024 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730895257; cv=none; b=ZfmUPE3PThUNJr8pmCAP06w2avfWnITENISR6X2fgwZDPYwirrzvSHZS1UJn1ZD5LQxum5uBWtaxu/tYPhGQUK4rH+CM5ISgHd6qm4VBjicllUcDek2jQJEuEJfcXOQcosbbT+mKFVvECv/k17HPjWPxKzaZ1LXnZP39BpuQHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730895257; c=relaxed/simple;
	bh=c09iP+ikZGOSYyf7OQz0pdsLPY9b+zTsaI422+nqqIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B12MW2hNHhjs4MCV3yXhZsSHHWXK+M1zHfDOgQBHOP63gwvfIAviUKeHrYKCT6pxGcn0RQTnyR/OINDRjS7ZB89cHlVmORYCrorvvv+JETyci7Mq/wjsR7B+R6fOzxrBXrvaw58WcD9mF5SGnioFwYebaNvGA7nahOhL4JunQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:aed7:437f:20a9:d72d])
	by michel.telenet-ops.be with cmsmtp
	id ZQE62D00U3NwldE06QE6c2; Wed, 06 Nov 2024 13:14:06 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8euw-006MPU-Go;
	Wed, 06 Nov 2024 13:14:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8evG-0067Mg-53;
	Wed, 06 Nov 2024 13:14:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pcmcia: omap_cf: : Mark driver struct with __refdata to prevent section mismatch
Date: Wed,  6 Nov 2024 13:13:57 +0100
Message-Id: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via platform_driver_probe().  Make this explicit
to prevent the following section mismatch warning

    WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in reference: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.text)

that triggers on an omap1_defconfig + CONFIG_OMAP_CF=m build.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pcmcia/omap_cf.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index 80137c7afe0d9bcf..938fad9c12aa8a4e 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -302,7 +302,13 @@ static void __exit omap_cf_remove(struct platform_device *pdev)
 	kfree(cf);
 }
 
-static struct platform_driver omap_cf_driver = {
+/*
+ * omap_cf_remove() lives in .exit.text. For drivers registered via
+ * platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver omap_cf_driver __refdata = {
 	.driver = {
 		.name	= driver_name,
 	},
-- 
2.34.1


