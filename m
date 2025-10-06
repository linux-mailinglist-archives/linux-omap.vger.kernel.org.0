Return-Path: <linux-omap+bounces-4655-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03506BBD748
	for <lists+linux-omap@lfdr.de>; Mon, 06 Oct 2025 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0571895B5A
	for <lists+linux-omap@lfdr.de>; Mon,  6 Oct 2025 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1792F1F462C;
	Mon,  6 Oct 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Zw+fS4MR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E331F131A
	for <linux-omap@vger.kernel.org>; Mon,  6 Oct 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743335; cv=none; b=Xbb0DbBqlakb9Elu+6onWa69XHG6I0y69PDRnn6ep4RV/3WSr7m82OsZj6ADN8IJxhipapgg1jW6VkdBzSt44Vl3dkkq8FCAyExu3AXx46HEDrAHCVl0ZL6AQLUtbtvwC7U9DmdfintHR0PaXNnuJFnfD5zH9Z9qM/qprdonqe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743335; c=relaxed/simple;
	bh=2TJUfjySb4YZUCd58TZgP7GJPQnecggYuJMcLyTBYgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BHdV/wgl5OH9H5dRBgkHofYyP6nAgwlRLAqs65utEs5nfVoDgKAz4CyH7yVo8MYZeVLPu01QI2wTKkZJTadzT5/kdWVnbfcTR2Qj14xL2xmbmy05lHwZv9cDdi2QIgQJGbX1ucy7DmFaTfaN9NsawHte+DSKeVmiidiw62k/eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Zw+fS4MR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11561234a12.3
        for <linux-omap@vger.kernel.org>; Mon, 06 Oct 2025 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759743331; x=1760348131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6AqdaoZXPrDITnhyYtxNcdvaNUCH13ctl0+xFiOf1w=;
        b=Zw+fS4MRJyBM4KB383eS91O70V26lpAFvfeUyCsS7QBeG4W8jYP9gOibzCFJpGkvxe
         z2LltdBiGfNlyK0y65nZ+72k8HdSc7N8Elz6ttxAJ/TKQAq3SZ37jAbZGDTuQ3k6bysS
         TjYS65AMQip49nEFKDl81Cn3S1tZWrthph+oorW2CZ4Nv88Z4EQ92ObW4WlwHfgPc9dK
         PEgze6eETcq0hKYeSdyTU/BecMCzFNa8gb/nNdc9xUGi4NyPFGWQMPj0SehfM+YPd9+n
         PwoRplqsw/CPQD/+d9APpj/XM7tnIszzfmNiec9Stgr6GltPkZSFlLLtoimrOUDgAlNE
         MkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743331; x=1760348131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6AqdaoZXPrDITnhyYtxNcdvaNUCH13ctl0+xFiOf1w=;
        b=VynORwDSg2r/j5yI/kw9pB70CyjgeT6G5BJuLA5ugojMFan5Whg+tK11wOZpehaJ+5
         WARyT8d0RYuf+76hv3iPWjPbG3KWXzSBj9IP/zxQbZfr4sX4SRtBkBPASqzoPSWnxB0s
         eFVX8cMUQTYtmmv7Lk4krkhbI/9pWbqMvB6ojVP/q5cWuA1rVoaKN+bTz9NFMWelXw+W
         xG9gWzzAJQU4CNDmBC0b0xQtc/iJ4hZgpLNjM9Q+VgNqNb/yZwQPTqq5O5QzLqfH0q9g
         Cg9PAnphwMj82TQhHrWEaVHmXglwzaf48v3x5j+spBYc9+AoiMwUs+NFH1qovZfzRPsk
         bEzA==
X-Gm-Message-State: AOJu0YyO5A6Pm70IihXrmoSZBgGqq6ZjZnGu0/OKPyLntzu29YwVUsyH
	2tkAUYWWhX9ljlCdoszIT3ZdKq8vqs5FDlmpsMmvKaHZVL1m2wCFcHRJ
X-Gm-Gg: ASbGncuH5NVCg3xYUSu/duspTqD8RjM6gyIeSyocMamFLJBAbPwnJ8COpknL7HfpPcG
	RP1W98bL7x7IlLGo8B34cVsH4yChOsLC/1wiuE/MuPifefCge0JKc5ZaBWcIq5pi5iTYEpQ0qvJ
	gmY+zkZp/SxXhIhayO9ZUeUe9KKLePat75V5ZBBK3yxpilW8PS/Spl09BG1WFaCAqZkTEitB2t8
	HmS33W3EbxUmg3KKZRmVJrCnETuRkEQZxL+DH9INVKOSZmA/xU5JT/BIDnTDJv8dr15iscIUbTT
	kmXnWa9J4JsclQNZS34aVZN6paBr4zU6+SrV61nKRk+R/z3JP4oZtzbdh7zmjbq24YWbhzMZ2B6
	byh8pMMfBjciXBeEyxLNQZHeflRDIkpBa5xeIKTt90uPke75FQjJz37v7rezTCnZC0xNal7dbOi
	spI3U7zAdEW/Gw4YaoAwkr4Bsi9k8rCrhuBEvXiQ==
X-Google-Smtp-Source: AGHT+IHWpv7Wht2VS4TzuT2fp0+Kf65+amyLNs6YlnRTJHV3prWTZi1zk2GnRQ2EqJuhQDSO+45SCw==
X-Received: by 2002:a17:907:868d:b0:b2e:6b3b:fbe7 with SMTP id a640c23a62f3a-b49be9906f3mr1565134166b.0.1759743331109;
        Mon, 06 Oct 2025 02:35:31 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a174a6dsm1109176866b.90.2025.10.06.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:35:30 -0700 (PDT)
From: yegorslists@googlemail.com
To: devicetree@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: omap: rework Baltos LED nodes
Date: Mon,  6 Oct 2025 11:35:17 +0200
Message-Id: <20251006093517.3075431-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yegor Yefremov <yegorslists@googlemail.com>

Add labels to the Baltos LED nodes.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
index 049fd8e1b40f..ed194469973e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi
@@ -17,18 +17,18 @@ leds {
 
 		compatible = "gpio-leds";
 
-		led-power {
+		led_power: led-power {
 			label = "onrisc:red:power";
 			linux,default-trigger = "default-on";
 			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 		};
-		led-wlan {
+		led_wlan: led-wlan {
 			label = "onrisc:blue:wlan";
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-		led-app {
+		led_app: led-app {
 			label = "onrisc:green:app";
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.34.1


