Return-Path: <linux-omap+bounces-2573-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465409BBD88
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 19:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A071282C61
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 18:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0AE1BCA07;
	Mon,  4 Nov 2024 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MiJMtMXc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392018C932
	for <linux-omap@vger.kernel.org>; Mon,  4 Nov 2024 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746298; cv=none; b=n0xN4Wf9ay2DTVb0OZeiIRtLv9onUI/FMzd/ZVkXUNx+VspxUgW4vUIeA+fBT8HLe+VPle3nlCHOzXwQI24Kg/T+98M55vQj7Dx2ur4XitPd0S8ErkxXr8l0z2Ze9b2e9uIVpiwZ0F5TK4CGuCV3YCL7Xwm0bcljLYVV0/ZFB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746298; c=relaxed/simple;
	bh=a22lLUTFqP/yxTWz5lNuOqkZR4F8l0Y7soEfFfZvwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jTizA0qJs/VY2yAIgaXfvHFKy+JuoZAGlwTFvjJuRwdD+YEmHZpJO2DA0gSyL+jIPr6rcz3iQILVJj9aUlzwwUD66R8hYub2399ODZHltNi3i5LsCpEjJZ7eJjEATzDEBxmeG7U1jO0538nAfiObpUEoyGggcYU1b5vk9CDARpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MiJMtMXc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso42031725ad.2
        for <linux-omap@vger.kernel.org>; Mon, 04 Nov 2024 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746295; x=1731351095; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=MiJMtMXcxCyVvAN29kHmdiMszi9i5JGCvm5Qk6sH+GA/E9RXfbOD1moIOBTKzYo8kr
         iD6gMFY7+6rNA2b+zFUsBF9wHngv+eusGJqcRgXLnAr6A9ehah6wNIQMB/usjfggO5Z1
         9E5AxifpYG4o0Y+IB6w3VetWq9pXWpsBpTU4j4OQ4dtE38Xc1+ynJk5owNb3vif6OhKo
         /FSWWK3PMf9ZCZGU1JesRCIZZtH8HDzMFZ5AgyyWhbsi/MGZDwSZxV+9cV8PVWTEcQTU
         xLPDAv7CS1h4MHh+MLbuFNAYLdumkih5Ie6Fs4bovviHn+8uw5g7YuB0mmmIgGgMJylZ
         Qs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746295; x=1731351095;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=Os7s8L2WyyvyQwN5IhtUj7nN6Ax0YLBMZ5mbnIZG9QnyFcioXgEde+eYSKKUVV9RAZ
         wKLU2EUbOwGEL65h8iy+0ffzUbDLdBEg2mobLbJrx7GWGEMbyQhozKC9xjSKjV9oussl
         wc3psTHKZ2rerSXIrqIx74wipqGI2ILQciS4iBLBty+CayrvqZb1+MrwGwx5ecJba1Gl
         ky55u+dH0OirCXWGLMfJ8C/dsNTQJRdexEJvsPIL3AzULpwUDzUhnPvaLKIhCC+S3h9M
         vRe3hyB2ueHs6CQhV1dKdkkCh83WVmSBjtElEsWAFJytbODKkiQ3ctjESXPyyUuYY1aL
         o+bg==
X-Gm-Message-State: AOJu0YxOwdaSsmr8lPxvSstHJmF3vP3FhSGOUykpICi19pJlBCK6I82Q
	IxaAvOIw6NsN33rx5/hJSLosr40oA8aMwLbrAqRXFMF9t6YVjWdeCWEhc7v7bL49zfu8HUVb8ea
	8HFo=
X-Google-Smtp-Source: AGHT+IGzpsJFLBBw3vdrPJOV+n4vGe3wFsVOs9lQV6Gx+kfr37V1BYgA0GZsaPx09/UbeM2AdnSQng==
X-Received: by 2002:a17:903:2445:b0:20c:bcd8:5ccb with SMTP id d9443c01a7336-210c6c0610amr475618745ad.30.1730746295454;
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2b39sm64589225ad.145.2024.11.04.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 10:51:34 -0800
Message-ID: <7hmsieomrt.fsf@baylibre.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed

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

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +--
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 ++++-----
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 ++---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +++---
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
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +--
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 ++++++++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 --
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +----
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)


