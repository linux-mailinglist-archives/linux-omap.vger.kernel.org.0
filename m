Return-Path: <linux-omap+bounces-2416-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D380499D456
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 18:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25FFB254EE
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3AD1ADFF9;
	Mon, 14 Oct 2024 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9LrovJmu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D81AC427;
	Mon, 14 Oct 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922281; cv=none; b=d2dDjtYfv5NQpv2RsCk2a4IWYm2NL+74Nq6xTjrlCWPLaP6qEgZrxJ/aXMSaBO40SmKVqd5XuILYRZ+j8Ygw+soAp0N1WoAwu/KqVnQsJlf5Yo33WuRrnuE/n17GUsH2XDcV1yngjC+xzM4/Gi3TpGq202XjuCaUJ75I6gw0/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922281; c=relaxed/simple;
	bh=CCqoYBX8pBuwkzPFUfuawngByr5CbP5nCkxTn1wCSCg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VxadRcHDaZCjsFxHZ5WepwElz/8emq36INGhZkLsgyzs4z1RPZBkKBaQKmKtn3kQ09NWriY8ghPtyXwyFkYE87ETyhQmQjywR3ltMgSe+A1IZC0WWJ0RcReRN+pRaPU8MiB+8Su23yNNAoroOYe9puPzQ8190nIJM/SB4MNUIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9LrovJmu; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=GA4cCZNoAOxgHgJeiTfPi9G3f1MMYyOonIw27jABOF0=; b=9LrovJmuyzjNeWyHc9x5F+yWFg
	+YvnQ6F3cqHPrrTaDOQIiBkuuoiN+I0sz4tYr5BiSpeeTPFrHw20en34dQssbg5YekGtbljys9V7i
	bWkaMJf/FXeEjME91Nol0HHBuH5F9sxnMLfRUdgmZdkmM+2y9KyqvO/q+7Z9X+yz91YNIRRJHhdem
	8JlmKuD/Eam+QC0dmRovTWCZ97JJIe4CjpuJRqThJxWRn1k7Wrdv/8Wi8tVXVjf4JCrN0zPgcBkp1
	BClszf1/Y/1ZLxQlbKqb05oF0GwMZFtEmE0KJByuuoRL5L7ixGO6SRkFgyVdF/Phcnf0/fIZgiV+/
	z0CvWc1Q==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v5 0/3] mfd: twl: Add clock for TWL6030
Date: Mon, 14 Oct 2024 18:11:06 +0200
Message-Id: <20241014161109.2222-1-andreas@kemnade.info>
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

Changes in V5:
- fix unprepare 6032 vs 30 mismatch

Changes in V4:
- cleanup if (TWL6032_SUBCLASS)

Changes in V3:
- use type enum in driver_data and twl_clock_info
- revert back to store device instead of platform_device

Changes in V2:
- cleanup some defines
- no separate ops for 6030
- remove is_prepared()
- update Kconfig

Andreas Kemnade (3):
  mfd: twl-core: Add a clock subdevice for the TWL6030
  clk: twl: remove is_prepared
  clk: twl: add TWL6030 support

 drivers/clk/Kconfig    |  2 +-
 drivers/clk/clk-twl.c  | 69 ++++++++++++++++++++++++++----------------
 drivers/mfd/twl-core.c | 26 +++++++++++-----
 3 files changed, 62 insertions(+), 35 deletions(-)

-- 
2.39.5


