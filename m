Return-Path: <linux-omap+bounces-5065-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEAC93F45
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC903A2F03
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FDC30F95B;
	Sat, 29 Nov 2025 14:22:26 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9E279903;
	Sat, 29 Nov 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426145; cv=none; b=S9n4BhS/ZOaLdk/T66SuwxTWDAnXOau0CAfQmsV+AbneObCBOsZUDl/3PjKP5RLg3kOXSf4la5frP62N4Y6JjYoP2mz/nxUnubgab4uUhQlfeFe2tjH1S9U2EM/IwbUzIC3MbQbT44VhpNbgTCUDFwGz1nVZrIJUzXPjWnXFV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426145; c=relaxed/simple;
	bh=ZmWIj0SY2XTxCkuORKuZCZlFZ7Hj+oAqxNAGtmCeXxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MG9EwbNkdbH9FBorSSw19Pn0nYo2AVdMS5+zpVcZsSmFucZiqiaYmLdI9NRCqhzHK1wS5WJsipG84u7dxDnqB4sQlixVv66jNjXE2Sw7zvfY3gvnjZiOw1WDqTxO3zCQOd/Wf7rcuUAKtwq3s6VylOroGbrh3dW0hHuzzHutA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 47CFA2CFC87;
	Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mm728AbNNSkV; Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0114B2CE37B;
	Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d_VXeArI3PXU; Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 4A5082C7D73;
	Sat, 29 Nov 2025 15:22:15 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	lee@kernel.org,
	dakr@kernel.org,
	rafael@kernel.org,
	gregkh@linuxfoundation.org,
	broonie@kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	khilman@baylibre.com,
	andreas@kemnade.info,
	aaro.koskinen@iki.fi,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/4] regmap: Allow disabling debugfs via regmap_config
Date: Sat, 29 Nov 2025 15:20:40 +0100
Message-ID: <20251129142042.344359-3-richard@nod.at>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129142042.344359-1-richard@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Regmap already disables register access via debugfs as soon as a register
map is used without taking locks.
Go a step further and allow disabling debugfs via regmap_config such that
device drivers can decide on their own whether uncontrolled register acce=
ss
via debugfs is harmful.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/base/regmap/regmap.c | 2 ++
 include/linux/regmap.h       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index ce9be3989a218..38d7a03aa7637 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -697,6 +697,8 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_map;
=20
+	map->debugfs_disable =3D config->debugfs_disable;
+
 	ret =3D -EINVAL; /* Later error paths rely on this */
=20
 	if (config->disable_locking) {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 55343795644b9..646501a055eba 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -395,6 +395,7 @@ typedef void (*regmap_unlock)(void *);
  *
  * @ranges: Array of configuration entries for virtual address ranges.
  * @num_ranges: Number of range configuration entries.
+ * @debugfs_disable: Disable debugfs access to this register.
  */
 struct regmap_config {
 	const char *name;
@@ -467,6 +468,8 @@ struct regmap_config {
=20
 	const struct regmap_range_cfg *ranges;
 	unsigned int num_ranges;
+
+	bool debugfs_disable;
 };
=20
 /**
--=20
2.51.0


