Return-Path: <linux-omap+bounces-2413-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EAB99CFA6
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 088CF1C2341B
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 14:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81461CACFA;
	Mon, 14 Oct 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HSlBYlWX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3711C303A;
	Mon, 14 Oct 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917629; cv=none; b=Ts7xS0F/0YUU34xts1kT1wmdrqRE6ODt+8HiUhu7qZ5vyU97pkFGgZ7xlFSPLimgBwiP66FvLlY62J8zjDjSEdAlzqCGDnlX3IG2zvioGbN0KY7AQNbfwBHnAe39t1ZZLEZ5QMJ6UOxr0z+a5Av0eaL3ipXqdsWBYsACKb92ik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917629; c=relaxed/simple;
	bh=oUVukm9STL6kt7psZEb5CMMMJANo5cADWByz4L1JE1c=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TUpYUT3C3RPifha2TX1pwjCWPPBnoW0QLiGaNxNxgghhm4+AuogTuac1Z/8DJFKlYtmHVcLblIpDUPH1F6PwRQ6Nn95+a0flfa/iSYvjwFJrKDTY+rmnK8VufDRu9usJk1xz9kuCTLExIJCWaOGSMj5AwIDAbfhpYwLfGU5Fbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HSlBYlWX; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=lp5ayGMbaEMRV2NJ0zX0xRA46vwyiDoLRxWN3jh1y8A=; b=HSlBYlWXNjV/RXvjzM9s72dMnr
	GdtfKuQ+5ytUMDEo+m08LOwgKuHouf1evegZKR88k3kiBv8ILzb19sd25CgXb1BRKq78KzxiJ1n4B
	kIl0PbC6lCo1mUnechx6Kyei7IJT4pmBUomYx+9PJJgwtUUZ7ecCkJKYuW8wMCyaDkODkEGFiIPpj
	kwx0W6J15iWLIs9bZuu+bUGzQqRM0Ot4yCB4DkH5bWOx/WsSxCNJCqWmnTKU5bxG1X4he8qfoKFGg
	G2F6gccB+ZMTU4Kxhuk9+hz/GQWn2PuPBZzXbCqnVaQggzpQAnIO17r0Yl3/kd3S9pvyMiqvUY3bb
	yJbMGp/A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-omap@vger.kernel.org
Subject: [PATCH 0/2] ARM: ti/omap: gta04: properly specify GTA04 touchscreen properties
Date: Mon, 14 Oct 2024 16:12:38 +0200
Message-Id: <20241014141240.92072-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify touchscreen in a way that no userspace configuration is needed.

Note: if the devicetree patch is in without the input patch, things
will be broken in a different way.

Andreas Kemnade (2):
  Input: tsc2007 - accept standard properties
  ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 6 ++++--
 drivers/input/touchscreen/tsc2007.h        | 2 ++
 drivers/input/touchscreen/tsc2007_core.c   | 5 ++---
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.39.2


