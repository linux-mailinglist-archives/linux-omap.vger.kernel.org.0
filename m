Return-Path: <linux-omap+bounces-5067-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C369C93F5A
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32900347947
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BFD30FF10;
	Sat, 29 Nov 2025 14:22:26 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B021630DD2C;
	Sat, 29 Nov 2025 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426146; cv=none; b=Xf6UFBR6Z2KNu5hwvaxNI3QorsgUBnZTDMMK/TsUqbX8+aO36xNrImewgI2OFyWWIMD3Zfyn+TLOgeMV2+kyQC1a+2AN8EMvwpGB14G34tqtlSnv9ahO1qwkBZQ2vWxJ3pZXj7HwChzKC/976B4rynxfiFhJP0a3j/Rlww3fwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426146; c=relaxed/simple;
	bh=8Hd8DGGF2eb8aAfAM4zOeeq5H9mvCRostVwLaaXmmlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdTqf3jseTjpvWCvWFuEx5liJxHcqosAmSCoJnaNDiwERdut4O43z8swtuBaR4sPAZ2OjA2cmOvzH7iWnVqDMrVuOhxsv/wEDjArwTEgB3yqID+7RCLer9uttQt/84M7jf6CE7vJk8kcxXgG1lgVJfLVY/O9g8m2T/0JwX0HWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DD0992CFC9B;
	Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id pXYk4AegWIrK; Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 968482CFC8B;
	Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r5y58J4CSTVe; Sat, 29 Nov 2025 15:22:16 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id E68CE2CE378;
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
Subject: [PATCH 3/4] syscon: Wire up has-inaccessible-regs
Date: Sat, 29 Nov 2025 15:20:41 +0100
Message-ID: <20251129142042.344359-4-richard@nod.at>
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

Evaluate the has-inaccessible-regs device tree property to disable
debugfs access if a register map contains dangerous/harmful registers.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mfd/syscon.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index ae71a2710bed8..73fff0df3f42f 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -70,6 +70,16 @@ static struct syscon *of_syscon_register(struct device=
_node *np, bool check_res)
 	else if (of_property_read_bool(np, "native-endian"))
 		syscon_config.val_format_endian =3D REGMAP_ENDIAN_NATIVE;
=20
+
+	/*
+	 * Disable debugfs access if a register map has various inaccessible
+	 * registers.
+	 * In such a case the device driver has to know exactly how and when
+	 * access is allowed but general access via userspace can cause harm.
+	 */
+	if (of_property_read_bool(np, "has-inaccessible-regs"))
+		syscon_config.debugfs_disable =3D true;
+
 	/*
 	 * search for reg-io-width property in DT. If it is not provided,
 	 * default to 4 bytes. regmap_init_mmio will return an error if values
--=20
2.51.0


