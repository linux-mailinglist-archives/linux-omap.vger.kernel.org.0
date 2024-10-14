Return-Path: <linux-omap+bounces-2412-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD699CFA1
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E003428C709
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E991AC448;
	Mon, 14 Oct 2024 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="m3N/hZUO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475E4595B;
	Mon, 14 Oct 2024 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917626; cv=none; b=JCvEErKVaCHpNZaT373E8gKlJeh7sK5FFAvFG7XVC6LkouX9F3OCJxEUwYDQpngIi4QgCugJHFA60lDoivNv6jGNGxR8htyNtNm2qu1W5zu7cMDzGHWTOws7RPO1XrLD5Dg16z+COSjgfv60OAy2rMeXiKhsQMMRbctwCsxqqzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917626; c=relaxed/simple;
	bh=8fVr6gzTsVSd9RJTj3DDOtYEVKuodxZash/T0KweiBw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k0GwR7fDY3WzyPqApTjoYqBFHiEeghLIkgt0ki0IIrueT+M0bMLE1E7etiYmwK1iS2coruqefFl8Fy1LUXe8EFvlYcfzRVj+DW+Zq5+QeMJSl7g/Po7PaLXPkMlsrJONexcj8TJqmUNTHKyseVl9ppogj0CDDlE17EUJPy94tio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=m3N/hZUO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tEHKWSYZzrPud4eXjIaCbUyCf6H6XReStSM2EiV1xCk=; b=m3N/hZUOAZgKVqJ4STMDBZ0Rpp
	oqj6R4bYf+U08CcHux+/PgpLknRmBcxJUe6bzXKupy5H7fy+8A/sSgql/Mu5Z6DMMiOlKJbEqXGdo
	bAHEojeqXPirMCkTIG+qcxoIcY38uE91q8GeXEjGPeTCUmwZj56e6Qaswx+vBW9FLRcACYSK4s6iU
	QieP3cbOOuzCnuKc8QxdZh5iZ0RfQRh+tlvEj8aqsf5PLqliwTffMv2aQ21fk34CTdnnejrRPn7LX
	LHy6IjXo1cPfJWbFIvVkUTsFkTGgXH84Gteei0Rai23dbH4sy+gc2KrQqtUjWrGWknPff4dPD9SK5
	yiom9F/Q==;
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties
Date: Mon, 14 Oct 2024 16:12:40 +0200
Message-Id: <20241014141240.92072-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241014141240.92072-1-andreas@kemnade.info>
References: <20241014141240.92072-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify the dimensions of the touchscreen propertly so that
no userspace configuration is needed for it.
Tested with x11 and weston on Debian bookworm.

What is in now is some debris from earlier tries to handle
scaling in kernel:

https://lore.kernel.org/linux-input/cover.1482936802.git.hns@goldelico.com/

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 3661340009e7a..6e25db29a4bb9 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -591,8 +591,10 @@ tsc2007@48 {
 		interrupts = <0 IRQ_TYPE_EDGE_FALLING>; /* GPIO_160 */
 		gpios = <&gpio6 0 GPIO_ACTIVE_LOW>;	/* GPIO_160 */
 		ti,x-plate-ohms = <600>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <640>;
+		touchscreen-size-x = <0xf00>;
+		touchscreen-size-y = <0xf00>;
+		touchscreen-min-x = <0x100>;
+		touchscreen-min-y = <0x100>;
 		touchscreen-max-pressure = <1000>;
 		touchscreen-fuzz-x = <3>;
 		touchscreen-fuzz-y = <8>;
-- 
2.39.2


