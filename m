Return-Path: <linux-omap+bounces-4607-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94466B494EF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 18:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F63166758
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 16:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDD230AD13;
	Mon,  8 Sep 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jljl7C8b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB81FF603;
	Mon,  8 Sep 2025 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348285; cv=none; b=MRgxz8UC9+Tq+GfSeM+b1rTeyZBdRMCz0we0OxXZ23JJx1gUHsZpiKrBjHl4UrlLtr0Pwenb2pTfavx0UWnbU0LVd6avuHmI9b5MHj5pbAVmLIRsXQzGVqFJAD4XKSztkC2ETTKszihYMpvkot3ohlzl7xOsHqwV+ODjdINaFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348285; c=relaxed/simple;
	bh=XQkRuspCAyhlzEezvQxQJc8RsyBV/8wDg/GiB18aN9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IwkXIf43axyJ6+pKx/qV+BZukxYRn1sdb0xHROpw6r1xd9/w1vlv4U7PAGWYztGKgr0VEPRMElBQDjzSXoa+6Z8T2PgAUHYnDCPPHEk6jeQPVYN5eZrXpSr1pOTR7vIL92fD5wn8EdOp0gFFawGOmyfAiR4pqUuC9zEIDx73BIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jljl7C8b; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso4833983b3a.0;
        Mon, 08 Sep 2025 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757348283; x=1757953083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0aBLsq/3b0fwKdZ9I6wAVIlndmJr43Y7H1HsWZThJ0=;
        b=Jljl7C8bNifAysYGOTUvsBb7Gu9VcfC28aLYHXt4oLxPx2nDecJLp/41yKt134xBxl
         137NGX1VRdQIjli/AJ744XWAdowyVdHaLzXKSz6+Q7Dl2epI7dmLJMzYhkKG4wvHSZM6
         V6GC4/4cLGj0x9Bvk9rbiF/OHCOrUxC77JpDkCcs+S9Jx+s73Vy4Xo8H0KDfZ9Hw9CS+
         IqRQ3XYmua+rcZCCVB4PtyRqE6I2+K0QJkHq3K3os6gg72LsYPaasC1cC2EpaCKeFcpw
         0Qh4HlRnKQqgom/499aivAW/hPPTxLF+TCobjZIO4KrP1dOw+lvlok1Lr39TuOMzDLRV
         U7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348283; x=1757953083;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0aBLsq/3b0fwKdZ9I6wAVIlndmJr43Y7H1HsWZThJ0=;
        b=YWWMXQZhPsaT332aaHK1UWqlhFl76fjIgNqJDOJehlqrvXhRkDNYnPqMidMoLvnajs
         4k53XLRPIcxQ31Qs4YwDF9m9Jr7Os1+X2y+yD1719WzOXjJU5GHStB0NyaKLd74iAiuE
         TWV45EgJ+GAuoJj9jd4EDWAfQ4KW+ioxbR2zLtgEpNyI5OcSMa6z/ok/q07/lUPLOYa3
         nOnq54h9/SW7RgMijJqRXU7NsV47LhB8dBABKyw+cxltVDlqbw3IATCEbQPoPN06CQrO
         xajT2zYWMmtJYlYXBlHxXv9o3cyLlCnC6yFaX062nTQVG4xZdGPmwDPAY97JH/ExNOfz
         g8GA==
X-Forwarded-Encrypted: i=1; AJvYcCVlBghh0GzRCRKswl4LuTQ1ox74j2cZGut5yly5PHcmAMrFG4ek+KVMzaL0kkQaNJtCaggwFdbiVxdT@vger.kernel.org, AJvYcCWceaKOhO0m/u3vt/dpyQWSSRFivI4IgNKBIz9JFycmGFuBiPBWXKkSHe8aWZXc6tcV7u4rpaNWz275Pw==@vger.kernel.org, AJvYcCXEfUuntR6LHKC/UsqdJKeiGi4xc5dQkOTMD0HA9qEDfyFYfYf9Wyw5kSJJ6Wgfd5I6Lcq9kOVf0kdg9JaH@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRdZq/t5mPqLgskTjMXhs5EVAABWSBoEordlitQpvMhdkh5do
	OOxpghq7e5YuNSwcU7pmI0RpktfmcZPCj9b2fCbzdR2iTqMFGWBjjHrP
