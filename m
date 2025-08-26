Return-Path: <linux-omap+bounces-4330-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD2B36891
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 16:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5002756459F
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC3035208F;
	Tue, 26 Aug 2025 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BETZ2fqy";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B6Ceqvp4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83655350840;
	Tue, 26 Aug 2025 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217355; cv=none; b=KX6ARKoYkBL5dU5UFHu5tqT5D+Ef/S+nwRgKBQvixQyOtOL3JqONXhX+IW1kg8Nc69s8TTMUYsBctOso0C0oPnCaFZmn8MPIYcFE6y5vJkxdJg7rc0FdLl12cEyzo4nlXYCWcJ/TMlsKdj2XGMaM3CcOs1+B/8PGNVyDOMBMByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217355; c=relaxed/simple;
	bh=x9PY9mThpZz30Gfp45VUQuhGMf1NNkpC1yh5J8gOERI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMylqeGadlkbFz4cFuPLCpdGgDRfSBKbkPpfzVv3Momo1GVqcI9ljp8qisOpmOOzD3p2rAXZMA+mJ16Ybq5kDUFXo2U/svyKevkCXckGEZYH37tuN8uAbZaml8R8jXa+ZdrFPcPD21bKiBv/n7xbbMtke0dOfKBjsbncSTH1azs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BETZ2fqy; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=B6Ceqvp4 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217353; x=1787753353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fCxbfh6WUPQEH3f4RZZ9GpYWjO3lgPqsIs26lP96V4=;
  b=BETZ2fqy9aigbZuTI9X1S2PuZjOt9P1nw1ZH4OSy6qxllU4sBTYS49aV
   WWRYobKJmV5PvJlo4xV9d9mGt1+cZkUSfSy8IYjzisBlXBIqmO5Im4NJk
   nUYnNGg7rVA8EsQA4Tde1HORrMaxk+JRpUISDy5CapTYsT//SNR+60PsT
   gpZJT3phUQ+KQqJO2KCk69QMgQ89ISLOWqoB5qWt8EBLwuY3wAc9ewKdu
   PUKLQZ/G6nspVAUzDxno9dcmwZ6EtIIn7HOa4vfo8kid/mYkNBRT92uYs
   xt4PKtnhyCacFCtw+YGRdZSWGco9BoKyKYAXRviSOFUFil5pmxeGbf3sN
   A==;
X-CSE-ConnectionGUID: dedMlWHERqO/CrBLCtLjGw==
X-CSE-MsgGUID: MwAzqnM0T3OzkVgi2/6f7w==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917277"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:09:09 +0200
X-CheckPoint: {68ADC005-30-20CAA7DA-EC9DC758}
X-MAIL-CPID: B1BAB8C30F34D838DA71E932354137B7_0
X-Control-Analysis: str=0001.0A002105.68ADC006.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5296D1680BC;
	Tue, 26 Aug 2025 16:09:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217345; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6fCxbfh6WUPQEH3f4RZZ9GpYWjO3lgPqsIs26lP96V4=;
	b=B6Ceqvp437yx4S6qVQwhHAFvSwv5MmyT1RIkNFpabCBLrzlWvk245JBhDEdnmb4+R/PRTU
	E3IhQ8zKuDHLNepngb1I1XpgMjPZgQePrya7LK0Eo09rGpqFbM7KzD7avfFJFKxEcHSjk9
	j2BJDsrDuqaKfa4zNq3APqTFhAZHbEbM0BN2iHKbYicVkEt0FWn45C/ryp/viuRO8lUoMH
	ry8lAWL2/P+tLXKBs9FJq/+jCRsRofeGGud8etcV2TYBwcXcJVqelZZANAkaTVSmczMGfC
	vMCnmsDcroHrey1F4A1elkuMd/rxulHRkJ67yPfYk+MHYDD0i13pb1Hm/kq5gw==
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
Subject: [PATCH 1/4] dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
Date: Tue, 26 Aug 2025 16:08:47 +0200
Message-ID: <20250826140853.2570528-2-alexander.stein@ew.tq-group.com>
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

TQMa335x[L] is a SOM family using TI AM335x CPU family.
MBa335x is an evaluation mainboard for this SOM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index aa5df4692e372..14f1b9d8f59d9 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -129,6 +129,13 @@ properties:
           - const: phytec,am335x-phycore-som
           - const: ti,am33xx
 
+      - description: TQ-Systems TQMa335x[L] SoM
+        items:
+          - enum:
+              - tq,tqma3359-mba335x # MBa335x carrier board
+          - const: tq,tqma3359
+          - const: ti,am33xx
+
       - description: TI OMAP4430 SoC based platforms
         items:
           - enum:
-- 
2.43.0


