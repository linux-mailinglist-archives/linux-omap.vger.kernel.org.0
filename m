Return-Path: <linux-omap+bounces-3615-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD3A9DF25
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 07:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D63462010
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 05:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBA5224246;
	Sun, 27 Apr 2025 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RcgxGrrG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63221F17E8;
	Sun, 27 Apr 2025 05:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731667; cv=none; b=WHSCkLAIaINzXnwm76BbjIOl0OG3tp428ZNN1p+GAlRZNWDhT6gvGEuDj4wNmMDSb2oI0GTLQ9RdzWZkFL/JymM0EJhmjuB+WTGTer5EkVCXaLmF6GF1fZvXUj6h4h3bMGl2hAB/iXayE95m7i8bdGGTsZgM9cEP7RxbwNO2j/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731667; c=relaxed/simple;
	bh=fzrxUPVaU/GrsOioMdBpn8u9ZTG/DPM0oQ8gYWLDrOU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NMZOiVoFo093ffh+kmBzr4/Ev3hd7BocYg/zAc59uKHqhbQPJ2a//PKrJLmtQKWMzjWHVMnCt1KRCmbeEvTjgv7cOIcSaw0H0GFNxibZO+kBAz3ClveyDsn5VON16X5kIHhqOhscIFAAE05xjicjAD+yq0gg5pc+iwsO8DPY7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RcgxGrrG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=8X3JADG65msb77SJ0YeZV7UxLe9dIEM9+QPErSSGqtA=; b=RcgxGrrGkBQRsfqFThiUcTsHM2
	bRR+42bG3iTkGAwxFTZ8s6F57RoT4rxHv4s6s/0RgB/gbH8IRTao1MagQ/fS54q1j/XekyC4zhu1g
	buVoK3PXqAvSKuYNMomceAiGwbrJ/rV3bk+yhR9mg3pPoJ0Dz/P1fxclNrSDNULTqCPG/NhuAWwOB
	2qu/u7zWooZ+j5X36sneH93bipFVCsz5Qp/ZY5M6d3WpNUUwrl6CsniC9Jn2YguUm/VoPgrDickSt
	E8ktsS/eQ0gN69gjdcp+BvTwgirB+ZipO6kZ/w0dHDNmuvSRn+XMaL4RxxfORzXJM0iB+xQOKE+im
	6ulyKutQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/2] ARM: dts: omap4: panda: TiWilink improvements
Date: Sun, 27 Apr 2025 07:27:33 +0200
Message-Id: <20250427052735.88133-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add proper definitions for 32k clock and enable bluetooth
everywhere.

Changes:
v3:
  - better commit message to describe what the clocks are for

v2:
  - extend comments by trading in checkpatch compliance for readability
  - remove one unnecessary newline

Andreas Kemnade (2):
  ARM: dts: omap4: panda: fix resources needed for Wifi
  ARM: dts: omap4: panda: cleanup bluetooth

 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 39 +++++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 ---------------
 2 files changed, 36 insertions(+), 35 deletions(-)

-- 
2.39.5


