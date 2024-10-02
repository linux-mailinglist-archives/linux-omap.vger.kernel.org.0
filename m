Return-Path: <linux-omap+bounces-2293-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D298D1FD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 13:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036471C215A6
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 11:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20973200123;
	Wed,  2 Oct 2024 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="LXCEtMkx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342A1EBFFB;
	Wed,  2 Oct 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867259; cv=none; b=qAaKlrDewBJIeJAD97gEhnajxuYe03I+HVR1iith/OneQelfQu/j8+qkSDJhRpOPf3XvgLPZdC9vbDcazhpn+ZGcP2+7yGmU7Qgb1IukPAoxo7hqtCFO962LMOrnkr7NR/shTUYkPEGNBSgE5G2RyQi+/2ahnK0LUaigQ1PLogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867259; c=relaxed/simple;
	bh=vB9vI6WRzdRxXmbdZXI9Iwk/JIrxAnatd2u6aYQNlCE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LXt1lsHiNwX1nF7M6jhaAxwqDpfxqFd2PNkpSXxYn86c/AK4WI2WpnIa6K7YfxlBQ2HGv2v0CB+JPqenUCuIGRyRPkBPrjfvrYk4bQmH+LHTRz06p6fNli4OBmUTZcIwHDuqo2A0lpGBggDgz6N7qPJHY2a6MTFOeQGQoqFePS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=LXCEtMkx; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=j4JZqMGLjPIlJYiU7SXMyC/1ARZVOo0mx0L4xwVNZ9E=; b=LXCEtMkxFUmFHXHZW+9MJS/Z4O
	fLAQ+iXjrA9oougpjYjO9nYj8wbG5B7kZR3pVbD0d39B//HPtTEPciV8hUjIoC37QZCXAM3n+L5/P
	Eh+hlWlz8ed6VfWUSgfPbGfbxUFypZdarvvBzRewNOTJ56fuVFZYzzPhWIDsJLdPvnk2g3vjfXS5/
	WvRt3tXA62UCl6RBuAT72z1yG/8xmdvnaI3npaWewUZtbeY93egu8qZwdNPjwsF1O4QioSlXRpKHF
	It8ksHXvi+HWTgYD/PfQzOU0JYdDN/4XpPT5IRJapYeqEmZ5wjIdp1tPC6jrCiWcQ1bWBNSbPMa2S
	ns4ZanQA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] mfd: twl: Add clock for TWL6030
Date: Wed,  2 Oct 2024 13:07:15 +0200
Message-Id: <20241002110718.528337-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the clock support for only implemented for TWL6032 so add
it also for the TWL6030. There are devices out there where especially
WLAN only works if these clocks are enabled by some patched U-Boot.
This allows to explicitly specify the clock requirements.

Andreas Kemnade (3):
  mfd: twl-core: Add a clock subdevice for the TWL6030
  clk: twl: remove is_prepared
  clk: twl: add TWL6030 support

 drivers/clk/Kconfig    |  2 +-
 drivers/clk/clk-twl.c  | 71 +++++++++++++++++++++++++-----------------
 drivers/mfd/twl-core.c | 32 +++++++++++++------
 3 files changed, 65 insertions(+), 40 deletions(-)

-- 
2.39.5


