Return-Path: <linux-omap+bounces-5302-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C827CEAF03
	for <lists+linux-omap@lfdr.de>; Wed, 31 Dec 2025 00:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68FE03020179
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 23:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098BB32B989;
	Tue, 30 Dec 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="qtrps6kP";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="qtrps6kP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266522E62CE;
	Tue, 30 Dec 2025 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767138050; cv=none; b=BuoVvMBx0Dk2l2Fu51i/HdGE+AXssgL+CDYU8VccDtZTdG2iQxE/8E8JhFHWjxwnoJP1y/BR4pAKR8KQytbTmun1kshLOSvtyG9tNM/UOLY/xk+/jR2yPnKZASNlG7mBSEE0yD6XYez/HDurTvXdQemSAk4Ov2de29ZuN06UohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767138050; c=relaxed/simple;
	bh=tkuYZyGRqDR/2JFGVRRuSC5DZkOI66zp0uTErH+kfQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHps53EzIBcrpkLC9+AoBHTtUNd1DE3oDTiRJqmcj8cUtm/GsivqsmQ/GLN8PZE6nfrnWcO2stb2qYHqvY5eWXzFWpT595m2jhyS4rbAzg+yT3+Tb1BBjfarQwWPcb7TLWm5B5fiEMslCBy1y160DHfsiSAP7cz2C2IP18a3M/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=qtrps6kP; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=qtrps6kP; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767138045; bh=tkuYZyGRqDR/2JFGVRRuSC5DZkOI66zp0uTErH+kfQk=;
	h=From:To:Cc:Subject:Date:From;
	b=qtrps6kPI/70ifxGPeBLFHCs4kE7zz/9BHpDYtNCez6cMn849/sUwXAnE4KpUcEow
	 H19ZMA7uNYL4wMcqSzQpDmpurWDTlnv7JuiNVdAfyzPJ/ThJUXtq1ZSsK59oCVtZJP
	 DbYAfgsnxUgHbNNXjyf8ueESNNT1uOJhKEaqGgLpKN1BmC/g510ghk4DgupVbcRXLi
	 C0pmg/nG+d+9OMvdUDinin8jYQfj4s3wO3bYdoSXTQnSZZpCd7rCXSmdzKMlZX1FN2
	 Yvp2gNcAxvbMXqf96URte5NB5rzrOCCJdpHMdyTf4SkJl2/uB9GS8Lm3gqfaNolZqG
	 gbh1lXlo5iALw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 75C123E956D;
	Tue, 30 Dec 2025 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767138045; bh=tkuYZyGRqDR/2JFGVRRuSC5DZkOI66zp0uTErH+kfQk=;
	h=From:To:Cc:Subject:Date:From;
	b=qtrps6kPI/70ifxGPeBLFHCs4kE7zz/9BHpDYtNCez6cMn849/sUwXAnE4KpUcEow
	 H19ZMA7uNYL4wMcqSzQpDmpurWDTlnv7JuiNVdAfyzPJ/ThJUXtq1ZSsK59oCVtZJP
	 DbYAfgsnxUgHbNNXjyf8ueESNNT1uOJhKEaqGgLpKN1BmC/g510ghk4DgupVbcRXLi
	 C0pmg/nG+d+9OMvdUDinin8jYQfj4s3wO3bYdoSXTQnSZZpCd7rCXSmdzKMlZX1FN2
	 Yvp2gNcAxvbMXqf96URte5NB5rzrOCCJdpHMdyTf4SkJl2/uB9GS8Lm3gqfaNolZqG
	 gbh1lXlo5iALw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id BE6803E9491;
	Tue, 30 Dec 2025 23:40:44 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap: dra7: Remove bogus #syscon-cells property
Date: Wed, 31 Dec 2025 01:40:40 +0200
Message-ID: <20251230234040.2083889-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251230_234045_498170_A9ED521F 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message. 

There is no such dt binding property as '#syscon-cells', remove it.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index c9282f57ffa5..db6c53bbaf51 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -109,7 +109,6 @@ dra7_pmx_core: pinmux@1400 {
 				scm_conf1: scm_conf@1c04 {
 					compatible = "syscon";
 					reg = <0x1c04 0x0020>;
-					#syscon-cells = <2>;
 				};
 
 				scm_conf_pcie: scm_conf@1c24 {
-- 
2.43.0


