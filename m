Return-Path: <linux-omap+bounces-2918-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB489FDF97
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 16:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E286C3A17F4
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 15:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34AC172BD5;
	Sun, 29 Dec 2024 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qRt7JLU1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8B6249EB;
	Sun, 29 Dec 2024 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735485149; cv=none; b=Orqlsv4+/WyAGF6S/8CE3c4yLF0h2TAWzok7fZg2uSQ/laJVLHuWXU0Wu6yOOkfe37Mdd95Lsf4ZUKRVw2zVNWVxKDGB8ENUzJXBART8oHbsZ9uTWxIUnwa9brLaO+85qDehCoYRXfinmqMUW7Qo3qmq1ZMryNuzehUc3FIvweE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735485149; c=relaxed/simple;
	bh=jMUvCmzIWihQZsPHOscr7iGLS0raJCPkYk9ha8ouP1U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dgKl8gB5LHokHsc8uIIXVuAssxMOMBKuABze2Xw0KurUND9pkjCc3vsVgkqz+Ui1T24CEnMsaCPhaqsMuy9fmNGYsEvY/fz+W4dsE69y1RMTzzbKg5f1fGDXLG5XeJ3eHQan07Enf2WqW57oszsZ4feks0ZjnPUESJCRDlW1xEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qRt7JLU1; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=x0YNPUa/QyNmpUUdhtbFeSWJj7vTaV8GXi1D2/pwFZI=; b=qRt7JLU1UCBRXf834lEY5Pnete
	j6Ya2+RJ7NDyAazQc9evv3OWG92bwDoLMX2Y5h61qj9eZdCAtQHBlLNspbkq0j6E74+bo39tVG/Uz
	+mnvaw4lAOQv5ytvj0ebp1/NJq2RBxUSPMdjNe+3Ral+2rF8PYXvAwO3tRzLLc+eCE7WiUNKEY4NA
	X0jDIxHRAei4xeq9V08tVuUcTQ4n+iInf9FcMi9TQbYS3iBExfwNRoKb1Vp7pmdCIyFTbK48lXXMZ
	lv73Exv3KjcMn5odbQon5Fkzp+CVG2lDwanDsXLpBAlpxHCI0ZftLPgTIDWUfm46aOghlvVNAhCI1
	GtL9BshA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
Date: Sun, 29 Dec 2024 15:44:59 +0100
Message-Id: <20241229144459.9742-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the newly-added charger of TWL603X in the defconfig since it is
used by the Epson Moverio BT200.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..6de45d7f6078 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -428,6 +428,7 @@ CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_BQ27XXX=m
 CONFIG_CHARGER_ISP1704=m
 CONFIG_CHARGER_TWL4030=m
+CONFIG_CHARGER_TWL6030=m
 CONFIG_CHARGER_BQ2415X=m
 CONFIG_CHARGER_BQ24190=m
 CONFIG_CHARGER_BQ24735=m
-- 
2.39.5


