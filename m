Return-Path: <linux-omap+bounces-1392-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7258C9970
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 09:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CED1A1C211C0
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8951B960;
	Mon, 20 May 2024 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PopMMAVy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FB1B813
	for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190886; cv=none; b=pcRc02PmmrlGXecrrnwW5m6zPVFpIV7wp0gy/jvnM2Oi9XmvRsJ2wbd0ApoN7ic/ap/RRUHaHk8gZniqq25HEjwfBXfTDvBW3HPy/Bs9G3zYThu8xKegHH3yKvD2k6YuYlNXmlLG07y83Z1YUJY+xLlXalH6T+TWDV3wA9ia62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190886; c=relaxed/simple;
	bh=plzvp7rNugX3K6ANyXjr92sRX1YWIuJEC3UHm68SOb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CVKy7oeH0YWcVD34lSutGyL1J+EjxgdvC8yzp9Yf+3uSeACQp5DZxi9dlwUeXwqELFzurBD2a/sqKT7tdn9D6TkGuW7xP/ifj7PGTCVaNXETdvnzaJ63b3oJRfCCI0YcFVgHZVariEUy7ARkFslLKXgkd/KIofJw+M0wuN7Z67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PopMMAVy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a599a298990so743899466b.2
        for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190883; x=1716795683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y2+R5Z+lMlXgJtdu7Zc9o7DnmU5CSj/l6XtGSHRsxY=;
        b=PopMMAVyZIXgyz5xm/mDb3uJeyXYybjA4txKywJB7MaIZDlwvt7R53tzFR5qZhuvQX
         NdiJpoD7UM7DFTu3sZNoEd7g3/hJUOoBD/HCx0wHV0T/O0egtl24CAk9byQPvzE+L3+6
         cxtmsXoBqQDGLveolFYZvOiLDVFCrmD2Ez+QgeqjMIn5KOUEcwXX4oxoU2wj7wdvCOwE
         03GkKcafd5pk9pfKTXZr01s12MqW7gUzznAlv2M1npuZ4XtDaa0fHpsETS3CNEiDlGtj
         PZoJFRCbLhPqwV5bxfXULmt7bz9yLs/eiFbxKg6RWn+djnKBSLGfGf80eGBcJ+/p5RLZ
         nS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190883; x=1716795683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2+R5Z+lMlXgJtdu7Zc9o7DnmU5CSj/l6XtGSHRsxY=;
        b=fsj/iZ8rfxwF9lHAE+CI/kMQGgbOr2n+NR3C0HQErJgsBx845hymV1gWIdfnCnI4/+
         ZqPvVcg0EkmjIucTmKG2wWtoMgaIEZkJyETrmwScvpOvQ4pqrnyfZ8EdFdJtCw94XCnk
         tLFXOjyaYubHMaIvf2YpzFug/+rsh2OEIicPHjaOMsprRzdHax5kvadJiiQqKNHmczcT
         ggtjoo6ICwGTd4Tsn5w1ZgObUmR8wfGergnChL07TxfB9QHLYv3bC5QbFO1S5cehnzJe
         sdqCvpixYehRfIGNpyvd35cCxxex/kjGnk89e7m7o1Xbi9eGCTXXhK1k7GvXc5Ehr67G
         trtw==
X-Forwarded-Encrypted: i=1; AJvYcCXWnSlm5LQ32XK/t+LGBQ/4uTozj3UeaKVItMWfKPRMSX9sb2Ski4zGv7fr3Vl4+kLJVzWeAyOGhbhoVz9WG731ta6BGqotb/NEJQ==
X-Gm-Message-State: AOJu0YzCSb2qjm6vYWcJBtTdelILF4tNDZj2EqcXmdFvqUQIzaOZNsxy
	CZKdemRr1A3qX4p9ndpIav9xicGMCevOVDW0d34pIl88cnZ9bEtaU2V3QYInf5A=
X-Google-Smtp-Source: AGHT+IH9haA9iR4YwoKX0PzjzpCIy5yTTINDqwVFObjzHq50kZ9iLXtPJQM9TPGv9QNsFnHhLLi5EQ==
X-Received: by 2002:a17:906:6a02:b0:a5a:7c7e:a0d3 with SMTP id a640c23a62f3a-a5a7c7ea16fmr1445195766b.44.1716190883404;
        Mon, 20 May 2024 00:41:23 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a893a91b9sm754853166b.7.2024.05.20.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:41:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] =?UTF-8?q?ti:=20omap:=20MAINTAINERS:=20move=20Beno?= =?UTF-8?q?=C3=AEt=20Cousson=20to=20CREDITS?=
Date: Mon, 20 May 2024 09:40:12 +0200
Message-ID: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last email from Benoît Cousson was in 2014 [1], so remove him from
maintainers of the TI OMAP platform.  Stale maintainer entries hide
information whether subsystem needs help, has a bus-factor or is even
orphaned.

Benoît Cousson, thank you for TI OMAP contributions and maintenance.

[1] https://lore.kernel.org/all/?q=f%3Abcousson%40baylibre.com

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 5 +++++
 MAINTAINERS | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 0107047f807b..ea84fb373310 100644
--- a/CREDITS
+++ b/CREDITS
@@ -796,6 +796,11 @@ E: luisfcorreia@gmail.com
 D: Ralink rt2x00 WLAN driver
 S: Belas, Portugal
 
+N: Benoît Cousson
+E: bcousson@baylibre.com
+D: TI OMAP Devicetree platforms
+D: TI OMAP HWMOD boards
+
 N: Alan Cox
 W: http://www.linux.org.uk/diary/
 D: Linux Networking (0.99.10->2.0.29)
diff --git a/MAINTAINERS b/MAINTAINERS
index a482f2a499e4..8193bd95c84c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16147,7 +16147,6 @@ S:	Maintained
 F:	arch/arm/*omap*/*clock*
 
 OMAP DEVICE TREE SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 L:	devicetree@vger.kernel.org
@@ -16202,7 +16201,6 @@ S:	Maintained
 F:	arch/arm/mach-omap2/omap_hwmod*data*
 
 OMAP HWMOD SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Paul Walmsley <paul@pwsan.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-- 
2.43.0


