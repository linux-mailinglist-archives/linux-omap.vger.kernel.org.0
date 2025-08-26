Return-Path: <linux-omap+bounces-4333-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC9B368AB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 16:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3E51C20E25
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 14:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC41C356904;
	Tue, 26 Aug 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="noT8PEIh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RSjV5kNk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E3353371;
	Tue, 26 Aug 2025 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217371; cv=none; b=Tp7ZS3woK9pRJ56xjsQMs3uFN+jIu1FSjKu1bvd3pwn7ZLoxUXrC9IMhrmE7h0e/TJM8XbGhetbdOdr3bEAgTXOtKJ4GsIcGI6o/6QjZx++3OR6PkF+KJbxs8p4wBKfGRoYfQeTGEEYdiLZCiL1QSaDBhJ/p6cqxmFN9/RBr4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217371; c=relaxed/simple;
	bh=VxxAn9TFOpcsguCx9K7fewvhM/0wUPUfrJxjMbCBnWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbmur0Ph53lUrNN+3F8Bdr+N/Y/7R2fu6pNzG3eFdYlj8jEnuWB7+vH3vvJDZZ9a61HAtUTy5aNMjq5xBaoQrNtQDjcaBITrqq4Tmy69ZSTbF4B8+2wfR6r6+8IvFBnBL1OfXYYAzi83V8W59KrqFLA5714+4X3l23PrN1864V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=noT8PEIh; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RSjV5kNk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217369; x=1787753369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=po8HbtbKHvoyjA3ItsX05bpzUQlEqnSkxM1AR2Md81M=;
  b=noT8PEIhIndQqQg1WLCyy1jcLRfPJzAXMz4M7GZminA1ZGvcIfdBapOa
   il5AcNuSKHKAj/nrcMRww2OjHE9Vd9hPfjjo1binIgxY4Vc+VyTyTlKX8
   DOSmcEomf0wQkBubL7ZspOfMevk+UZgeH/zhliK0e/VwXNiPr49SwTyh4
   dqniX8EexEf5JSWXFWTQ7ayy6cIKX8j++9hWYoUXRWcRnaXFVrW20OgmV
   oXUh3+/XPcu/LsE4NDYHPuCvBDDqecPuoF4VlVmsb/Pyi6b+zRI2a/MEi
   w0MhgXHmxJcY0DNrEejSc4UCKgvYXUdRvUt/TdWUWcXHDIcBi509jkmYR
   A==;
X-CSE-ConnectionGUID: za5xUEEpTE23uTWkr9aRxA==
X-CSE-MsgGUID: j5YKAzRzRnSIJotBIwI1ng==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917289"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:09:26 +0200
X-CheckPoint: {68ADC016-14-410E8DD8-CEA8F0F8}
X-MAIL-CPID: 23CE4175395DCA7124E04A9CED887CD9_3
X-Control-Analysis: str=0001.0A00211A.68ADC042.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1273D167D3C;
	Tue, 26 Aug 2025 16:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217362; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=po8HbtbKHvoyjA3ItsX05bpzUQlEqnSkxM1AR2Md81M=;
	b=RSjV5kNkAMiu1Sv9U+xzryHRAsHT8WpvwmvPPWcFgGysiN82GSAZG4OaHxRxJSC0zQnRIQ
	Qor+Ps04LuLoIk9isDJk5CtYg/dvCvOHUR2M9ns9ieQYaKIOfsfl72Ztrmmv/6Sf2y0tok
	e+g8YCWEYwIT9kLsWEDo3UAXFdAUPdb+K9V8ha3xoTy/l6z0kaMaZFm1TMc00H7cKli+nS
	9XAzag8BXm+W0gh4yY+7tTrXEDVy1TkUMB/dryY2U0YUQKFHN1A5ARa7uKDoe+JYCqpTWs
	W6GMduz4Hy7c5y9KXKMX99nQnwzBEwtWIsUxH1xKK1n9Aq6jC56urd1kLno1TA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 4/4] MAINTAINERS: Add entry for TQ-Systems AM335 device trees
Date: Tue, 26 Aug 2025 16:08:50 +0200
Message-ID: <20250826140853.2570528-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
References: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This includes the TQMa335x series and the corresponding mainboard MBa335x.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0110a497a19fa..3976bf909c0c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25667,6 +25667,8 @@ S:	Supported
 W:	https://www.tq-group.com/en/products/tq-embedded/
 F:	arch/arm/boot/dts/nxp/imx/*mba*.dts*
 F:	arch/arm/boot/dts/nxp/imx/*tqma*.dts*
+F:	arch/arm/boot/dts/ti/omap/*mba*.dts*
+F:	arch/arm/boot/dts/ti/omap/*tqma*.dts*
 F:	arch/arm64/boot/dts/freescale/fsl-*tqml*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*
-- 
2.43.0


