Return-Path: <linux-omap+bounces-2777-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6E9E5F9A
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 21:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28EF1188555A
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 20:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598FB1BD01E;
	Thu,  5 Dec 2024 20:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5w9DTTU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA061ADFF8;
	Thu,  5 Dec 2024 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431463; cv=none; b=sIaMz+RQlY3/s1dKzAP7IyzYh3LkPLY0TDiXETtSj+oN3984vcebJnKFk98A/ZLlcwINy33dLueKFaDSYYol39rSh1ItsMgz8bEpfsX2nWj2sa0O6ZUvxR1kjocKqFJgEWvZRo2v6igMjPbfkuW4BrK7ZpC4ieOJRvzX7sp7rhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431463; c=relaxed/simple;
	bh=hsqeDpfQ+eUu8UC/LV6aPrN5EvqvaHVRManZyqkDFm0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KpZvzAXTEkju+s+vXrP0DjJx3C6CFMis9ylTlFOCdexyQuo8xDIsTrIFNrpSz0wpCQOTsGSutA6SB2CPnlTFMrlRBrRgGTEY6qq3P624BGfaszpvjfaJCWECkmrg7CjD9n0vdiGrY13BPohSCWSv6FW+/9igdXx1gT/Ay1j6X1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5w9DTTU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F43FC4CED1;
	Thu,  5 Dec 2024 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733431462;
	bh=hsqeDpfQ+eUu8UC/LV6aPrN5EvqvaHVRManZyqkDFm0=;
	h=From:To:Cc:Subject:Date:From;
	b=p5w9DTTUVryt2xDxqL3ehDsedRNNbhTLXisrtXZbxOJaN504LvbDKXWgeusR7Akxk
	 RQkKUqvHJ2PRc95ENm2JE7MQnOtifgwXpo9VnBfrjfBZT1x8hDVyu4LYAHe4t4EpEG
	 Glbw7rg/9D6x2ZBHPAQBEIxpKi9gBdDIUB16S++erqN6MP0o+o3yyM2f3/VnHaClKA
	 MfJ8tIdZJZiB0iI4XobNS5IPMEzrfPZ73/kjlQlwmqV/ta2rC5NnCvC4Ct4aOvKkZC
	 uMFrqS7nN21ruXcTLc22aHyhFgWtwGMckMpUuC/VdRyl3DsHPZ0pIh8J55Y0VeZLvT
	 JFY0lLd0PpKlA==
From: akemnade@kernel.org
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	khilman@baylibre.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <akemnade@kernel.org>
Subject: [PATCH RESEND 0/2] ARM: ti/omap: gta04: properly specify GTA04 touchscreen properties
Date: Thu,  5 Dec 2024 21:44:11 +0100
Message-Id: <20241205204413.2466775-1-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <akemnade@kernel.org>

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


