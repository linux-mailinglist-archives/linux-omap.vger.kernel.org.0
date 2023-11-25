Return-Path: <linux-omap+bounces-18-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9817F89A0
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 903B42817B6
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCF4C2C0;
	Sat, 25 Nov 2023 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1CF10CA;
	Sat, 25 Nov 2023 01:29:53 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oyt-006foW-2h; Sat, 25 Nov 2023 10:29:43 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oys-0004J6-0r;
	Sat, 25 Nov 2023 10:29:42 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	bcousson@baylibre.com,
	tony@atomide.com,
	andreas@kemnade.info,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 0/6] mfd: twl: system-power-controller
Date: Sat, 25 Nov 2023 10:29:32 +0100
Message-Id: <20231125092938.16535-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add system-power-controller property in the bindings and
the corresponding implementation and use it where
appropriate.
Not all cases are hit yet, there has probably to be a
separate series after going through with a brush.

Andreas Kemnade (6):
  dt-bindings: mfd: ti,twl: Document system-power-controller
  twl-core: add power off implementation for twl603x
  ARM: dts: omap-embt2ws: system-power-controller for bt200
  ARM: dts: omap4-panda-common: Enable powering off the device
  mfd: twl4030-power: accept standard property for power controller
  ARM: dts: omap: gta04: standardize system-power-controller

 .../devicetree/bindings/mfd/ti,twl.yaml       |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi    |  2 +-
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  |  1 +
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  |  1 +
 drivers/mfd/twl-core.c                        | 34 +++++++++++++++++++
 drivers/mfd/twl4030-power.c                   |  3 ++
 include/linux/mfd/twl.h                       |  1 +
 7 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.39.2


