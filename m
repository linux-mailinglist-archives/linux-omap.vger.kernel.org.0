Return-Path: <linux-omap+bounces-2713-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF899D495A
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 09:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E1C285739
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 08:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66F71C7B64;
	Thu, 21 Nov 2024 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b="oE6nIN0p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iZfWm76l"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A32230983;
	Thu, 21 Nov 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179483; cv=none; b=pn/DKcgm/90F5+Yo6VM3Iua19KrYbQzs6t307UaE9UbiL4NjUISXG+4a+NkALcw3A3ApCzY7/jFBwc7uwne9UYXR2Q2ZlDIQH3OW44CfluWxeetcjuq0wur9FptVHY0tmyvfcbYCy+0WRNFeoQHwl3C+Bz1dQIC8ZAZJ5VkHPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179483; c=relaxed/simple;
	bh=dNpESR7SOha5Fc3Svey2AgzTpApPcqbiWLit69d56Uo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A9LLakwLw+jq9ysNb3z0VY9/SxcXoAnC2L9N6WRBjFiUMrr5zNU+KLbJWfnox3WYvF5hzXExO7nyuU2G6TXdQngjQ+OQ6R15r+VGJ6CW3cYteh/BLQb4z/MTv+2o6kERo8ZsCJ1I5Mvo2csaoYipgoCH5edfgzK40XafLoHUxdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=pass smtp.mailfrom=pbarker.dev; dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b=oE6nIN0p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iZfWm76l; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pbarker.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E8C5D11400D4;
	Thu, 21 Nov 2024 03:57:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 21 Nov 2024 03:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1732179477; x=1732265877; bh=Fl8IfjPeTMcld8rU8oF/6
	PMpOsrSYIJKaF2EMCqAW10=; b=oE6nIN0pwg8+2rN+mXN4LT4VoJ1kdbvcitsKr
	r1Z9T11RHSnB7qWEGj1lSItKHLzYpoeEhO5iTRyw/EIbxN8att/2Qy8p2/mwI10V
	hZ65P7wuxT/65f8n4tf7tpiCm0PGcYZPqLJSsNQeffJVvqPpfnt4qzWTNDPMfyo0
	aMTYIOlu97W8vefejr+4QJR+AdEcr+egeJ6MwziXMvwRGn9vh8F7dVkTIM4v4Wp9
	rPpsASE6xZdfBnEupctALIrg/EnoGLYB2oT+V4UWZBRRDtoQe52yECakS2EBawmV
	f14qQ1Vc6yDgwKAdDrVfpw8YIOOD5XmRP92I0AQNTU6mYYwKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732179477; x=1732265877; bh=Fl8IfjPeTMcld8rU8oF/6PMpOsrSYIJKaF2
	EMCqAW10=; b=iZfWm76ljDyB9NJJm+VVyXwQP0LdNTRBnbCr2F5ReaxQmq2YaCU
	QA0VVigsYu7ss1KB5qv/OscXj1K9uhG/HUBgHxVp4/2/BdEz5WxgBi28vDHUXKej
	0A3UyDC/60C7iaUnJMVxGDikoR9VMZD8OHyTcJmXHJzNcvQYt1tpu0pcDxzDUZ/q
	mc895k8D2Au0KKZKMx+PmXxEatR42aC9WYr2n8RVp/4+eoHuzbuX1E6HMQCzzd79
	Lglda9GWcf4dOsvPR9NWkhTuzGaDUFS0HpFJQ2yllkgdccNIECv1sErd0Gd4vuVJ
	RDV6b0ro+xbMXfTVzJehz6wnG6y9HuTIc/A==
X-ME-Sender: <xms:FfY-Z6ur7r4ff3WceLR22U6VdObd_BN4WRYuny9HZ3E7l4JQYb79YA>
    <xme:FfY-Z_fVdI3Taq6Qftp9M1ciEltBTXjRtreG3ZTAaMDZHAIDHHLco-IID-C8U9h9C
    pCcf0Ssu3vsr8ycNos>
X-ME-Received: <xmr:FfY-Z1xcD5wXJwvFmBdGIcFRCPUtL8seZNjkxrcwvNS9U1-PHOxGWqqU3Wqi8Af7UINWBPDgBQVUR-m6yJCnVC6GXI-L9jqYVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeehgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqne
    cuggftrfgrthhtvghrnheptedvudefvdeihfeivdeufeeugfevheejgffhfeeileelveeg
    vefgtdefiedtieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomh
    dprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehlihhn
    uhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghr
    tgdrmhhurhhphhihsehsrghntghlohhuugdrtghomh
X-ME-Proxy: <xmx:FfY-Z1NnOHGvC72ujkE2SMcSQm_x6PLK9BOEYMCkmzEynwvxT1pjdA>
    <xmx:FfY-Z69UoFg-j3jZL4gRj_zZ6HzCoI3EQIcNlW8HKF7gNYF_Nlqzog>
    <xmx:FfY-Z9Xkkxzbo0vksN_aPd0Z2ohJMPrj-GKoYxbIrLc9YZT-44BChg>
    <xmx:FfY-ZzdeiScJ98db7qC9eeKvQKXubbCkFO4SKiVsBeWYkR7wjoWSHA>
    <xmx:FfY-ZxmofjsZ6i_GjPD0onAWyEHFDGZZbNpEBl8xBNpufsbQCGIlKba6>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 03:57:56 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
To: Tony Lindgren <tony@atomide.com>
Cc: Paul Barker <paul@pbarker.dev>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Murphy <marc.murphy@sancloud.com>
Subject: [PATCH] MAINTAINERS: Update email & status for SanCloud BBE dts files
Date: Thu, 21 Nov 2024 08:57:42 +0000
Message-Id: <20241121085742.3037946-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am no longer employed by SanCloud, but I will continue to look after
the BBE device tree files using my own email address.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Acked-by: Marc Murphy <marc.murphy@sancloud.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..0b20b60a212c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20451,9 +20451,9 @@ F:	drivers/phy/samsung/phy-samsung-usb2.c
 F:	drivers/phy/samsung/phy-samsung-usb2.h
 
 SANCLOUD BEAGLEBONE ENHANCED DEVICE TREE
-M:	Paul Barker <paul.barker@sancloud.com>
+M:	Paul Barker <paul@pbarker.dev>
 R:	Marc Murphy <marc.murphy@sancloud.com>
-S:	Supported
+S:	Maintained
 F:	arch/arm/boot/dts/ti/omap/am335x-sancloud*
 
 SC1200 WDT DRIVER
-- 
2.39.5


