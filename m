Return-Path: <linux-omap+bounces-1801-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD0940D4E
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 11:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 381371C23691
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 09:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0EB194C72;
	Tue, 30 Jul 2024 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="SXBDXxsX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8498194AF2
	for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331465; cv=none; b=qQAfH1TevlF01mezZ9iJXK7tCWi0/9ooHTJJwlAWKFh2RheKvRDP1/vUBIlJ6zgz02nsez5BDDOtk17FHn27fbyYdHv22UJjGbTK0g1fQQpqKARfSqe1I7jhZsQnnb7L1ZdyiFFfG1vxnohkFcA01Favf4A/zD9Tr4Pf9TALCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331465; c=relaxed/simple;
	bh=dywp/sXMwZKK8D++J37/xZem6S38pg5RdUqDSbvem+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSHEM01UtHnvfz7+rx3D9ndweVnhNY3FselAHMz0WJb9xnzZMErfDytR+AtkdrxkQtTBOAI4k9pcWUDgBK5l/oGi5GEpKhwrJ3zEQNy/FXEk8NM3r/bc3PNNVaoZNcRYoxw7KXaMI/zdzvPMeFeL9R2O1bBhpuUdXt0cwIH5GG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=SXBDXxsX; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1722331460; x=1724923460;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dywp/sXMwZKK8D++J37/xZem6S38pg5RdUqDSbvem+g=;
	b=SXBDXxsXTKi3SUnFJzH6lsP7oWJHpMov9DR1Zh/iMU3M3+WexXGW7BPSJNlTwZb3
	kMxyiRn8i6yQwHNjBNBABDwPs8BNLeLQRQhunMnRpP1AdNKn7E6NWSUs2GmxhZ2U
	nYKk8EQIYIk7FCWxgHkGeqnKX7yyL9f+taq18lpdXyo=;
X-AuditID: ac14000a-03e52700000021bc-f7-66a8b144e470
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DF.0E.08636.441B8A66; Tue, 30 Jul 2024 11:24:20 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 30 Jul
 2024 11:24:20 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <khilman@baylibre.com>, <tony@atomide.com>, <s.hemer@phytec.de>,
	<linux-omap@vger.kernel.org>
CC: <upstream@phytec.de>, <d.haller@phytec.de>
Subject: [PATCH v2 2/2] ARM: dts: ti: omap: am335x-wega: Fix audio clock provider
Date: Tue, 30 Jul 2024 11:23:53 +0200
Message-ID: <20240730092353.10209-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730092353.10209-1-d.haller@phytec.de>
References: <20240730092353.10209-1-d.haller@phytec.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRpKBR9dl44o0g+VzlC1+tm9hspi9pJ/F
	Yv8VL4vud+oOLB7fvk5i8Xh/o5Xdo7+7hdXj8ya5AJYoLpuU1JzMstQifbsEroxvLy+wFGzj
	qpj2aiFrA+N+ji5GTg4JAROJPa2rmLsYuTiEBJYwSWw8upsVwnnCKPHt4y5GkCo2AU2J6ZO2
	gtkiAskSzSsnMYPYzAJ6Eh86l4LFhQUCJTZ+OccEYrMIqEosurMQLM4rYC7xZf5bFoht8hIz
	L31n72Lk4OAUsJC41R4JEhYCKnn6+yYLRLmgxMmZT1ggxstLNG+dDbVKQuLgixfMEPVAY9Z0
	s8KMnHbuNTOEHSpxZNNqpgmMQrOQjJqFZNQsJKMWMDKvYhTKzUzOTi3KzNYryKgsSU3WS0nd
	xAgKcREGrh2MfXM8DjEycTAeYpTgYFYS4Y2/sjRNiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/q
	juBUIYH0xJLU7NTUgtQimCwTB6dUA2PZnXkLZAp88/L62k5eW8KaYasqwhKoInPziamONUNR
	X9liWe3s+XOFZprq5O5PkTW8k3/XS1ov9tOvWdPYjv41iMjkWPrywO8DsxVKlBoyq4RbnDN3
	XDI8OOfrVb11Kc5b7u99+Y9XYMUToXq7BOeSDC7F39uP6/X+6Dr63OzsqVvt81mqPyqxFGck
	GmoxFxUnAgBNEC0VXwIAAA==

Bit clock and frame clock are provided by the mcasp. Change the
simple card settings regarding the clock provider and the mclk-fs for
usage with typical 44.1 kHz and 48 kHz sample rates.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm/boot/dts/ti/omap/am335x-wega.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-wega.dtsi b/arch/arm/boot/dts/ti/omap/am335x-wega.dtsi
index cb27ff464dbe..d0c290d7d062 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-wega.dtsi
@@ -14,7 +14,7 @@ sound: sound {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&sound_iface_main>;
 		simple-audio-card,frame-master = <&sound_iface_main>;
-		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,mclk-fs = <512>;
 		simple-audio-card,widgets =
 					"Line", "Line In",
 					"Line", "Line Out",
@@ -27,13 +27,12 @@ sound: sound {
 					"LINE1L", "Line In",
 					"LINE1R", "Line In";
 
-		simple-audio-card,cpu {
+		sound_iface_main: simple-audio-card,cpu {
 			sound-dai = <&mcasp0>;
 		};
 
-		sound_iface_main: simple-audio-card,codec {
+		simple-audio-card,codec {
 			sound-dai = <&tlv320aic3007>;
-			clocks = <&mcasp0_fck>;
 		};
 
 	};
-- 
2.25.1


