Return-Path: <linux-omap+bounces-2697-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D252A9CDC85
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 11:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89BC11F218AD
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 10:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81701B2196;
	Fri, 15 Nov 2024 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="tF/2Isf0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12D847C
	for <linux-omap@vger.kernel.org>; Fri, 15 Nov 2024 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666346; cv=none; b=CZhxHEquhOVBN6g91dfEXp/jqpr2EufdeIdSfZU816RyHUzWEZqNx1HjrcgTnYM0IeZtILoGisbCYZpxqWMSkVx/T7cfXoyukzJlhLH8eZ0IBTbM4R0SKGHP9car8dTNQT/VJAQfRyBZaxd7+R0T8oZKW9uPMTHx1ASu1yPaluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666346; c=relaxed/simple;
	bh=uXIf0NJ2Ff6YhkZvGG0A1U1gPPLiq+QFtNR2pFwCxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3G+BBYBLwhGV9NA0YwZKUQ0slVIoSQUeYcV29tABsBOEJnUbWnD3PguFE1bN21jW6anjGb3LwLDzOo6/i7s6+2Nt1Ob6uMCBozxYNDSqJUJIeFQ6aJ1zHy1WasSL4udOWlLTrTqKZA0NqfwkwUKpzhVxXcNvq8AFFO8TeBRSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=tF/2Isf0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so14598185e9.1
        for <linux-omap@vger.kernel.org>; Fri, 15 Nov 2024 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731666342; x=1732271142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkTaxhy56Mwcqt7Mg2BriCem6Pn3ih9G1CSYmGmRFXc=;
        b=tF/2Isf0aovBs34+5kyJiMswpDILUXoxkAa+ee9lU/l5sfK+Ktik6uEPBba/H6Jz6D
         Ol2BFXdCpXEUBCH+5fmzA6MQTAhCuOBUSV5ZA4OBzYE5rOPJzp7f5lGF2Vttgx+Jfdm4
         o1ctcgSIWCZHc5wXWfz7myw1IRRRisWaCIrbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666342; x=1732271142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkTaxhy56Mwcqt7Mg2BriCem6Pn3ih9G1CSYmGmRFXc=;
        b=AWOVrgCXS6+MvNGEFZCSOnZRJ4rOXHJe7ZZhwCtv1z49V4e3r9H/j3zkVBUcEe3Qgl
         ID0tDwNkr//BXwLgwA/L/I3xDgXN27qzj0YiwXardRHYDbERt3XDMEQxfxtIeHB3UT1Y
         NZe5ftZ7yJmP1RYXrlHmbI1RXwA1P/gDbLQ6nuEJTc491mX1LNeCq4Aozta532ee70g6
         UktylKPZGdkPijokheKD59uh/LhvnYbXxRp2ZWYlhW63GM1PIFjyyd0qf8olh/mjaaHP
         wMTQ9e/8EXWccqCm+/OwZPlf4WGe2D/FOpfalKoeyA/y/yAOc9HBQAThytUQz0uqBE7V
         dLKA==
X-Gm-Message-State: AOJu0Yz1Ai/k6smRPrt1GssXvajA/61pwohbm/mhkvRK0FkQHGrRiqa+
	ShrWLXnSKVZoTawm7R9cz/J6UvzWXOnw6QuWmC9V5YqlsIPZe3AS40x1q2kNbeo=
X-Google-Smtp-Source: AGHT+IG0m4WAcGBu5LNbGsx6j4ydvgGP74YeW0Wx/GElg+fbuA667xmvAeUDZb8SobqQvtjR9CVM2A==
X-Received: by 2002:a05:600c:3143:b0:431:9397:9ace with SMTP id 5b1f17b1804b1-432df7411b0mr19095575e9.10.1731666342183;
        Fri, 15 Nov 2024 02:25:42 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788a2sm49170175e9.11.2024.11.15.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:25:41 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@kernel.org,
	Romain Naour <romain.naour@skf.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus
Date: Fri, 15 Nov 2024 11:25:37 +0100
Message-ID: <20241115102537.1330300-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

A bus_dma_limit was added for l3 bus by commit cfb5d65f2595
("ARM: dts: dra7: Add bus_dma_limit for L3 bus") to fix an issue
observed only with SATA on DRA7-EVM with 4GB RAM and CONFIG_ARM_LPAE
enabled.

Since kernel 5.13, the SATA issue can be reproduced again following
the SATA node move from L3 bus to L4_cfg in commit 8af15365a368
("ARM: dts: Configure interconnect target module for dra7 sata").

Fix it by adding an empty dma-ranges property to l4_cfg and
segment@100000 nodes (parent device tree node of SATA controller) to
inherit the 2GB dma ranges limit from l3 bus node.

Note: A similar fix was applied for PCIe controller by commit
90d4d3f4ea45 ("ARM: dts: dra7: Fix bus_dma_limit for PCIe").

Fixes: 8af15365a368 ("ARM: dts: Configure interconnect target module for dra7 sata").
Link: https://lore.kernel.org/linux-omap/c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr/
Cc: <stable@vger.kernel.org> # 5.13
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v2: add stable tag
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index 6e67d99832ac..ba7fdaae9c6e 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -12,6 +12,7 @@ &l4_cfg {						/* 0x4a000000 */
 	ranges = <0x00000000 0x4a000000 0x100000>,	/* segment 0 */
 		 <0x00100000 0x4a100000 0x100000>,	/* segment 1 */
 		 <0x00200000 0x4a200000 0x100000>;	/* segment 2 */
+	dma-ranges;
 
 	segment@0 {					/* 0x4a000000 */
 		compatible = "simple-pm-bus";
@@ -557,6 +558,7 @@ segment@100000 {					/* 0x4a100000 */
 			 <0x0007e000 0x0017e000 0x001000>,	/* ap 124 */
 			 <0x00059000 0x00159000 0x001000>,	/* ap 125 */
 			 <0x0005a000 0x0015a000 0x001000>;	/* ap 126 */
+		dma-ranges;
 
 		target-module@2000 {			/* 0x4a102000, ap 27 3c.0 */
 			compatible = "ti,sysc";
-- 
2.45.0


