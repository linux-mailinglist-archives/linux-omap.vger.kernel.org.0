Return-Path: <linux-omap+bounces-4395-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB8B3B262
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 07:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E6D203DBC
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 05:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B26212567;
	Fri, 29 Aug 2025 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IhTfS0sI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LwAnA4HG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACFE8488;
	Fri, 29 Aug 2025 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756444985; cv=none; b=ShRK3wUNh2tVOHSY/FCQ+Atn4CK40IeeR783HpgTzlPdT6MiLOazRck+uIgAHyFULbgYxPbt/8eAed5xxy+hfRHZboWcF8CGE0PjvddbzT/yc1wF+SfIq/h0fDVYJdBxBBFsiB53vgYZd1w81wklXV8qXNqrwnPI175Tivyx+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756444985; c=relaxed/simple;
	bh=FP1KpwwplKZdgCaYZIEW3o8UFzFg9D+V36y12tW5uW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7vrVWqIS4jzrnyELKgUc63d53Cyqb1yMh4Iy8C9pJkD9NZjNDTEey2HxwucBEGDDZzx2/9ZXcJv+0TsBdVcvhc09Ga1yU5X584LyQ8g1fVmqRKJzDI9JoVOwM+Ob7iECYEyeaOnmrPoCIXGN9/DS4puZe35cpyCeGu6lD3THdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IhTfS0sI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LwAnA4HG; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cCmr528zCz9tSk;
	Fri, 29 Aug 2025 07:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756444981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oBuY1bgfTNlKDPqDfF9q1Kr+TPBTQ0Xqwrre5sa8b5Y=;
	b=IhTfS0sI0XFRJ1NLPq93wtZnkfUBNEPOKpnhiz7evRim/+G+0VwnpoCENJZa39OYOJYo5j
	cKE7To13VyMZwAoFeo9Bjz8zfqBG453yyW0VpdpJYFwetgRIDjgJ1Vz6LBUxj631WF/PCD
	cKlGxhqP/JQbybTN5dTETtEL4FiyQ6JH5TzUaHv6l5uxD0sBHVwMNDAQb32bdpl9wgtryb
	oqxRZb3X1PYAdSp1593V6lCAUeJtdraMFUAXf22xY989odKao8SVtxifoWn7E2hMQugvwU
	xUGv7UBfDrsEpoZcHBeET/0NLExcIfOig+1cq2oa1YOBvqmQsAfzXJJmE518nw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=LwAnA4HG;
	spf=pass (outgoing_mbo_mout: domain of alexander.stein@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=alexander.stein@mailbox.org
From: Alexander Stein <alexander.stein@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756444979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oBuY1bgfTNlKDPqDfF9q1Kr+TPBTQ0Xqwrre5sa8b5Y=;
	b=LwAnA4HGAVj6JafDYqYk2JLc+e9UgD8rJMEBsOfRMtb3+BWHzzydY6JqCOLGLY+goyJquW
	eaycpg1EtQ29hmqrbV9CakIlqZg3ndLzxY1HJpNhvgIGcOL5hEDtOePSUyviDMs9dnB2jp
	k/skdOwvpP3X5W1Csj1Tb3ehwwZMT7UUUOGZTVIAQns4DnChlKZzQ2YVrReGpUvcBY2qfN
	F1GoiXrmJieXJnZc3IcQ293EIefUOUEFdNTqA9a3F73U5Pi8VedU4qiL4daJnDutQ4acb/
	boLq5BuKy9L+stEvXi6vlzEJ5vJ1QarNXMvSFZaqlT+KyPkrfs16ouSZb2BBvQ==
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: ti: omap: am335x-baltos: Fix TPS property
Date: Fri, 29 Aug 2025 07:22:32 +0200
Message-ID: <20250829052233.26821-1-alexander.stein@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e7ut9frqq557tkytxkaoesod6r89wdgk
X-MBO-RS-ID: 9f21b2ca30b53a96085
X-Rspamd-Queue-Id: 4cCmr528zCz9tSk

ti,en-ck32k-xtal is a boolean value. So remove the value and keep the
property by itself. Fixes the dtbs_check warning:
  ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910):
    ti,en-ck32k-xtal: 1 is not of type 'boolean'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index ae2e8dffbe04..ea47f9960c35 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -269,7 +269,7 @@ &tps {
 	vcc7-supply = <&vbat>;
 	vccio-supply = <&vbat>;
 
-	ti,en-ck32k-xtal = <1>;
+	ti,en-ck32k-xtal;
 
 	regulators {
 		vrtc_reg: regulator@0 {
-- 
2.51.0


