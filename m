Return-Path: <linux-omap+bounces-2524-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADD9B6CF6
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 239B91C21385
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4111D07BE;
	Wed, 30 Oct 2024 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMiNnWoz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF41CC15E;
	Wed, 30 Oct 2024 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317309; cv=none; b=VDQRFdnETLaU7GXAmwYNPcmY1c6PhIUkyL5/4KnhOzPeuD4RUp3kZuTG+I1cHVFL1rMbfSdfNNtmtqFVInRHepMZNFos4VLwgTdTDdeqzuoE9d05xVh1iFyGQVvFxyx5doDN7VkK8t+WHj0DG7lGg0WneQwE00Iqvmm2NSC+r1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317309; c=relaxed/simple;
	bh=QyyXCT41qA3LZf2ziL2OqlGQHNXcnpaiwKt53EuLvPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E5heWzzwTw+OPA0VjwiibxRb0k8mKATlLlNUvPr/dZX5eW7Up4IaMm5roGIqNh2xBFYwHY9lk2BXduChrxbBs5a38W+gVrlZjdzJdSNOG54TcNHdMyDFdJlCfL6m1M9WiqS/Jk8erLAtUqJWXhne8EuqsBIceexJSaOOHXmjJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMiNnWoz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so237591a12.1;
        Wed, 30 Oct 2024 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317307; x=1730922107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Mq1E3GeorjkVFB2zE9SVG0vN1V6QXUWzip2czeon4=;
        b=AMiNnWozh92e3QsDDFe4HpFj1fnnTzz6qA2St/VNi9Fbp628kbVqV0BjxffMYa9mlk
         dwoF7VOIJ2JrOTlubONUHB9AQoMS9U7friKSfovR+wgnmYXMMUdy4CtzAeb0KmPy7QfR
         s1jIo786Q3e67lAHJ9pmkfP7A3ZfAsFD5wOrj6g8h7Z/muI0kHgkQ67R+lu5b6gtqUFF
         RljWkobi3BZ8tSYD+K34OfxGSpXv9PLwH7MwjJ23p2MyGsvU5P9BmtlR6bT5BbAMGdFw
         g5Sw+fdnHcMr4hLD+5ygpA0hE2ExJ10b1z1syWH7bycLLP+1b8YlCDjCph+hu0ksr1Ug
         T18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317307; x=1730922107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6Mq1E3GeorjkVFB2zE9SVG0vN1V6QXUWzip2czeon4=;
        b=ewFijLJJmB9cbzdKXlrLcLMiis3H5Jf1U/R8a0/kbLwA77onI3DgYInagpRQ4ZmTC3
         TcsX4NYtKIfR544Gv/eFDlACM0ULGBzbZJRih1rN7EdaXjqDHuzDz4NLnDJHx7ZCG8Vy
         NZjYoEmMQYAlW/xRwskYhh7GdkcwdHGSXKttZ97d5fyZMDklU95K3ExFnwOJO9hWI6nP
         OkZHpPMMoern4uCGJbxWnWENSEx+WZ6ld6xEGCYq9rJgXJHc1WZ1q9MbKp9Gq4VOmL0R
         vJkYnzWpioAeaqSxH7o/Xj7B0iqEjfZ6bP1XA3UwoPCi3eFtqP3ONKv9KI8bmxaoeKkh
         q5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHyi9qW8eOliwHTOHL7zkRb7Bv3uiFGOfVH6yLJ6aHopqYJFsRxv6oAKBZcm4bQOyaTYW3tRjsAYOGueHw@vger.kernel.org, AJvYcCVbQce3HMksUtI1dYmTIGlphg5z+A2OIkRx+aYRvb6JCPsNX8V6T3GNDfL37IWI3B6YMbZS5DQL44DN@vger.kernel.org, AJvYcCW+Dau9O3F/iLWWVqrd7qqjQ/1x4dL4QmIE2e4DmyiFP2Sk5ADaafs/tF1M1nf/vMrn2QUOglz65hZ9GOtuhWfg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0M4L6ujAe2B1AcTcSdIbfSp1iHYQMDvDTNJ/DLE+zDQgioO4O
	/7yCFi7r6py1OkidjJ15v0LVbWHrjnjlfdrhbC7IzeLxOTmiM4YH
X-Google-Smtp-Source: AGHT+IGWRLurFAS1GEs4cN/M23SyTKcVagRloCnXPqOS0SLInbz0+q2OETOPjDJFJBhbKgtVBoDkSw==
X-Received: by 2002:a05:6a21:168e:b0:1d9:215c:c641 with SMTP id adf61e73a8af0-1db91e82758mr606830637.48.1730317306854;
        Wed, 30 Oct 2024 12:41:46 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:41:46 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v1 0/6] Initial support for Samsung Galaxy Tab 2 series
Date: Wed, 30 Oct 2024 19:41:30 +0000
Message-ID: <20241030194136.297648-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso*) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Mithil Bavishi (6):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
  arm/dts: Add initial support for Galaxy Tab 2 7.0
  dt-bindings: omap: Add Samaung Galaxy Tab 2 10.1
  arm/dts: Add initial support for Galaxy Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 694 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  81 ++
 6 files changed, 951 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0


