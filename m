Return-Path: <linux-omap+bounces-4882-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB10C42B52
	for <lists+linux-omap@lfdr.de>; Sat, 08 Nov 2025 11:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 549794E37A5
	for <lists+linux-omap@lfdr.de>; Sat,  8 Nov 2025 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95642FC892;
	Sat,  8 Nov 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCOJkNNa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB341C63
	for <linux-omap@vger.kernel.org>; Sat,  8 Nov 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762597704; cv=none; b=JqJo4RSxNoHkPRQOPvyQuR0cDE7itsD4wRFV1llpElTHskaBKoNYRZXytfApdpt0WJBpcGeVOf7ywbb6J+1rBeRpKTf1YMQdkbOU/xc/RLK+w+0kC5vhjD1Zp4rfsqMqprnnlFe3FTnX7H0c8TvNR4DWO57Mrsq8J3al34ITNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762597704; c=relaxed/simple;
	bh=12f7GILPUkXCDP8tGHXH7ltT0vBUKfdqmW/twThO/0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HpYJNKkmkZ3F3LLtinkHPv2R9sn0iul4arsrNYfBD931rHY8lAhyO1zOdydwPAPey/St3kSia7YoJXGvi2odiRyCYpyUqb+VsIIqjTVNJrD6WTWZBMH/i5vX+YTsYP9NHv60LdM13nxA9xNVSnOrkfnwFAEMht+npObbIOV8gIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCOJkNNa; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-940d9772e28so53803739f.2
        for <linux-omap@vger.kernel.org>; Sat, 08 Nov 2025 02:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762597702; x=1763202502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+TuTLhzgnX5Pfkj0imA6DgDfaCJeQjdc19ou/wTAVkI=;
        b=dCOJkNNaj6msls4EFNBb389OxjvTww4cPtQaxayJYmZ10mxKsnqCa4CUIXDwDYOxji
         bP/3CcaggZ+ONtWlh3xO4O9iSW47cXbP3T0wBdeRZIg5/DO0XYVcO+FfGNKEITmVZV0U
         77am3M4fFIlvQEqtrzNI8gHiYjAW20us+OZL+4LHrglT6wmyN9DTvYldvpSoc9PQHM2Q
         uw+Fz5n1a+ZMrsqkblGbSj4nc2bwOruSqj9NP6nMElJ8SqTAb7qRDI8+fFcbKjFAy3On
         6XxYYO2nci8iaWqximzh6r+4Vd/sCX37qCwreYsAeDhspqhbfLL4B+SWySxNlvcgT7Bj
         Ja8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762597702; x=1763202502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TuTLhzgnX5Pfkj0imA6DgDfaCJeQjdc19ou/wTAVkI=;
        b=v89Y4YaF/LWyDlrRapug7P7gscq7eIGdDccaH3xm+ayNxD+gYb+z3QuU7pOAoz5e1S
         HOLmUv3I8tIrYrGbyJHsW/1FTRWG4a/503BAlRqKOFR+GWa0C9bLRaEbIGTvO/czkY7+
         8EAbc9MMjlcY7TLCHolOY1jDmeoBAmOKpcsJKCzX12HaNXJYV/EEWR2R2oUTXlcLKX/u
         TDUPy82NQcGGdq7clzpz+3BqF+kpt6AhCa28i4JLUS+COsbgmpde1tBW/lY/EnodgLOb
         eDZWAI3hBa5m1+cF8/CGXDH7jJBmRKjpBeK9X7V42dXtNbVN1Cw7EGsYysaXWIQ12jV9
         1Gfg==
X-Gm-Message-State: AOJu0Yy+/YK8KLwIGAVG3giRv+Y1WfvrK+tc7nVzCTdC+VELwmk4kEgQ
	Ec3eVOG0pZDi+QrefUmWZXsM6E/5+ulvy14jIZPEUG6hybJvJxGwrY38
