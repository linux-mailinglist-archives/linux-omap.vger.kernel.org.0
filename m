Return-Path: <linux-omap+bounces-4327-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF862B365A0
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 15:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D458B1C20CA6
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 13:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C244733EAF2;
	Tue, 26 Aug 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OzaksYkf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c2UEh1cn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E828314A;
	Tue, 26 Aug 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215807; cv=none; b=qE+VUl2g2nFhCUGmS+v7i3MLPPnPynVOKbGSFOfz2x1mw2YUsEuLs+/9sh299/nr+BFQ6s7/8NOfyj6vvWjZP8Xa/yHXvzYougZf6QXo7n1eZukyf1lrp6fW4TITQgXXG9pH0RVOPRYzVy1WIPrGbkCNCX7SmuZVVNaZFnnfpa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215807; c=relaxed/simple;
	bh=lBvAypEUNGK3qFrs5QK5suJnmFI2ohd1rT2QMhkO124=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c3B93P1UL3TQ5V+5A+aI2py6LabjfRxSwfXIVA6Z4wvzQNlwmkJY0D4VbweufSGK1MqAUJ6gCthpazTZUBsnGLD7N3dtV7FkGN59svnVIbVO5Y2Z95ewh30ovc6XBMmN7rV08eNabre+s0mQyf+Q6HjtEG8uYKDyLobAKh0tbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OzaksYkf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c2UEh1cn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756215804; x=1787751804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=95LpgcUmGtkG3/iEyBUu5q03Om8Kq4KfvufUeFFtQCY=;
  b=OzaksYkfKM/v3ohu0Y8Wx1FzE78Kefg0BylDrWiZ1zq+InRWzaPURU6X
   JDSYd9Au0KcEKFK7Tjp2G1BFNhjuXqWrdA8JFgtHtcbZ/MDbO6wAYxZcf
   YaPyfFF/I/vlf/F8VOia8ao4g/npGBfm43rbUooOU0WUIsXs5CMEhsEt7
   5P2PPMH1trQL0tVqqHM8aJpEG5mxZFdwB97ocpQC4+CrYIpeMQY38oUIZ
   no6Pn5XwnybGqHXi5ymuW8676n1Rk0gNA0lo+uZ/S1U74X6liF3lVhr/U
   7FKqK5zUUaYjZw9fVHBlolisnCe1h9EAuOqcHziyAvNipdWmlTTfl/m7/
   Q==;
X-CSE-ConnectionGUID: 4XwqTIUvQ/WEU0by7cKtVw==
X-CSE-MsgGUID: 3gjJSHO1T6W0A+J4sWZGJw==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45916685"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 15:43:15 +0200
X-CheckPoint: {68ADB9F2-33-9821D066-F5C64F68}
X-MAIL-CPID: 2BE93F38BCBA60C3F85774E63EFF2C95_2
X-Control-Analysis: str=0001.0A002101.68ADB9F4.0023,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47B6816806C;
	Tue, 26 Aug 2025 15:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756215790; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=95LpgcUmGtkG3/iEyBUu5q03Om8Kq4KfvufUeFFtQCY=;
	b=c2UEh1cnN5IEsOxX68kIv0W273uMiQj3CrlBToHhCnPyI0fKVSTtLnc0Ddi7MUo/VIeGWL
	GAbCQ9PwdKYFtiFQV6iqtpnxhIAQAX2sWb6h32G7VZwvkq2RksvE/Mv9mG26/qZOSkv4Y1
	4jpWT0kPBCc0GoyQYeWiqGAc8zujQm72EWoZyK2oFDMExIb/VNRcuch938L2g3sPG4myAs
	s19wNVqgPPPww1suhqQSz+4DHdgFHZjVJcJZaZgclIeltnmen4mXuNo5XCzzbMDOqRmCPW
	pMZurZ+hJLL6HuLk6v7gy9Q65AtrJZfGFMJjnlxhMUmyXj09Hgq4xUGGcxzxMw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: tps65910: Add gpio & interrupt properties
Date: Tue, 26 Aug 2025 15:42:57 +0200
Message-ID: <20250826134259.2564191-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The binding document ti,tps65910.yaml requires the controller and
cells properties for both gpio and interrupts. As they have const and
fixed values a default can be provided for all users.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/tps65910.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tps65910.dtsi b/arch/arm/boot/dts/tps65910.dtsi
index a941d1e623280..161ce31085d1e 100644
--- a/arch/arm/boot/dts/tps65910.dtsi
+++ b/arch/arm/boot/dts/tps65910.dtsi
@@ -10,6 +10,10 @@
 
 &tps {
 	compatible = "ti,tps65910";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+	gpio-controller;
+	#gpio-cells = <2>;
 
 	regulators {
 		#address-cells = <1>;
-- 
2.43.0