X-Gm-Gg: ASbGncuzeua//+m/JCvtuN01Z5jURTs9pvEuO2aXHJ/laHaCeJd+I2XFEphiaWu998B
	ANeO+FlWtYvNrLCylaXRsrdNP+541dlmk9Sawva7G+BRSqtG7AWVGCi5ChpkTiHseLSdDZLJodl
	X4Z7rxhufKCrFg7PzT6jtX4SL2q3uv9wEefuOyaTO5z6GecpE4k6PljgQD87MaQzELtNWvRM+A2
	puymn9yVL6MTgOsJUL3KXAbE+rxn49XwC6Vgd4JKbBFytBYq5WRfBReyZNg9/dMgQen65SP89bE
	EUMvc5VLxsxDflT11nRfgqwF3jiT5OW2sJt6kJQTi7fCZQVdeVPN3WrGyXeDHQtDXY45xA6J1s1
	5X06arer/aGWAuDeRkTQDq5E7+3Q5/rVhQ9OsP3xhTX0=
X-Google-Smtp-Source: AGHT+IGe8tzLNm/C90zqcpyksvPfX9iatkJnuAyTAPudwRK+882rKDeTb49h9eeiA1rjiz+tlTUuKQ==
X-Received: by 2002:a05:6a00:1915:b0:772:5fad:e6d7 with SMTP id d2e1a72fcca58-7742df53ebamr12265858b3a.32.1757348282963;
        Mon, 08 Sep 2025 09:18:02 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.158.204])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-772608b1b5asm21319074b3a.46.2025.09.08.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:18:02 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
Date: Mon, 08 Sep 2025 16:17:11 +0000
Message-Id: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcBv2gC/13MQQqDMBCF4avIrDsliY1RV71HcRHiqAPVSCKhR
 bx7U+mqy//B+3aIFJgitMUOgRJH9ksOdSnATXYZCbnPDUooLbRscGOM/eQY/WxXbIQZ6psZjC4
 F5M8aaODX6T263BPHzYf3ySf5XX+SKv+kJFFi1WhXEVlnTH0fZ8vPq/MzdMdxfACxPtSDqgAAA
 A==
X-Change-ID: 20250519-ti-sdhci-omap-907f847f7530
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Create a YAML binding for ti,omap2430-sdhci and drop unnecessary or
unused properties from the DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Changed MAINTAINERS to "Kishon Vijay Abraham".
- Renamed the YAML file name to "ti,omap2430-sdhci.yaml" from
  "sdhci-omap.yaml".
- Dropped unnecessary or unused properties from DTS and made these
  changes as a seperate commit as there is no user of it.
- Removed previously defined properties like ti,needs-special-reset,
  ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the YAML.
- Changed the commit message to elaborate the reasons for modifications.
- Removed the pattern property for pinctrl and redefined it in a regular format.
- Modified the description of the property "clock-frequency".
- Changed the subject line for the binding patch.
- Link to v1: https://lore.kernel.org/r/20250523-ti-sdhci-omap-v1-1-695c6eeac778@gmail.com

---
Charan Pedumuru (2):
      arm: dts: ti: omap: Drop unnecessary or unused properties
      dt-bindings: mmc: sdhci-omap: convert to DT schema

 .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 ------
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 152 +++++++++++++++++++++
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |   1 -
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              |   1 -
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |   1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |   2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   1 -
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |   5 -
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |   5 -
 11 files changed, 152 insertions(+), 63 deletions(-)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250519-ti-sdhci-omap-907f847f7530

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


