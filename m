Return-Path: <linux-omap+bounces-3739-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF3AC5A5C
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 21:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E14AB1BA81AE
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845E428032F;
	Tue, 27 May 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hhWXpHyR"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2D1F7586;
	Tue, 27 May 2025 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372715; cv=none; b=lh/3tMrRkRGMu5BV9uUBH3HTktq19qxthpuMQoQqxtUU0IIeHNtMqa3bl9oZsdxxkdU4y1cFvoNJp6em2T93yPksVOC5kLfLbnAJ3+TCwEPaBPZ905oaThoy9WVG3bxZx1pOXdH/C3vNFruPtjgdUvacMj+5ND2E8TNCJf8J/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372715; c=relaxed/simple;
	bh=DErBwuGDA0aAYvIh8kx8TKOu8IPySNxIzGeGTG3YRzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKLkqSvIb2QojVAipCUe+SexUeSIfaI8Q+O62IF6FRAPAiYcrZcwkdgyYrFE6XxWNg+wU3feSmKYVMd+cidnemzFCaqJ4W/vwjkbfKzRlZo9Z0Q5PAPmsNDaLC14tvg/oeMKeAxKZ4d1rBMmqHjJ7lsJ9z2UbMQ+ItqyyfBJ0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hhWXpHyR; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RJ4tL61848158;
	Tue, 27 May 2025 14:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748372695;
	bh=QMdcykWUhhJabXPslQaqBIiFZkw7Vp/iY23BnvihBl4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hhWXpHyRd4vJRCJNRt7XuDYUA3kXrzoA/8GWXh+fG3c551ytKs/0r9jKNWazWo96V
	 cahMobmTqeJNzMVY0vksM1UUD0VeI2Zwd5Ofy6ceii3YYQum9PqvVw6c1LqEkjuNxM
	 UCDy2Map/Wel9lHwdcMKWdFSIaAIMqFbKbbQVIPg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RJ4tl43064132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 14:04:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 14:04:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 14:04:55 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RJ4tcQ3540893;
	Tue, 27 May 2025 14:04:55 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: [PATCH 1/2] mfd: tps65219: Update TPS65214 MFD cell's GPIO compatible string
Date: Tue, 27 May 2025 14:04:54 -0500
Message-ID: <20250527190455.169772-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527190455.169772-1-s-ramamoorthy@ti.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch reflects the change made to move TPS65215 from 1 GPO and 1 GPIO
to 2 GPOs and 1 GPIO. TPS65215 and TPS65219 both have 2 GPOs and 1 GPIO.
TPS65214 has 1 GPO and 1 GPIO. TPS65215 will reuse the TPS65219 GPIO
compatible string.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index fd390600fbf0..297511025dd4 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -190,7 +190,7 @@ static const struct resource tps65219_regulator_resources[] = {
 
 static const struct mfd_cell tps65214_cells[] = {
 	MFD_CELL_RES("tps65214-regulator", tps65214_regulator_resources),
-	MFD_CELL_NAME("tps65215-gpio"),
+	MFD_CELL_NAME("tps65214-gpio"),
 };
 
 static const struct mfd_cell tps65215_cells[] = {
-- 
2.43.0


