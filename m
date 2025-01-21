Return-Path: <linux-omap+bounces-3149-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBAA185F3
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 21:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8411626E2
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 20:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D41E1A2550;
	Tue, 21 Jan 2025 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="pk4a1gLG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6191F4725
	for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2025 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737490075; cv=none; b=DdRGtgmGwq+3N3V441m9y2WHfdpojv4dkgwUSNfx/Zz9gpiWBrUuuiOp3YvDF3yELOyG0BxDBIzL5LShUhwxOE2QJQ3VTwbNIVSavQwZ5BZSbVBftj/IArcfn71l0xApwqFULzkAwXWDwWb+h9W63RH1kWuByQsn77JubJvtxsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737490075; c=relaxed/simple;
	bh=PUOAGcT0dyG4IZIati9P8GoHCBztzTSTao01uprfr10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuYtLR6pLugmwmzGKCSjjjfvcpOtaA66Xdh79XBO/yfG1n+qouReHP7I3DzyHKqVeuhOp88VqnQ7WA3QdPYxCeTMKoctwm2+vhCVK8vnfEWNHOtm1BMyPMJzFqr9l7q0IYRF9leV4QBvlt94WXvivpr7g9KAE52fn0evGY/vJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=pk4a1gLG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46c8474d8f6so51429691cf.3
        for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2025 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737490072; x=1738094872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHb8pLXAEr3dsbwFJWVMWiMHmvwzjso8BNDm/ju1iH4=;
        b=pk4a1gLGscyxNfOReju1oN73gFip86igJObullgboI7w2wPHrhojIpKR+bFirjFRNL
         z0pmm2ruzOHpTSBEp0/kXbAeMEwnhoauCdXgKQzJbIarihSXpxXUiAAvzhu8iTgVdxhR
         9BTD0eP1w1EJ1lf5Mqo34BrEkgJM+P0mF7IZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737490072; x=1738094872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHb8pLXAEr3dsbwFJWVMWiMHmvwzjso8BNDm/ju1iH4=;
        b=tX3CGWi36nrlFicva2mELQPUAHKAA6RKDrVxgGwRlmS1XltP20IzZyAXk9F8MhNog7
         7w16aBofcOmrrvcQn8q8Bum5IJ2LW3c7i2q+YnXlTW7cGTNGr+BwPm5DVT96F3FnvGDh
         FmCG+ofzC3Vz7nUbRuMb9IvLD3JcsR+ppQaQGYBRVEYFVQxDqTl5Nuenv8ZakXK8JMLy
         dfm4Unw0oBowIq86lkcPTYfsutaL6mg9W03SsFc2OPr9ci6QVAaB3/n2dLZPnGTaUvkN
         F7bYygPyQ8x2xPMye67+hoZKPNzKoLlAK1S+02aQrFJkB3KLIX04RSoHrwM/vFLo9L98
         4dzw==
X-Forwarded-Encrypted: i=1; AJvYcCUYTzD3xD55damIYEOCBqHFIzFzPvedz1OiuvF4wOFN07g32J7JtWjPZXISgOg2OOnozolCNqBDwrIy@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDi6mX9999xXUb0Py+W8/oo4J7WoO0faWP5452iNGi4SpDJZ0
	0dkGkAujFh5QmA9Kfu7jdzYMNP+eTwr1Qv6n0tF02WZUkn9xZ6F8aRyf8vOtxx4=
X-Gm-Gg: ASbGncuK/9MEG6Hp5QPekjsVTLIqnSF5agc0xIouEzLBaMzG0Kdk3I6yWeL8/aqWyBm
	M9ozk9y6GDTG+bGB+9slMbj+8bQVs/27jZl1mIwJVUdjsul4w9Ni+0CMoqVr61vXs1+7YxnHynY
	qO+iYBiNzQuSge6whH0H9uEfDwej9e6RxwUaGYXkI7av1TKsOJyGn1Ti7qtNX+sLkdZXbcujEAy
	N70b1VRckFwK7WL2dmfmblGoZYGBUkfwylomyi1WZm+c3hCZv5UYA5M2XbMw5hU1USv/LxMyT0o
	BNtWSHBmy7gYCg==
X-Google-Smtp-Source: AGHT+IGIyzj+IsxFlYpz9XLDsiuK8SFY5lQ4z1aUa9MQiGkatYxr9CmhFXBBhEteoCIRhm9ZWdNStA==
X-Received: by 2002:a05:622a:1820:b0:467:7ff3:e4bf with SMTP id d75a77b69052e-46e12bb505emr238001681cf.51.1737490072102;
        Tue, 21 Jan 2025 12:07:52 -0800 (PST)
Received: from bill-the-cat.tail58a08.ts.net ([187.144.16.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1cc9e8b54sm30977026d6.86.2025.01.21.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 12:07:51 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
Date: Tue, 21 Jan 2025 14:07:49 -0600
Message-ID: <20250121200749.4131923-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When moving the model and compatible properties out of the common
Pandaboard files and in to the specific boards, the omap4-panda-a4
file wasn't updated as well and so has lacked a model and compatible
entry ever since.

Fixes: a1a57abaaf82 ("ARM: dts: omap4-panda: Fix model and SoC family details")
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Given how long this has been broken it's entirely plausible no a4
hardware even exists anymore and so dropping this file instead makes
sense. I only found this because scripts/make_fit.py crashed on these
properties being missing.

Cc: Nishanth Menon <nm@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
index 8fd076e5d1b0..4b8bfd0188ad 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
@@ -7,6 +7,11 @@
 #include "omap443x.dtsi"
 #include "omap4-panda-common.dtsi"
 
+/ {
+	model = "TI OMAP4 PandaBoard (A4)";
+	compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430", "ti,omap4";
+};
+
 /* Pandaboard Rev A4+ have external pullups on SCL & SDA */
 &dss_hdmi_pins {
 	pinctrl-single,pins = <
-- 
2.43.0


