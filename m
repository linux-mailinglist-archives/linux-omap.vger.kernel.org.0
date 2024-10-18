Return-Path: <linux-omap+bounces-2458-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDC9A491E
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 23:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840471F272B2
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 21:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E0C18E763;
	Fri, 18 Oct 2024 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="xU+mrdqr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996916D4E6;
	Fri, 18 Oct 2024 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288076; cv=none; b=cJe6UZ/JSjH4CZKr+dgL0Y36tS5rR0TtRS6hMcuKOLkXoG9ZTivhvumw3iUGaEYrtZLdVT5fxT5Fq7Cev6CRyfPWs6reSzRtapjnYhlWcvMSvzJWn07d9N3A7eEU4AyA+xWEijF8z5YdMJrjhMoZ4NogbSlxGtIV5zbr73vOWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288076; c=relaxed/simple;
	bh=GCembOxXqoxGHyKB6sZTgd5drl5OE2YOvO0Wl2XLd7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TFZqSit3zE3LVtNHS9EWXTirLJ5lXEt1L3ZdOnQ9/HyZd4mf/iNI8G0twCcwKPhl+DNFb3vL2xBPUcfcK5ZX+bTTBKp4mGwuOF8+67+ftLQJ6PmZD97zr/wfF1TphplP9J6NCaTBZsU+Zy0lR8DaFN86tqJYH20b++b5UmimQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=xU+mrdqr; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=K5aAZ4qh0AEAbu5qvWu/4QCvE+diJotq5vEmByCm7xk=; b=xU+mrdqrcM3zxXqe1PV5eBfrQ6
	eWl5vuzcRRFUqDmlOKUwlfVUNTpQ+mW3iugHuHCuZvrOCn+ewRiOEH8Nxi21GgbwqqjMTb1IRSAuK
	YR8x1xyb/L/3XLWEFrl3Ay7CInmRrm3q4Zit1uzDBIpzXyXBezIoxHO/hXHysZsbZx5f2QHURsWdC
	c6M3bnM2fJAfpFgR6XghgPQTWcG6kV7VQwTiDORA0dSNIx3LfoteQfSMo4KE8pUWWJYwn7OI77ccY
	FZixz1eUVOeUJ2wnl2y836dHZx6NohAZEQB8q0H+TvEFG3FddIt5Iv9cDxdUO/smUiYIH+iVvF+0V
	vUJaojMg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aford173@gmail.com,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	khilman@baylibre.com,
	Roger Quadros <rogerq@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Stable@vger.kernel.org
Subject: [PATCH] ARM: dts: omap36xx: declare 1GHz OPP as turbo again
Date: Fri, 18 Oct 2024 23:47:27 +0200
Message-Id: <20241018214727.275162-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Operating stable without reduced chip life at 1Ghz needs several
technologies working: The technologies involve
- SmartReflex
- DVFS

As this cannot directly specified in the OPP table as dependecies in the
devicetree yet, use the turbo flag again to mark this OPP as something
special to have some kind of opt-in.

So revert commit
5f1bf7ae8481 ("ARM: dts: omap36xx: Remove turbo mode for 1GHz variants")

Practical reasoning:
At least the GTA04A5 (DM3730) has become unstable with that OPP enabled.
Furthermore nothing enforces the availability of said technologies,
even in the kernel configuration, so allow users to rather opt-in.

Cc: Stable@vger.kernel.org
Fixes: 5f1bf7ae8481 ("ARM: dts: omap36xx: Remove turbo mode for 1GHz variants")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c3d79ecd56e39..c217094b50abc 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -72,6 +72,7 @@ opp-1000000000 {
 					 <1375000 1375000 1375000>;
 			/* only on am/dm37x with speed-binned bit set */
 			opp-supported-hw = <0xffffffff 2>;
+			turbo-mode;
 		};
 	};
 
-- 
2.39.2


