Return-Path: <linux-omap+bounces-4923-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A19C65852
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09C884F1523
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 17:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD862C08B6;
	Mon, 17 Nov 2025 17:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WbhsoTHo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4815D231A23
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400469; cv=none; b=L4ByOutemh81V5CqnuHGH7zDpQl1WS2HuZA5Hmkx1qNI0z4tpBX86xAxzdiv1mEo8Be0oT36DoTUvQ+G7WT4SbdCeYH1sb57kUpZfBpdppBRo3g11KQPAOFUfiFItvnnOgjB/RUnGBd8shG1xpeh20hrGRlcF8h8RlnzHj/tJfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400469; c=relaxed/simple;
	bh=UmV7RW5IQZdRVOg4be1QC5nZUt+u8Cdv2Acy59rYwo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ihCDel6WlfpX3VsP4gbZe68zi5wjnVH9e2mHSWrPBylyYTQJ1d1H3r0P+XLaHgRweaC70mJt6HlJq6f9Xhn/Qjt/pitVWNxQzW1vBJPRHMfwPUqdCW7AB5smnIjDQ01G/FbfnG9aMzKiEy6oYnMohUQFc0SK65kBB1UmcHtLb8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WbhsoTHo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-295548467c7so53630395ad.2
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 09:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400466; x=1764005266; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=WbhsoTHoITZy+zfhNpHrHThsYkcothu6SEPGtPIBDd/wUAXisbi1ug3V548GzQJzeX
         VHv1aeqkKdNURu5Rrc6dkxXl+6qhooNxSfNUDScusZwzwGQa+WMoCbNsMkznBzYlRFPK
         gx055EVwokTt894ym/swa6qW+8ccS1Vz5nXb8+N9+WAIoIA75ze5ATtdAk4Dz5A1JmkJ
         nA1vCWX8Nd7gMwDR0+xgGaHNTZpTZlLqS1Zdd44wFoxsfzCmF6JRL+F75/33svPOQamR
         +yt7sakkqlUHNSeiljRnm9n+hFfz+KyWb7DzsrZjvSxaAMbkNGZeswJaoY8COJoAg6Ez
         H2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400466; x=1764005266;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=NtGOAKx8l0cpDPVzzr9lLA16rwpJDuaR1gE8cy13TD0PN0qpf1MxGqLVOgQQiOoAYB
         WmZy4nu1e5KDK8HN2rdq/Gul7gWM+rAXYSRYhWEzHbCOOXrRmLCOWkta73QagpbocsbC
         V3YhkfvybVxZ+3icT6MnCPHthtMFL7C8vvPipWe4oUeI0xvHR8ZJO7kuwc8WLSCGBI3K
         wNL9O3ltFLY3cEMUEOl7DN1AG4s/OSfdTOss6HheLNOAZpAF64gDFHqBapHvmsNN8sVR
         O76JYvC6zXbEBHXB+kwdFL1gF9NEX0tF3l1oFkUAxdjVbo0WEGxnzxL0y0HKMLtXeM3Q
         4mwg==
X-Gm-Message-State: AOJu0YwQoBBkdLCT78rof5YFMPAzlXeHxix3pqYdbM5sL6KxUbXf++U4
	G6JWKw0yEGIgB6d0OnvbXOTA/VHIrisNMJZhrCptu3OvdFpqIFWawLTSkWKeer8t4+ChAzdCIRQ
	xTLA0Ves=
X-Gm-Gg: ASbGncvxEan2/tt0XOdv1Dk9+8XEeig1+Fu1nke7RTIJ81VuHhBjSrs2wWvlmfgU4p5
	e/XfBuehkfEVtamPFvGIEf8gu8SYqAfq3ftK07pKvmk/iyq8GkVdbYDJXxeI7YCGENQXntj1P9j
	gUrN8MZfkqPCyV+9e9gMgOpXghlMivuC8WhU1WGRIt+Fgxd9mXVKYEmm2ZCJ5aR6SWoNY8Rd3ix
	+6R/LOXI2dO9v2ZsXsFyV/Jm5CU/zymXsPOvSaheXrJD00uhVfLjoI+QQMw8qBwfPSEZ6PqbRdU
	idePUqP7wmFba+d9t3hs+eb45jMFta82xzLaux5p67SNoUbohpQo6fKt/RLHj0e96K8O7thq1cU
	OtCtH0CkuBLyXRcvJv73D0IzPk38zKK6MFQd9UDpCj3UN9h1m4FgaVMJSQU8HEthPtnW4BRAvOY
	14B3aWMw5J
X-Google-Smtp-Source: AGHT+IElSDqKmysdPsypqiwQmrd7nhXoTOdlBkkWGvewmZSLP/XTtjfZ8ALU9FqHgq3YZZs3dsHUKw==
X-Received: by 2002:a17:902:e5c3:b0:295:596f:84ef with SMTP id d9443c01a7336-2986a72e380mr141061385ad.31.1763400466406;
        Mon, 17 Nov 2025 09:27:46 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-299daf12fe9sm53218385ad.74.2025.11.17.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.19
Date: Mon, 17 Nov 2025 09:27:45 -0800
Message-ID: <7h4iqslgby.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/dt-signed

for you to fetch changes up to 73f0769ebfc6473be084f0c52db25d2973097dd4:

  ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node (2025-11-11 12:18:23 -0800)

----------------------------------------------------------------
Misc. DT updates, mostly for AM3 platforms.

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing

Charan Pedumuru (3):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

Geert Uytterhoeven (1):
      ARM: dts: am33xx: Add missing serial console speed

George Kelly (1):
      ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node

Jihed Chaibi (2):
      ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
      ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible

Matthias Schiffer (3):
      dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
      ARM: dts: omap: AM33xx: add cpu label
      ARM: dts: omap: Add support for TQMa335x/MBa335x

Nathan Chancellor (1):
      ARM: dts: omap: am335x-mba335x: Fix stray '/*' in comment

Yegor Yefremov (3):
      ARM: dts: omap: rework Baltos LED nodes
      ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe slot
      ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels

 Documentation/devicetree/bindings/arm/ti/omap.yaml              |   7 ++
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt            |  43 ---------
 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml    | 169 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/Makefile                              |   1 +
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi               |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi                    |  17 ++++
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi               |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts                        |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts                    | 633 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts            |   8 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts |   1 -
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                       |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi                  | 270 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                           |   3 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi                           |   1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               |   2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               |   1 -
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts                        |   2 +-
 31 files changed, 1121 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-omap.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi

