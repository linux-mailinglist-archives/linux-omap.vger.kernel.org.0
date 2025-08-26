Return-Path: <linux-omap+bounces-4331-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E4B368DE
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 16:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284291C81321
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD89E350840;
	Tue, 26 Aug 2025 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VQAxsje9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qk7hdo98"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5535207B;
	Tue, 26 Aug 2025 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217358; cv=none; b=N5BoCu1iSaCHmm23qM0gyxAaecTS21nw+SOZqmotF1HJh3R+SrJaAhZObsdiGnL4FbH+5L+cBggudzWliT1t2H9d07ikm17V5Wfl4B9BNWLQPG4bRAX20yTwf8ut+LzU2CyAphCkLF5JhLoPbj1SWsJVJmk2ZroiVhAlvKSBROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217358; c=relaxed/simple;
	bh=CK2DXu93gZl5knFQF92ArkhaN5V4HugeeLRDrWFJcv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f00wUrzTgRCMe4fOuHey96AGHkGbv+4OnreUVemdRMZ16vwbJxolDRyRV90FxI9VSUYSrr/38vaZPgPdSSFDYZ5IWBcRTELE8g8b7VTjsTKiMVnC5b+mAm86JuA5K27xAErynQ2AcwtENvisN1Rh/h05Kf/S17NjRk8BrwM3ZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VQAxsje9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qk7hdo98 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217356; x=1787753356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EQWMywuo1jVJyAR1LFYSq6V0bi17Me/s56BAd2fbYVo=;
  b=VQAxsje9H13ys53AclqM+1KvzcmlvyHorcpUGj+cospMbdhtl1vu7ZU0
   lvGw8EZW3X5bm1BMrgej60BibL5+hF1gtoeAwJZ1qDKWBWDQoLLiWJiWc
   uj1aLIaAbQan3qNbkfbm83wZ4PbkRgH22XA3lihbO3P4nqJM89BCYJftV
   XlYmxc5nKvM8j/EKNYHu95eMunS1gSQOBZS+YXH+hBSEtJLopJrq8UOfL
   HVkcXh5Sm7tHCS3gufUlN3OOxgc7DXkK4XO/4w5Qsxu0Rv0qfC72QdpyV
   ctceJ+MIHdp899JuHBysaPU9l1eV3iPQdA/GN3jbq5bN1ECyJEKSGQv8e
   A==;
X-CSE-ConnectionGUID: XyCS+t9pSO6ll23oAeZRFA==
X-CSE-MsgGUID: StULDFABSES5n8IX3tmycA==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917280"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:09:14 +0200
X-CheckPoint: {68ADC00A-47-410E8DD8-CEA8F0F8}
X-MAIL-CPID: FCB5776FFC63D12A3E298837F8A10F6F_3
X-Control-Analysis: str=0001.0A00210A.68ADC005.00A1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EC421680CB;
	Tue, 26 Aug 2025 16:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217350; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EQWMywuo1jVJyAR1LFYSq6V0bi17Me/s56BAd2fbYVo=;
	b=qk7hdo98Xz5yaPqs8oqLm8IlQEDPTj1A0RnolOqupaOLh0yH5k88Ys+mleowkKx86bkDbW
	duXIJ1VCYt3TmjF+m/P3oyMpRWce+YvxopMLLHDwDQJ9vCQ5p+gytXLNZde7vCAX8J3cpC
	MspcdpmuNSU9Ugl+JwXRlRsuE67UXRWRN12L5QZDLZlPniad5wuX+wYMy7UzxE8+viPsPl
	yn31RL1xs1iCQ85OxokmmqKv0cD2Gc7SKYPT5HbaC7EXqZiSAff7h9dj3ArztaqNd8zllY
	SGDhfHJeKuYn1fpK/lG0P7MOFTaaSihbcNmVHRnvFyc/UVqV2pXGjwAYdZbn4A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/4] ARM: dts: omap: AM33xx: add cpu label
Date: Tue, 26 Aug 2025 16:08:48 +0200
Message-ID: <20250826140853.2570528-3-alexander.stein@ew.tq-group.com>
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Board Device Trees often want to set the cpu0-supply. Provide a label to
reference the cpu@0 node.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/ti/omap/am33xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index 0614ffdc1578f..231c31074293e 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -45,7 +45,7 @@ aliases {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		cpu@0 {
+		cpu: cpu@0 {
 			compatible = "arm,cortex-a8";
 			enable-method = "ti,am3352";
 			device_type = "cpu";
-- 
2.43.0


