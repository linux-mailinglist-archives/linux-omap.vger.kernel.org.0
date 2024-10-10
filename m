Return-Path: <linux-omap+bounces-2371-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B08997FAF
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 10:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC8851F28651
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 08:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434911FA250;
	Thu, 10 Oct 2024 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KsvnZSl/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7581C461D;
	Thu, 10 Oct 2024 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546252; cv=none; b=Sn2WKF/hQoXq/sL0wio4c3M8TiUfCCoaKCZwi5fXEEUXx5r6k6/q/HN+3PyiYgbPiZzdI5t+b3K7oNkhlpv8+COH0EFSVeIg84CInB0hP3WK0PZAH7Iv5+kJb0veNMKyDHNHJOe+C+QSK0+yTd8t5awoh5nKwoXoPfnlaezvHjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546252; c=relaxed/simple;
	bh=wjQn6x7hmw05iGVXgCKPpKhnBa3dzt0E8KlKESli17g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ImZJwyohQbFJB+Rz0C+xzhm3zb3T0WdwnFYVixXqa6G+S+zveCq/ZPce3G9O4SxzVOumPQutwVpySCXBLfK8iOay6nADwwUwthPUhfFL+jDi9uWW/E0HhepvQ6Bzq6WSCdQJsjnm6rMNePt+OIzGY34TZ26tuPHeNP81KE5Zsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KsvnZSl/; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=9j1nFx/lczpeat6SxVqYFDHmTqdMDhQGBTx9iCoyYQI=; b=KsvnZSl/3i+bHHIcc2bgGFMf28
	zuDZm6PNAKUtEM5ggt5rQs2UkQBujDRlCNxDZAkmfsdUF+U6TKatmrlmkwX7A58hLFelNc2ZvqAIi
	5rxU5mcUsTCpV3RZ8tXcjs0GDq0P5JBB+k0/0fa4FVkUGaPcAvth9yBfjta7EMu9zI2/9bMHbhAos
	qspIHX9BQssSLg0xL7SUK6UKldBGQbyyZiPjA3QcdXiBv8TZxCQR0hm3j7efShHis0XvFJzM6godL
	DDQWVIttUN+JtX29pYOrDcxpp3BvQKeUsKlaRCZx882Yff5nKEOaFCVYO+BET5IuhMus8G4AfPsoH
	mSj2xX6A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/3] mfd: twl: Add clock for TWL6030
Date: Thu, 10 Oct 2024 09:43:52 +0200
Message-Id: <20241010074355.58161-1-andreas@kemnade.info>
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


