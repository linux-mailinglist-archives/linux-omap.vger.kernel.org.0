Return-Path: <linux-omap+bounces-1819-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8336B943612
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 21:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0251C22000
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 19:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF7645BEC;
	Wed, 31 Jul 2024 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n83y68he"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C772946F;
	Wed, 31 Jul 2024 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453204; cv=none; b=CXTuGGvnqnF7l6pcXyerkc5EEBbnrXImcHYwja7np4fdqzkBnl15Bm9xggggsNSCc8mdrygTeOP/4t3Zgk0T2pSK9mGJbaraegg4Jkl/h2MV1RWkD+pwRsiGGXAdtDY1G+yfwrQ7zU9kMtolPInEkDsWti0WfaszLx9xvOm9RYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453204; c=relaxed/simple;
	bh=SuwfXUzktaGyulf0j906sSbnQ4dZQ+iudH+Aobvj3B0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qw++1G46v3Ve86ER9KN/w5nG3zY6FEsPenzXb4YaJvemyaQUq0oi5gPQWiZ8Z9OblqjhGqHDoQMiUk9sg6uq45fSZG3ZwCQNAPww+vdUYCfNJ2G5cvJXmy9pfcMRrUbGcy6/FXo0RCKACTtu2rd2Ejgf9udMi20x4PdHrQx2Xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n83y68he; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F13C116B1;
	Wed, 31 Jul 2024 19:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453202;
	bh=SuwfXUzktaGyulf0j906sSbnQ4dZQ+iudH+Aobvj3B0=;
	h=From:To:Cc:Subject:Date:From;
	b=n83y68heo1oWzILYHcvkhjV1IinXijxlSN0dFgdhXkdSytPmI9g/4UKuyLnnglq6J
	 GUN2YzIxkRwpxrsNDeEbXWuJZIneOrQCAykeUH3fjhZjrI6Ni6UR05taBhgENy4z/+
	 X6IbNgpPAbm7168LSvIOtkYvQB2g3lZ40C2DWUE/dmG+qLTxw1S7CYqI61+mtl7SnR
	 nCxS11OjUes5Y0p1hqZ4B8XBUVRNtYUylzviZnX+P3bqsHJDjp1UwS9PLobXbSMVqi
	 w6jyjPzphGkOB/MtF3rDEO//f4il3jLFkMGbLZDBH5UKt9U/xNMQM9LLw+3vgtbCwi
	 vUwFPqwV6KB+A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: ti-sysc: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:39 -0600
Message-ID: <20240731191312.1710417-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_get_property(). This is part of a larger effort to remove callers
of of_get_property() and similar functions. of_get_property() leaks
the DT property data pointer which is a problem for dynamically
allocated nodes which may be freed.

The code was also incorrectly assigning the return value to a 'struct
property' pointer. It didn't matter as "prop" was never dereferenced.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/bus/ti-sysc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 2b59ef61dda2..7caaf89f3bf2 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2569,14 +2569,12 @@ static const struct sysc_dts_quirk sysc_dts_quirks[] = {
 static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
 				  bool is_child)
 {
-	const struct property *prop;
-	int i, len;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sysc_dts_quirks); i++) {
 		const char *name = sysc_dts_quirks[i].name;
 
-		prop = of_get_property(np, name, &len);
-		if (!prop)
+		if (!of_property_present(np, name))
 			continue;
 
 		ddata->cfg.quirks |= sysc_dts_quirks[i].mask;
-- 
2.43.0


