Return-Path: <linux-omap+bounces-2871-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBD9F9CC4
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 23:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2BFF16CC8B
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 22:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384441C1F08;
	Fri, 20 Dec 2024 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LEawztcS"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A131A9B27;
	Fri, 20 Dec 2024 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734734137; cv=none; b=BUeunSF+kldoebkhOfBjjNBHWB60PoeUJ4wue+oW40gMkiJbuTf6LRtQwQDgeL7tH//n2RBSoFaq0qo9GCQD+ocWIV4HcgrsaVyJDDBCLs7ajbodxKCQB1AI7+vHjgNwcITO7AZymalYSvHA3TWIYJd3frSxQVkxB9UdlikR/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734734137; c=relaxed/simple;
	bh=hCrPLBGKXul9fIWu9qcpnA6H6FZUmgnLsyZii4L7flw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WBweazDb1sgYsgypK8QeGL5sOT40wgd91Ad/NcIqqZBp7Pz/6UC9WKPDN6euU410tQx80iEMk9Vv2cF/RzUCQ3stjGE6PxRh7MbPqg3pDAEPi/raZwbxPHkOjIvGMzv0hyyBQ7egWgINp2jHdNwMi5ifUEoyuwPn8hERXC8CJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LEawztcS; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BKMZOnq072626;
	Fri, 20 Dec 2024 16:35:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734734124;
	bh=E0h3P4N9j75w7+HF6CeZ/8OdGu2MqcdwPSKxnMEMrkk=;
	h=From:To:CC:Subject:Date;
	b=LEawztcSSn2ZsUfgpUtFFS/uCt7JYhPEaLBNXTyrtsKX58MrRw2p4q2LvXKzORYSN
	 eZAKNVQtwsDfVqM7vBnaXaxGmaRwdpzUI1fux84lJ9/Ai2I6If8OkcmUr0TtLTOVg0
	 av1Thnn77Pi+4f9Vv/u/nEForI/Sd8aegzbygw1k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKMZOqB120869;
	Fri, 20 Dec 2024 16:35:24 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 16:35:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 16:35:23 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKMZNm6095687;
	Fri, 20 Dec 2024 16:35:23 -0600
From: Judith Mendez <jm@ti.com>
To: Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sukrut Bellary
	<sbellary@baylibre.com>, Bin Liu <b-liu@ti.com>
Subject: [PATCH] ARM: dts: ti: am437x-l4: remove autoidle for UART
Date: Fri, 20 Dec 2024 16:35:23 -0600
Message-ID: <20241220223523.2125278-1-jm@ti.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

According to the TRM [0] in 21.5.1.42 UART_SYSC Register,
the autoidle bit should not be set for UART, so remove the
appropriate SYSC_OMAP2_AUTOIDLE flag.

[0] https://www.ti.com/lit/ug/spruhl7i/spruhl7i.pdf
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index 824b9415ebbe9..fd4634f8c6293 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -180,8 +180,7 @@ target-module@9000 {			/* 0x44e09000, ap 16 04.0 */
 			      <0x9058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
@@ -698,8 +697,7 @@ target-module@22000 {			/* 0x48022000, ap 8 0a.0 */
 			      <0x22058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
@@ -726,8 +724,7 @@ target-module@24000 {			/* 0x48024000, ap 10 1c.0 */
 			      <0x24058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
@@ -1385,8 +1382,7 @@ target-module@a6000 {			/* 0x481a6000, ap 40 16.0 */
 			      <0xa6058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
@@ -1413,8 +1409,7 @@ target-module@a8000 {			/* 0x481a8000, ap 42 20.0 */
 			      <0xa8058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
@@ -1441,8 +1436,7 @@ target-module@aa000 {			/* 0x481aa000, ap 44 12.0 */
 			      <0xaa058 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-					 SYSC_OMAP2_SOFTRESET |
-					 SYSC_OMAP2_AUTOIDLE)>;
+					 SYSC_OMAP2_SOFTRESET)>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
-- 
2.47.1