X-Gm-Gg: ASbGncstmCuVEC/6u67ghn4iE70DLYVrYyssFoiFm2CG0lrbnT9efS9fE4f7tGbPX4c
	kA7AE3tKpV9PoQddyET0uVwZqZFN5Cn/iOE+fejcxSmK0bAP1q63qxbmnYxxgVADKfIiUwsqn4E
	VngSb5LA0XKgHN0lOUN5e8Toas8sdBjLVnMnFxwkXhguW1zBz1qVjEXdJ5e/VpxEohh68gpw5Fi
	eSmfQZHIORtyWuk78IhJu48yvqoajgi0OoQZ5pqid5Vp4UbRuJyoN65fbtyfafah1dE0d3A23My
	BZQFqDagLIjVjaxhXXv7Jw1RaDf6KbA96bxg3bRfwVYiRDh4s1E0G9KMif9Kpr5aC8pdsiOQZ9C
	Mqfyj2fcnpz9L6If3X0gZvJZldR5/m22YUeum9K5QE8Dfu/VQcSvSZV6AGHpP6otyFljKUwNm9o
	EtyTtpyVmNvY6xeQ==
X-Google-Smtp-Source: AGHT+IHJQ2fl+UoiHF4mPlmvFSjl+F0j04tbYDfTx7zB3y716ahbTwMpXNlaun5Mwk6isZ1YqsGJpA==
X-Received: by 2002:a05:6602:1609:b0:945:a16a:c7f8 with SMTP id ca18e2360f4ac-94895f98e51mr294678839f.6.1762597702060;
        Sat, 08 Nov 2025 02:28:22 -0800 (PST)
Received: from p15.. ([2600:1007:b0b8:8420:9895:3669:27c4:c1d6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b74698d5bdsm2954694173.61.2025.11.08.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 02:28:21 -0800 (PST)
From: George Kelly <george.kelly1097@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Kelly <george.kelly1097@gmail.com>
Subject: [PATCH] ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node
Date: Sat,  8 Nov 2025 05:27:41 -0500
Message-ID: <20251108102741.47628-1-george.kelly1097@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the Beaglebone capes have the Atmel AT24C256 chip (256kbit or 32kB),
the internal Beaglebone eeprom chip (i2c bus 0, addr 0x50), is an AT24C32
(32kbit or 4kB). Yet the device tree lists AT24C256 as the compatible chip
prior to this patch. You can confirm this by running
`sudo hexdump -C /sys/bus/nvmem/devices/0-00500/nvmem`. You can see the
factory data is repeated every 0x1000 addresses (every 4096 bytes or 32768
bits). This is because the read command wraps around to reading 0x0000 when
a user requests address 0x1000.

This is not a huge issue for reading, but it is for writing to the EEPROM
for two reasons:

1) If a user writes to addresses 0x1000 - 0x104e, they'll accidentally
overwrite the factory data stored at 0x0000 - 0x104e. This also is an issue
for writing to 0x2000 - 0x204e, and so on.
2) AT24C256 has 64-byte pages, but AT24C32 only has 32 byte pages. Thus, if
you attempt to write more than 32 bytes, bytes 32-64 will wrap around. This
causes your data in the actual EEPROM chip's bytes 0-32 to be overwritten by
the data in your request's bytes 32-64, while the EEPROM chip's bytes 32-64
remain 0xFF (unwritten). Lastly, the Beaglebone Black's user manual does
correctly mention that the internal EEPROM is 4kB (while capes are 32kB or
256kbit). It's just this bit of code that does not match.

Signed-off-by: George Kelly <george.kelly1097@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index ad1e60a9b6fde..73a571c135f81 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -217,7 +217,7 @@ tps: pmic@24 {
 	};

 	baseboard_eeprom: eeprom@50 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c32";
 		reg = <0x50>;
 		vcc-supply = <&ldo4_reg>;

--
2.43.0


