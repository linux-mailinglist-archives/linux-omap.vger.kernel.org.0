Return-Path: <linux-omap+bounces-4329-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2FB368A2
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 16:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1511BC59E9
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 14:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C74D35083A;
	Tue, 26 Aug 2025 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gaMNIZ/v";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KNT3NnRa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD623DE;
	Tue, 26 Aug 2025 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217351; cv=none; b=nF77EYzptWNZuAv+dF7sgf/nParCf5JyqRr7mYuArpf2fdctWyN338hxvZpANqaZwtiegUlE3NbWWHRWM3/aaCxjdlc6N5BJg1pv5fyVGucvNlMj8sMq/1xaioVY6lMzT0/CE07dml6HshQRA6HMr5YnD13cG/JKl/XKZkXG8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217351; c=relaxed/simple;
	bh=JIVlPLEFXypz+9ZvyaVCGFYJ9cswU7HwHMNutcDnB+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioCDES+owxWJkIkr/eJV9ytfSgQ3brLHEDRrZyN+pVqeBYl35SKPVua091EgDByd4J5wSAZBF03J8r39iFSgPhzb3Rb8cFhj2WoTuMtYx9pYmRCcynWCFPJ+6Y0iRU93wrxiwI/ULtygAvV/8SYaT3PNBPs9Oc2ZdgyOKJ7WqX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gaMNIZ/v; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KNT3NnRa reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217348; x=1787753348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zirqv8Nhn7nsWDEuEZuz1QYarZ/LOtpf27dppwWpctE=;
  b=gaMNIZ/vyQIX0bUWtmHjfHBJA/H8pUhNGVkROx06kRDQNGLlzBWq8dgF
   nr1DQniuUr4doMC3fr5+s+ql6Cdbc3ri9bjX8gFPTPDFHRp23RFTwHpKt
   /MhGuLQojOJBwVNrNg2H5Co3iGUBsuWbwbmkC9ikFVkY3qN35Ut5CjmPN
   JwYEzwud2s1PwutjNUQBelCRvGW10aqesImqEk299kHUVLkcGcWphsK1n
   02KHW3tqo1KzWTvixxPAtleTBIwFO/4ls0iSAyGAcZWrTtsWWEh7ZP+mW
   lsAuW1RWpTzZs4nwTRain61db9XihybOJ0WAMbzMYhFSv6QW7AfaMKAgr
   g==;
X-CSE-ConnectionGUID: vm0ZdXcHSYWL8Sbg0nhU3Q==
X-CSE-MsgGUID: +vgoQZ+eRPCNGG52TD2V1Q==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917276"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:09:05 +0200
X-CheckPoint: {68ADC000-3B-9821D066-F5C64F68}
X-MAIL-CPID: 6E85FBE41D0C64DE1B390DCD72F6FEA4_2
X-Control-Analysis: str=0001.0A002119.68ADC03A.0052,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92F52165C5F;
	Tue, 26 Aug 2025 16:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217340; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=zirqv8Nhn7nsWDEuEZuz1QYarZ/LOtpf27dppwWpctE=;
	b=KNT3NnRa1OWVn+xGjscMCMOOx6hO2Ix/nl/RJS1ZyV0hu1yO/sVXK5DHJe0iXumpEGi1RQ
	Ywykd4JkvDRkB22DL+CdNX8/gUe+MoogoNrHqgAV6BPCWdmytmHGucsOyj0D2H/+A8veb4
	a0vstDQ7knJE/bYHjLmyXeKBCOgh3DbnCOcP6FDnJbT1PFILWw0deSticlJPAklw0ppWrA
	TR1ZCtYuY2PZ1XGzUSs6984eyMAUXSoEjW0xSVstjPnInIb7tKG2SaA08G+6xXl4sqEdfD
	iibHGaKYjhLlXsHKzDm1jFnJ0zJRcVb7OpBCJHroYcZZ3DDgngIIpqXiXSYNiw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/4] TQMa335x support
Date: Tue, 26 Aug 2025 16:08:46 +0200
Message-ID: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series adds support for the TQMa335x[L] series, as socket [1] and LGA [2]
variant. The device tree can be used for both variants, so there is a common
compatible.

Best regards,
Alexander

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma335x
[2] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma335xl

Alexander Stein (1):
  MAINTAINERS: Add entry for TQ-Systems AM335 device trees

Matthias Schiffer (3):
  dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
  ARM: dts: omap: AM33xx: add cpu label
  ARM: dts: omap: Add support for TQMa335x/MBa335x

 .../devicetree/bindings/arm/ti/omap.yaml      |   7 +
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts  | 632 ++++++++++++++++++
 .../arm/boot/dts/ti/omap/am335x-tqma335x.dtsi | 270 ++++++++
 arch/arm/boot/dts/ti/omap/am33xx.dtsi         |   2 +-
 6 files changed, 913 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi

-- 
2.43.0


