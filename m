Return-Path: <linux-omap+bounces-2209-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDB979897
	for <lists+linux-omap@lfdr.de>; Sun, 15 Sep 2024 21:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB7C282C02
	for <lists+linux-omap@lfdr.de>; Sun, 15 Sep 2024 19:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7D31CA687;
	Sun, 15 Sep 2024 19:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ZE/7i+Fe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71851805A;
	Sun, 15 Sep 2024 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726430014; cv=none; b=EiOLUZMzzTdaMrpgHYmeu3Bh8SyzpBgsohzCv2G3iP5EPXF5e/oBbmjwdcSg0yP3qmn9PKdXr3Y50W0eleZ3gR4Xa8f1Vcgp7ZrH5a913mIbIwhiWL3NvxI8LBntx9H+dugtu+7eN0FlOOLuZQ5Ns0ePSTACNKvuBXXiIUzAXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726430014; c=relaxed/simple;
	bh=2JW2Ts2S3xuCXdTpytT1xtaTcxAAR7Ff7aexRCwklh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TOHkP5+zP1pZl044lFtB6ktBMi5I38cHErwIgw4qqnRLtCTgTfcSpb/HH36wQ8Bz2T6Yc3kU0PDhTEM1p3r85B2eSeLvsOdxZ0K13eICNS9iavMjIuWpSH9gHK/YZCAyd/q9yX4HKTTbSBFYyi0Fs5GiZfa7vOsbTUJnk2hRJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ZE/7i+Fe; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=R3QLCLUyWyn2h+R+92oKG3/sMQSkUu5TEJZhKqnuPWc=; b=ZE/7i+Fe4b0koSAmYmxeKespfF
	kyljmxFbUGhj/lwbKHdawD7XC/Kve55VPYgbopLeDADFSu8p0dMvcXcLkLzqLLW7S28b4ByGPdzHv
	ZaPxwj6BYlxzTzQ2thjN6Rrh1rdSUcqgG3SqyVDLnxIh7QLndt+brBCPO5O2E9P1LYvcw8E2gqaht
	6+ZTSMhZdDOuy4JTDRixklu6rgxO4dzpD/JYj1HcK9hMSxTvHD2iBfa1xtJOWWu+cJskIWJ/qMwQa
	cS8o3WzzA9Kfl+62bftEg1uoJ4QI6uiDV27RXttWTkokyVWsHUse0joeYk+FE95Uq6M5L6lGZGvwD
	OqKsfSVQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap platform
Date: Sun, 15 Sep 2024 21:53:21 +0200
Message-Id: <20240915195321.1071967-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both used to go through Tony's branches, so lets keep things together.
This was missed at the time when Co-Maintainers were added.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd1..755c378cb2e73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16653,6 +16653,10 @@ S:	Maintained
 F:	arch/arm/*omap*/*clock*
 
 OMAP DEVICE TREE SUPPORT
+M:	Aaro Koskinen <aaro.koskinen@iki.fi>
+M:	Andreas Kemnade <andreas@kemnade.info>
+M:	Kevin Hilman <khilman@baylibre.com>
+M:	Roger Quadros <rogerq@kernel.org>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 L:	devicetree@vger.kernel.org
-- 
2.39.2


