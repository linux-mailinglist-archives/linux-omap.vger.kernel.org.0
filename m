Return-Path: <linux-omap+bounces-4078-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C1B0078D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFA13A7567
	for <lists+linux-omap@lfdr.de>; Thu, 10 Jul 2025 15:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E9E274B3F;
	Thu, 10 Jul 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oXT9B+5G"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D5B2727F2
	for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162548; cv=none; b=mnfkkCwK8xMm8jlEabKEH6BLPZd1fTlb5nxJCbJakG5Z+CSpkW6V86cBd4ptqpPIozXicNH7OqXEarhH6kAj+9uNUFGeEp46rixGZW1QVxXnPvm20wm1Lgc+Ln4078Guu88oMFbvtkSVZBzpUg5uWcV1fS/nxuHGDeWvLT15Rrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162548; c=relaxed/simple;
	bh=NUas53vpoAk6VP6qKkOKtFSjta/i003A560bDDh3vDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBBIn7UB70oreJWqgBfdpi56zKwrIr3un7myB5ofNlb+JNIzU2ES7gg2rTz/jCS578RAdCdE+4mjotQDUFodKJntp5dgfm3qCAZC5C/ZNNX6B5Y0muQ41URsb9tQHoXPoGfQHN5m1rWofFKIDqJlKKHsUyy4aMy2R1UR4ryzAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oXT9B+5G; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2349f096605so14859675ad.3
        for <linux-omap@vger.kernel.org>; Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162546; x=1752767346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=oXT9B+5GPhhZG8Wih3VMoiPXnMn6DRwLm3FTsO5kMjwdUSv3RREABS/9arsiOYl7i8
         zGI3KGn2FgnSVmERLHQEyM812mPyP1EhHaNZC9MLd0LuxANGEcRRul1/qh81eQhdYcio
         fpneZqzEFGBXLdh395FdnPNrIde9SMhmzXUmjBzIkQHQIBj8JRRZLt1GjhsPB7EKN8Jh
         xQQmOr2u+4Xe05O5GSGfJOb7RcMWNlyaDr+aYMmkZUd57e/rtNQVeO6W+1WQxAEoSTYj
         Oga8YD6BUSKJK+NqvPtHVn6ztrmIjyMenshUEl1UA/E3ROoDznQBHeCqyUHFodkcUB71
         F02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162546; x=1752767346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=GzWCJA3L/JX13/6q+7m5cJ/rToXM3cRJwUzHGPQseDHlQF/Du7wxdnyLvL4KfGaxeM
         6owySfX2+3i98GvqvMSpSyzcKS9CZ2pHIvdmSNQMuVcIDXg3b0AcxT80chLpnhM9ZiPo
         CbuwpIsOcMDIc8vyGp6hMFcZtJQhvImDQJW+MrlwGcceIsgCqtMpP9JefUwHleMpPvL0
         7tEwputEDjFZIRHz1Tl776ASjxKcvoQNYE/awIcsCwWOYtcUcsrMdcliAQO08RYqrlbZ
         M7CUT8T6PJRwD9mC+GTzSeCvfX8BCC9GlB1es0CJy22DkBMt+8e5ANidBxNUqzpj1CV8
         aiEg==
X-Gm-Message-State: AOJu0YzyKSZ0vgyQ9ukSEA85t0smcPODBItXtpO4H5C+BH6yVT6rphT6
	TlR2yz4GA7CBVgBuK699BXW64tBc80zncIqHOGqQiMdJQUURef+Wtv9XRvzstBsI4CLi55t/k99
	5az8eg6wFyA==
X-Gm-Gg: ASbGncsk/49GJ2waSXwJXw01DEaadWz+zZ4xYQHO+b2sPdrsWPeJmMH6r9COT5lggG6
	SinA70HGt+tL2hwSpNT17hDAeYtMwF8ImeHEbHWqWYP/4lvgLfXCIjX7BurvzgM5BLK+iDsTp55
	1Zpy7Z+o/bLCxV7FR827d2oI2oijmGlEdbVjQGfOkXS+Xj3MDt3Y/B+7NI7YWRuj/J+2y8tqMBF
	g1kCbQM6XDJ5OJTqMbV2AduCc7+t3Rd20X3TgwyCnfd0SmE1ul+WHPIG05BaztrublnjPUz7rAw
	/RUDKJIqRHIY8OQujUE/KUyumus7H47GRQgQeWSNuw82JELuecEGndok9DhmyJJ19i7tpYA=
X-Google-Smtp-Source: AGHT+IGl3lYbN2pRFYA0zQWbsg56J/yom0bWzs4fTRL3F5wEm5er1i3GzM8I8xWM5o1Eo43mIynm6Q==
X-Received: by 2002:a17:902:dacc:b0:237:e818:30f2 with SMTP id d9443c01a7336-23de489588fmr41446345ad.50.1752162546029;
        Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43313d3sm26855165ad.144.2025.07.10.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:49:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: dts: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:49:05 -0700
Message-ID: <7h7c0gxczy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags=
/omap-for-v6.17/dt-signed

for you to fetch changes up to a3a4be32b69c99fc20a66e0de83b91f8c882bf4c:

  arm: dts: ti: omap: Fixup pinheader typo (2025-07-07 14:24:57 -0700)

----------------------------------------------------------------
arm: dts: OMAP updates for v6.17
- new board support: Seeed BeagleBone Green Eco
- misc. fixups / cleanups

----------------------------------------------------------------
Albin T=C3=B6rnqvist (1):
      arm: dts: ti: omap: Fixup pinheader typo

Felix Brack (1):
      ARM: dts: am335x-pdu001: Fix RS-485 transceiver switching

Frank Li (1):
      Revert "ARM: dts: Update pcie ranges for dra7"

Kory Maincent (3):
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board

Krzysztof Kozlowski (1):
      ARM: dts: omap: am335x: Use non-deprecated rts-gpios

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/ti/omap/am335x-nano.dts          |   8 ++++----
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   3 ++-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |  29 +++++++++++------=
------------
 8 files changed, 190 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts

