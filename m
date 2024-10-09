Return-Path: <linux-omap+bounces-2360-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B1996B98
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 15:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3A41C21C76
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E4F19882B;
	Wed,  9 Oct 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWGf5rN8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E741EA91;
	Wed,  9 Oct 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479824; cv=none; b=jRLlZecxpr59GtlHcVFnm0zQuyJzs8KPL9BM5jaW/2PV5ZBf/CKtEPb9zpQF39JZ8zcGMN+REfq9bxzpwcsIxyY4m21ica6stZmhb/fjOCnPx+lfAgg1MyLTmOv9GOCSKnwXrQRkPj/tsP7mRs7zfkqJjT65U40Waycbj+IGyHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479824; c=relaxed/simple;
	bh=15x/+FMGXUcFomaVnMGSGRlOvKd4j6pe8/eextobHto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J9F877A4UhJ8KzLq1JFY6RXHRYr2bfxoM9YI9oNIwmcedihBbrmu1d6yLH8BY/XLg9bMLcIq34AzSBvnhcRr+LLdGkr8eNicvjqWIPsjJrFcCab/KbL9tQmoO0vylD3F2G6fK0z3EqzKVJkgBQ36rk5Rc0mHYXPbovluxDuW0l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWGf5rN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADD1C4CEC5;
	Wed,  9 Oct 2024 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728479824;
	bh=15x/+FMGXUcFomaVnMGSGRlOvKd4j6pe8/eextobHto=;
	h=From:Subject:Date:To:Cc:From;
	b=VWGf5rN85ltPidhUpERNEE94C4YMkO+NeYSpvoPI/3yK4YvLueXeQr4njhX75Tqeu
	 I+Jqp2e4woFmB0OeNkMY2yvm6j/sFv7vZn5gqYOlrSNTEv/1WTJLOjfv0PjJvLmF2B
	 kOmWb/0RBGWNsCi/vWMuIKyguMZjjNh56Meja+lWAv32s9xKxU8l0P78NzwEYRiQ3x
	 uFX6sODGgU8QND3YJ9Xl0/2jxx6p9vhKjOHCMtep06jWSlK11MsWZedSiPAsEIIOkG
	 WePWeoLCn+QYLpis10gD1/ULNhtsJ33vzI6HR8S+VURxPWoB8x8n2Ln775Sooz8gIf
	 xOC9v/jsf31qw==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 0/3] ARM: dts: ti: omap: fix dtbs_check warnings for
 ti,gpmc-nand and ti,gpmc-onenend
Date: Wed, 09 Oct 2024 16:16:53 +0300
Message-Id: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWCBmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNj3fSC3GTd/NzEAt2UkqQK3RQTo0TDNBNDE4sUcyWgpoKi1LTMCrC
 B0bG1tQAIRXDuYAAAAA==
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=15x/+FMGXUcFomaVnMGSGRlOvKd4j6pe8/eextobHto=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnBoJJhqm3Dpfd2FzB364cRb9TQiwZgsBmLExPm
 l3/GPIqBZ6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZwaCSQAKCRDSWmvTvnYw
 k1BDD/wK0hVB8aXESRy07I8QhQcEWe0xEhVB9KBqQW99BKQwz7rRYYlF4/V+Vl3csN/MLz/zoxT
 iNw47E94uWZu3Gn6ljMm7L1eiNtjEIvgfZrw+uE3SImFvmu1zPmVQR7JUVATngRQnR9NQWw46GQ
 tymFgTbJsmY/MIdBtG+lH0sx5Xwu4IxWaH2PqmajCSVWETGUsdjiZ7aLqLNHOoBRQg5IOENNqbr
 8u8j52mO/z091gyULGZc804av0geJouw2TuqphznA4mTqMrf8k60bkEfMFU0bGD5JUJeTQVcfrX
 t4DOTTH4h1OI6uTA8mQu4I35yneSHTWBwjtMHrpQqyjxUutD3/bXW1mFm4K4btnl/fb+eaDT8nE
 hxa5VqZK0oC+VTUIHjd72jsYtu9JZPjXZCqs73erfF5uPmcAtrZmSFW5GX/Bmc6NBauWP1FrSek
 oV614v0XdMIRib88RWScnRj5shm+/zYUlLwbSkt107qwikJ1PD9cyEtem1BVKWzq8Yme2cT3a4t
 3UdbCsBvfSNXPkRmEohne8GsvP9tAkGi6kAWWr+slK6hsUIKg7JiqbaVq8c/aU/L+w2hAmhOIjl
 OMUyWsT8NLdB7QE8l1+ACYNga7cA2Yjtt9JYIswtkZA9YMP+Nftm2NNW7tU8AX1+OR+4KTL7oGL
 WAihxejh9scvrRQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

This series fixes dtbs_check warnings on OMAP platforms
for ti,gpmc-nand and ti,gpmc-onenand.

The following warnings are fixed
- "nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"
- "nand@0,0: Unevaluated properties are not allowed ('gpmc,device-nand' was unexpected)"
- "omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v2:
- Rebased on v6.12-rc1
- Link to v1: https://lore.kernel.org/r/20240903-gpmc-dtb-v1-0-380952952e34@kernel.org

---
Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       | 1 -
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    | 1 -
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         | 2 --
 13 files changed, 14 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20240903-gpmc-omap-dtbx-d42a1f4148d7

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


