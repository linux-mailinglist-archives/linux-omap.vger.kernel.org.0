Return-Path: <linux-omap+bounces-24-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B557F89B7
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406AC1C20B3D
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B351CC15D;
	Sat, 25 Nov 2023 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="CiNetAUF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5627210C1;
	Sat, 25 Nov 2023 01:43:16 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 1A21760BB9;
	Sat, 25 Nov 2023 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1700905394;
	bh=nu8DlRfSh19BEy3+xZ6QoXfOgj8GOAKGuiI6HaNBMnc=;
	h=From:To:Cc:Subject:Date:From;
	b=CiNetAUFK2gMTMV2Jda2dgioegd8dKUhdRrSWCIHVAElR0cU3sAXszCQTXW4hA93L
	 Cxx5Pp75A8g1/USIuxkI5D66GbKPVUarJ5e1E0e/O0awzDcmAb0UPVLFxIFMWyPm/J
	 dPjuZhApzxyuKzlRr8JptKKIQPX4l8GDJxvXerNdEA7b9LEdfEwbEq9qiHgvh6Wv4K
	 jMY2Cg7BecibRyiDTFc8mh2McRgXoY3QQabw5U01+v1HE+mc16XEAYbjzw+o/xVB96
	 s3BwSYWQ4Axs03yArNorMiej+qRreEJP2PYpf5iSh0HuJW0DVcmZbc07UDg2ZZrQAJ
	 43h+iumZMQS2g==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Merlijn Wajer <merlijn@wizzup.org>,
	Pavel Machek <pavel@ucw.cz>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: omap: Add Motorola mapphone mz609 and mz617 tablets
Date: Sat, 25 Nov 2023 11:42:45 +0200
Message-ID: <20231125094248.43537-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's add compatibles for some xyboard tablets, these are similar to
the mapphone devices already listed but with different peripherals.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -134,6 +134,8 @@ properties:
               - amazon,omap4-kc1        # Amazon Kindle Fire (first generation)
               - motorola,droid4         # Motorola Droid 4 XT894
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
+              - motorola,xyboard-mz609
+              - motorola,xyboard-mz617
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.42.1

