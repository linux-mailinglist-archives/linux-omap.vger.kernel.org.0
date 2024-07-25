Return-Path: <linux-omap+bounces-1787-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9E93C3FA
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 16:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DEB28306E
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F70C19D072;
	Thu, 25 Jul 2024 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="Rp9+Ekrq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F119D068
	for <linux-omap@vger.kernel.org>; Thu, 25 Jul 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917212; cv=none; b=aOpbInbaILGN/O3Wj2EjeppPzubsDIOYhQAOPP2StnVUwpAVo1E6xNGJbTBLLjI44nONyb6YgYl6Zhxj9UFUGOaJIs+Jt52YIBy01jog5k3a8NKJq7u/AXObB944/EzWPwJZ4RpyNxREJdAel7CnOCbSoF7+jY7+syQ4Q3q2upk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917212; c=relaxed/simple;
	bh=dywp/sXMwZKK8D++J37/xZem6S38pg5RdUqDSbvem+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AG4V4s6639lDfcW6bqxej5G+Z4FxJ/rxUnE+hPSyWlctgZEUqsUDky4GtWpBBgn+mxjxLIf7oBwgFBxrZFEJKB9qJEtD6YxH1vtLAo1j6z/dIFChFcDnWWMDbfoXwk432tuSxN7lFxO+rj2gkz0X7ewrh0BrHjpD5BN/57avkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=Rp9+Ekrq; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1721917203; x=1724509203;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dywp/sXMwZKK8D++J37/xZem6S38pg5RdUqDSbvem+g=;
	b=Rp9+EkrquJJYdV45lKJStnIYcFTzpeLWNh4Xyg0H9HS+QODLwmqrrJxCo2NY/Fs9
	zbcvgoIEZW/ZZRRQA8QL2y0OoYpjEd/6E90h0pDfx73f+45VFRx+GqrG8h4BlXAH
	3UxSv8aXriYVeFvsAtpiAMOR4wEsJi22qnTAYjmIQds=;
X-AuditID: ac14000a-03251700000021bc-f4-66a25f133f78
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1C.5E.08636.31F52A66; Thu, 25 Jul 2024 16:20:03 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 25 Jul
 2024 16:20:03 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <khilman@baylibre.com>, <tony@atomide.com>, <s.hemer@phytec.de>,
	<linux-omap@vger.kernel.org>
CC: <upstream@phytec.de>, <d.haller@phytec.de>
Subject: [PATCH 2/2] ARM: dts: ti: omap: am335x-wega: Fix audio clock provider
Date: Thu, 25 Jul 2024 16:19:52 +0200
Message-ID: <20240725141952.81213-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240725141952.81213-1-d.haller@phytec.de>
References: <20240725141952.81213-1-d.haller@phytec.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRpKBR1c4flGawb+tmhY/27cwWcxe0s9i
	sf+Kl0X3O3UHFo9vXyexeLy/0cru0d/dwurxeZNcAEsUl01Kak5mWWqRvl0CV8a3lxdYCrZx
	VUx7tZC1gXE/RxcjB4eEgInE2r0BXYxcHEICS5gkGnfvZIdwnjBKHFs7i6WLkZODTUBTYvqk
	rYwgtohAskTzyknMIDazgJ7Eh86lYHFhAT+Ji3dvsYPYLAKqEtc/zQDr5RUwl/i+shGsRkJA
	XmLmpe9gNZwCFhLt65rB5ggB1exvPANVLyhxcuYTFoj58hLNW2dD7ZKQOPjiBVQ90Jw13aww
	M6ede80MYYdKbP2ynWkCo9AsJKNmIRk1C8moBYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGC
	QlyEgWsHY98cj0OMTByMhxglOJiVRHiX3V+YJsSbklhZlVqUH19UmpNafIhRmoNFSZx3dUdw
	qpBAemJJanZqakFqEUyWiYNTqoExb8ZaT4+4syb8HzXr8o2TXNvavoj/XP/kHIv6YxUhy8Wn
	4re0nA37xX2a5ZHjpwcrqrM2ZXZMNXnnoX7sycOU1WsuzFmgpmd46+LvolViGjfPndnExbXe
	2cz3sPa/6Kun0sNPSp/qFZpV35bMw6K5TFp1Uqa0d6bFNtkgcy8zn8Czdaz5X78rsRRnJBpq
	MRcVJwIARnXnPl8CAAA=

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


