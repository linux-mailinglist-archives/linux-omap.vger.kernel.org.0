Return-Path: <linux-omap+bounces-3292-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B96A34F67
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2025 21:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B89A1883585
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2025 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E479D266196;
	Thu, 13 Feb 2025 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="AZRkhHZW"
X-Original-To: linux-omap@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C6155326;
	Thu, 13 Feb 2025 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739478744; cv=none; b=MIxIujwEmJbKzMIbOPebx5HbgWFCO7qcJ81IlKYwMBDerFszGRchSWgL7YFfMpm/hoQ7aldsB0/33vchV0fL/Ih2PxsaVz1d5iKJkM1wT7l5SlgVVJMLy+iVgmVlZ3iZm6C8EPb5/QEFwMdc0P2SfE8X59Yzx3WG+ZquZRJF7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739478744; c=relaxed/simple;
	bh=/qEAAJ/oMQbHRoG38MwxKeCRNFS2+IcaZRCOrXemX/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pase8fQl1yX4VUt3tK0mfU9bhd61OOgjZRJUshv3IfNDEJgW9TOA4KkRh+naGPaaRr2HoIdLw0KJANBUqTAt3mgnHYa00HbqphInJhjGwFKUuKqmuTXQ7gDZySyNm25Hpi3U8HzXY5oIyvQT3y8LBZhCDu247Xha+jXunz3jhDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=AZRkhHZW; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 884171665E8;
	Thu, 13 Feb 2025 21:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1739478733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9n+ldp6vJFtE3bn+qUHlRC86kujwpOlJfC3RUBRG9Do=;
	b=AZRkhHZWHWbPzUg/NVAexMvbKWbsNQh2HpRDkmGzXmv+M1V22UGczKvB5UyMZL9iJf/kmM
	gbdZa0HoyZfZDTA0ERsOhXiODoPD/h9l0aeklWzHp+PsVTovYyMSLQWwiHvxUOyNtS6r2M
	Wh6IcZQ7HtGMPZFQ5XwnbsrsrZN/1MM=
From: David Heidelberg <david@ixit.cz>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells property
Date: Thu, 13 Feb 2025 21:32:03 +0100
Message-ID: <20250213203208.93316-1-david@ixit.cz>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This property is irrelevant for the ad5820 DAC,
the driver nor the hardware indicate use of channel cells.

Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera support")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git ./arch/arm/boot/dts/ti/omap/omap3-n900.dts ./arch/arm/boot/dts/ti/omap/omap3-n900.dts
index 4bde3342bb959..c50ca572d1b9b 100644
--- ./arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ ./arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -816,8 +816,6 @@ ad5820: dac@c {
 		reg = <0x0c>;
 
 		VANA-supply = <&vaux4>;
-
-		#io-channel-cells = <0>;
 	};
 };
 
-- 
2.47.2


