Return-Path: <linux-omap+bounces-4921-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD49C63DAD
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 12:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E07934EFDA7
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDB1329C79;
	Mon, 17 Nov 2025 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cNr81J7A"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3493277B1
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379345; cv=none; b=Qux+/6lwZVtiSsZRhdAlcIrN/AkECmlNBY6L3E1ZpYns9sPnxlLEw2cab9mAC3LLG/jjoOjLA/kJ3JZXAzXV0mTk12+FvvEdaeCGxlTDjiwFMlZMVdYJqO+VjhWkG7AlQLoOHzFgu5T0gdgQFaJv1QvGwEqhQK76TZQaBzL+WGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379345; c=relaxed/simple;
	bh=WiftEgWE0FulvyCc46TPvmGM7oMzkxLf3p+Eo3a2SkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1Fic34lhay01YOGlRqGpS7lsqUek8yoO4p8U5v70wX6yncOlquVkNbvRe5iqefLyXXmZH0Bkyh4hljR2GlzPBdpTEkZPL2QeXbytlmnQa9ciHfUXCyJDzfPvdocpj8hXu6OOb0lLME/T8ybPpUl53MIJj488T6QsJAiezUwQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=cNr81J7A; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b727f452fffso859138766b.1
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 03:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1763379341; x=1763984141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6j1jC1MII/GGRlA7Bj0JeQmFN1OaXZLJ06hTBOtEjEU=;
        b=cNr81J7AgbRN7nePj8ZqgiQzRTv6rVmsiQLT2LoP+Giop/oz4Jf2tQ76zNRxc5vvTl
         Oc3ThnPe3HyYskagZLyI16LrJ/MuYEb8zH3FnN2ezvINgr+2wDz/txFeEHivARCj8xYh
         jfhUh8JJ0vjB07bLNWCB7cC1dRptayEIhD65iysHG9Bn8lcuB926ELibRAHpKsSiyHTp
         q4jTm9ydy+JkO03DSu70BKcxheeUg3Qfr4oSkWCRzu9XnpG85mDL6/HS7jf0V7/O9ILl
         FHyrPHUeqyGJeCTx+9Kh4ZjqHhkEOmZhBKraE7jlC4YM0OFecF3siNqgr0wt1UjA7v8Z
         2Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379341; x=1763984141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j1jC1MII/GGRlA7Bj0JeQmFN1OaXZLJ06hTBOtEjEU=;
        b=uzEm7+yAvUU6SuB4vuxpuA4RORpHgRAQ6zojV3dKKimJfOSCT6mQ0DoSx0MgIvaYs6
         xlmoCEiZSEcbgrfXoujxFF2mV9NxCgEo7J6rLRGaglPGQYJqxAPm8dNdzPh++OESh8CY
         O12P7Q1FY0SXVsEoN1C7fTpGRKc7WFfF/VJpv/Fz40t4K+9TzCucw35FVKf195zXDtC2
         QnhS3UopDTYS2AO++52fZJkpDM+do5MuakbCU9UELObR+Ahx3ZX5U1bODOJaf+W9j+Vn
         bkqXLBUjr4AAxyrerrRrirps6W2qPEHNfrAJ43RDDztlSlUE7zkQ0VuNQKu4fe5k5HCc
         VEqw==
X-Gm-Message-State: AOJu0YxMA/YXqySF5Da8q9IZ+C3M4cVrzsfG6qTxDHoq1JNOtHblxG1F
	5MzY6eSNLVtVxILFY2NSgy1pcY8azkRpIf2lBZWIAlNnakz60F6GDy+myN5iWw==
X-Gm-Gg: ASbGncv2FspMfUT2YZ0T37m6iI0jkLgLklbAPoez/P1vEWrfmxbcP9xOID4dI9bzkyK
	9vqsDgPuLKdEFhh99KQE/LjuAOv+J+origLz8qum/rmg70zrd2y4L1tACu1tFH28U9Kx67QdkGK
	cXjgrL0haJI/IpkQtvl58IVPgYXBCfRWpGXP9q25Y+eVnw1x9HzqqWfdzg6DbbOGiLPjdpIF+8k
	1J2w7KcZSTlziVJx5trA3qe/4qvLrgZVg6TV0KR8e3TDsDYXgfTJfhp4D30ApdFN5OhqWXkGo9b
	NkCTjf6wK9X8Z5wisxYB4l81/KMEnDz3mEzEeqTEd4Va6DaPF9JdXBc4UE2Zmn32uXWijyrzIHM
	1c22MDlITMC7sCUzKvcz6L43lrz6h6Yqgi9FGJHkXjTXtXY3wkev3tp+TuORVA6gfWhCowvFIQD
	SEFgiclZ4BslIG83v0K6BjwYfXXe0eyxNdc1iUtVytn7IFf3+KomsGV3nCW43ivBCyy28=
X-Google-Smtp-Source: AGHT+IEY8/FYRH8jH1ucnj4OpkC12V//qTEWDzEyJMcYyd7FNoOoiIFBENdZdvjEr6CpKcqFcsOR4A==
X-Received: by 2002:a17:906:d553:b0:b73:28da:9ddf with SMTP id a640c23a62f3a-b734860e02cmr459509466b.25.1763379341364;
        Mon, 17 Nov 2025 03:35:41 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4c5834sm9899372a12.33.2025.11.17.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:35:40 -0800 (PST)
From: yegorslists@googlemail.com
To: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	khilman@baylibre.com,
	rogerq@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: omap: enable panic-indicator option
Date: Mon, 17 Nov 2025 12:35:35 +0100
Message-Id: <20251117113535.2248177-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yegor Yefremov <yegorslists@googlemail.com>

Use onrisc:red:power as a panic indicator.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
index ed194469973e..a827153ba6bb 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
@@ -22,6 +22,7 @@ led_power: led-power {
 			linux,default-trigger = "default-on";
 			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
+			panic-indicator;
 		};
 		led_wlan: led-wlan {
 			label = "onrisc:blue:wlan";
-- 
2.34.1


