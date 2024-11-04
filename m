Return-Path: <linux-omap+bounces-2576-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56D9BBDCA
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 20:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33C61C2338F
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 19:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8651CBE85;
	Mon,  4 Nov 2024 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VmoVlPXj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB2E552
	for <linux-omap@vger.kernel.org>; Mon,  4 Nov 2024 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747424; cv=none; b=Zfa8OBGkNs9w48ujvaqjT6J+4piddCyuLTZuX1v5z2Iru12j0Pjko3P9M35gJsB4VokzuL5DVY/9X04siSzGJhRtjbUhzwjGotnXQM9rhvf821LAbBI6+d3IgsUttIcQbnd1DR1Gkn2rAQSdfSAmNwwRvplXOoyTP7mB4hZ424s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747424; c=relaxed/simple;
	bh=aaYgFrJhT9A6u8DPjoUnnutIAW+Io5answdj9XabaDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xop9NMQiMgHcAg3GKWtsN/UkTBXosrVkf+2WdM7vHAic8lC6KmBNrnMw0hUPZ0h0xWWcO7nliWznB3qYAQrAAPOb54e0Bp7rfTlPCbKgXZ7k/evybFELfzrntna8R/zckjp6ZhcF1j+j7RgUswWrZyUrElYg/VWSY5nI6KKFnjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VmoVlPXj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso3593877b3a.0
        for <linux-omap@vger.kernel.org>; Mon, 04 Nov 2024 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747420; x=1731352220; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=VmoVlPXj3P3vE455770bXhBy3MHHtfFIhWK3205TSaTiUmClsqKMgWUOTCdOpKdTG/
         TaMG6QQ2DSr1CLajV7MPB5QWtSDK4M/ix2rzWLy4Pfwj6wl/urxdKydtH0uJGcCTU9vj
         fwGZGwMcmmFxWvWnKjrfyzb49mgZdTXgt+O0LFeJv1ETrEUdTdid4pR0iQ68YhsBT237
         NEgiHU7Cuin1/b7zULH6ifLxA/HAEkf89gxWabx1mAHsGxCVxTqY+3vtd587LOzXofpS
         ZbwEwnF5E5O9+iXQk9C6SELA75RAGtVTZyfNqUw8S+a9KVdDlfowPLWgubYXqYt88NDi
         3jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747420; x=1731352220;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=N1VQAYlrJQpFGRkhZM1GUltlLsqnjSpjmQjGDAqfz8xcTBeHUYnrX7bldsDgEEVaye
         KzyaTwEh71I0YO6A6qV6K0rfkcLjN94ekGfIUhavB6C7FnHnYwDPeluAazV/Ji7M2OKe
         kZ8Q16pZAXaJEtbRgyvjjlWmeQfNgLPtYzaYVC8v4lVyVxK55GDTthSE0N7CjvTJtAnY
         EdBXSylLQ/TqdyL38KGkOhhwcLnjzfVzFBRPqSP/KbAe+9VA/2kYrqfWTHITiJZxKp+R
         IUwdisJddz/dNfpKZf6h/M9Vaymzwzpelu6N1MroT/pinv1rlsrMlBPLegr7FTHlS1jy
         EGYg==
X-Gm-Message-State: AOJu0YyS/Pa0jXi9scSNTTCpLpM+f+Gd2hjA81WoEjAQTWzdoHOzDFfM
	AcugqH48Jm3+oqbsalkmtSsSwswTIkv2AP59ODks83IcC2wuh1zJd0sGwtZCSt5hMcz+Y7mM/NW
	c8f0=
X-Google-Smtp-Source: AGHT+IEjWO1rixoyJxbVGtJmuxL0xP1l7hFGkamZjG4E+eqTDpqyz2JlInUTxjamsjs8DazSCd4u+A==
X-Received: by 2002:a05:6a20:7288:b0:1d8:a67e:d323 with SMTP id adf61e73a8af0-1dba423639cmr20344552637.22.1730747420431;
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f8fb9sm7442891a12.61.2024.11.04.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 11:10:19 -0800
Message-ID: <7h8qtyolwk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed-1

for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:

  ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.13

Misc. minor updates for OMAP3, OMAP4, AM3 and DRA7 platforms.

----------------------------------------------------------------
Andreas Kemnade (10):
      ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
      ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
      ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
      ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
      ARM: dts: ti/omap: use standard node name for twl4030 charger
      ARM: dts: ti/omap: dra7: fix redundant clock divider definition
      ARM: ti/omap: omap3-gta04a5: add Bluetooth
      ARM: dts: omap36xx: declare 1GHz OPP as turbo again
      ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
      ARM: dts: omap4-kc1: fix twl6030 power node

Geert Uytterhoeven (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms

Marcus Folkesson (1):
      ARM: dts: ti: dra7: Remove double include of clock bindings

Rob Herring (Arm) (1):
      ARM: dts: ti/omap: Fix at24 EEPROM node names

Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 +--
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +-
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     |   1 -
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   1 -
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 +++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 -
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 +++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +-
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)

