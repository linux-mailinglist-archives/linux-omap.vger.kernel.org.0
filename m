Return-Path: <linux-omap+bounces-2234-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8569843BA
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 12:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1E71C228BD
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 10:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6696219B586;
	Tue, 24 Sep 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="cPCF9zET"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A60166F13;
	Tue, 24 Sep 2024 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174185; cv=none; b=l2SRT8IFTC4a3+FWOO8m6AsvAB9Sz+OzjBolQ6+zbJKrR5dCdMAnhYbnkK3ORKcRsq59u/Oa32muaYCMJb84mTrNJ9dJtDmVptrT/m08m9Ll29sy6IULQFojUAcD2VsoD5/6khSmF4a6WRhpCa3III5UOmYB6tiTf4mtoWOjylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174185; c=relaxed/simple;
	bh=tA7aTS5sm2hEzdWOJsqsBy258gxg3eeV8RLialm0Sk0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W9EjnJxuuqaCDKfz74AP3vzTcfLvWxnaK4U0wiyoOOogUk+kmAjpsu3a/rA23JurtgEORFOoqyWr4W7JVGOupm2cXAW7WLCvoXsPLbLVBmIrU73+kt2D+DMOaO2baIZaqC1+BLmkEXMSIbr5fQnlGtDZRVluMMPjMHjlhi0LZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=cPCF9zET; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=S+qfGQ5PPpJMM2wLicP3lGMhetStbKnWx/oLn21hKQg=; b=cPCF9zETJG/xpr775eTo6h8AY7
	93QzOBRHbs8ZHv6qg8dqMj/3GtoImAsMPt7SO2NXKtll8b3+hqKApOaZRZqwWnhC8dqmVD6UfD2Rv
	aGtiLIJxdztt3yUo531QfFKqQcFHbki2sxSOM/lxTJC1YGIWm+fBKiUi8+mUkqv99LNI/H1Xylcci
	2r3uQGY4w/NnofiIkzBmuTt+dDeTF3WsRpoVUAlekrT6Bph/ftgtQkATng5M0zFDQo2n5l+4n0Go3
	GXOCuw1WmXlofR4drxSktQpBuxIzuVBlXd+qz7Jz9lAdNCAUaBmFCyPxSd1cqjKeX/QAsvNWCCKKX
	XHpS9m+w==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] mfd: twl: Add clock for TWL6030
Date: Tue, 24 Sep 2024 12:36:07 +0200
Message-Id: <20240924103609.12513-1-andreas@kemnade.info>
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
This allows to explicitely specify the clock requirements.

Andreas Kemnade (2):
  mfd: twl-core: Add a clock subdevice for the TWL6030
  clk: twl: add TWL6030 support

 drivers/clk/clk-twl.c  | 97 +++++++++++++++++++++++++++++++++++++++++-
 drivers/mfd/twl-core.c | 32 +++++++++-----
 2 files changed, 117 insertions(+), 12 deletions(-)

-- 
2.39.5


