Return-Path: <linux-omap+bounces-4317-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20564B3330B
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 00:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0463205EE4
	for <lists+linux-omap@lfdr.de>; Sun, 24 Aug 2025 22:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6502725B1DA;
	Sun, 24 Aug 2025 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="+EEejL4u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D3525332E;
	Sun, 24 Aug 2025 22:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756073288; cv=none; b=sqNqRAiMpJ8CdG+FA5pDNCorhQLk4SHR+N2PL6OSQv9KjHY9YmWy/4Zvwhh8U/B25H5RpcC6gZuOf0Kjh5SCuTrnp93PjMUi5nMvnnYlddeRurX76cpmHYEsfE1LEx5OJrU5Xs4bSr9RBpdEFyvtmqHodMItCE/llTgNSHLxx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756073288; c=relaxed/simple;
	bh=bHHWY5OfputAWYGTO1p85nuUcpFbAZ9RFImnE/VU5QQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k9VWlVyDFRxTRoUDV+Z474Xg1/0E2o2HZyHwnRRH/ZEdhbVx8edGdU+FgoW86Ic4Xd+n5QCm5jk4+2YzH8VB9j4qffimjYni2xXN4hUl2CIH8oPR3/WCiGnJxVbOt60bKs+tIzoKOqQ3+fuis/x9Tw/Qy1rFpVXptUPX9HCReKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=+EEejL4u; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=m4GNp9/J5yYI9k5DcF9DPqFUnnbBZK14A6T5PgRzyk8=; b=+EEejL4uoYYACC2EWUagoZY2KT
	TwWy1ycYd8F8tIgITrAh9uaFSKQO9bvPSAePaeftjBHthz33UMgI9OlMKpokXTpiQ77POMmZswTt9
	CSrvQ9Lw9ZrT+e6aZL2LzbyCWeVyk26kkhH0GjT+xkJYZect0VAaRsWq6XG1L9gA943B1j98vpHKk
	FQjtX+2nW8v9XKMy+V+hkF7MQC4/6z2zmXjWwNReP48fgXGVay1JmRJbizDcuCD8AHGbwOHrrQtR5
	Y8M6/1KCFlpAoRccd1lhrVpqbDZOz080wLZl3jvpV+rZlyd7dgw6SSP0BQN4gvkIIEBFHz4Jw/tne
	Cwdl0dLQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 0/3] Input: add EKTP1059 Touchpad
Date: Mon, 25 Aug 2025 00:07:27 +0200
Message-Id: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+Nq2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMT3dTskgLd4tKk3MwSXWNji2STpGRjA1MDYyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AKRI3oViAAAA
X-Change-ID: 20250824-ektp-submit-338c4bc30503
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Tony Lindgren <tony@atomide.com>, hns@goldelico.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=bHHWY5OfputAWYGTO1p85nuUcpFbAZ9RFImnE/VU5QQ=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBmrey3m5rO3K17qSG2ZYf4oL670XuLrf3Y5kRH8mqZz3
 tzXFTTqKGVhEONgkBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCLbGhkZXl6bWs68V6Ok/5d1
 q4W60LudgkVBD8783n85YcHlR+a2mgz/4/LEc1Jm9igxf+lkab2U8fV/yUfjKXqRTa4sd0pX9P9
 jAAA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver and bindings for the Touchpad found in the Epson Moverio
BT-200. The only information source is the driver in the vendor kernel.
Besides of cleanup it differs from it by not doing much postprocessing.

The touchpad has no buttons and can react to three simultanous touches
but positions can be used only for two touches.

This is an early RFC, maybe somebody recognizes something from other
ELAN chips.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (3):
      dt-bindings: input: elan: Introduce Elan eKTP1059 Touchpad
      Input: Add driver for Elan eKTP1059 Touchpad
      ARM: dts: ti/omap: epson-bt2ws: add touchpad

 .../devicetree/bindings/input/elan,ektp1059.yaml   |  45 ++++
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |  32 +++
 drivers/input/mouse/Kconfig                        |  10 +
 drivers/input/mouse/Makefile                       |   1 +
 drivers/input/mouse/elan_ektp1059.c                | 267 +++++++++++++++++++++
 5 files changed, 355 insertions(+)
---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250824-ektp-submit-338c4bc30503

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


