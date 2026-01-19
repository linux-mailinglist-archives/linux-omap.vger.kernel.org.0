Return-Path: <linux-omap+bounces-5546-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5952D39D05
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33F81300F65F
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E732D63FC;
	Mon, 19 Jan 2026 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctGfwPBd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1762C0F95
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793455; cv=none; b=Q8kaRQtJRRmfFGeD1gtsw3Z+4ygNSF9uxch1h70mlXe3iU6YgiA85kFS/HFztXoyVdhibl4r6CIbr8NtJe5pRI0tOtiQOMeOpu0xiLrcGXXDn/Z6S2F7zmdnMcfw86mN4BdIMmAL8VWSdWf9tbcWX8r4eWCjUKUw2djTSVHinIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793455; c=relaxed/simple;
	bh=Q3APeXQDiu6Dq0YbUctJvWNTMdYSUA/70lZgJEy7pCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVAaMk6meNYnduFxPgk/7TZ0EELCfYUnkpX6An41YRIXowk46vIuX5sA+4KOZAFybXWYeUyiM6FG/X1gOgk+d9t5JQprHi0z5eE9XqRFpv1T3ikAPBldNQMfovYPzcm7o//u8OsfhFIH9Hqka/TT2waAv6VB4D+4WKYO0mLzXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctGfwPBd; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c2c36c10dbso454292285a.2
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793453; x=1769398253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiNtJwtw05QrNdGwEwvWFIn9UYOv/0m3Dr4ujrTo53Y=;
        b=ctGfwPBdcvMDrGDsfWYHtMYlcSDhX4WNYa6JCQ70eTIiJeoi/ZiVrfHESNzb979W7H
         y2FCjGyZTGCbgG4IbyzDjB3DiuXIv6f716EnAsKZq+xY3H1uEQxxlF+T0jx7bg7uCto7
         n1mq/JfMf3SyxdHqN8It/9hbCOM3qTVlVg/t32wanvMv8a9WVJJPZbK5adq1dP32hFMC
         /+C3n94/D7eW0Eb1M+CdB7plcm4Xei2BDGYOo/+wl+fouhRHPfZu9VxyxB7NVdV+4+Wy
         Hn7iW529Oy0pWhHHN4Ih9jq5ZmOUiC/nAMsirMwCPqvS22BpV4kfl9h1jErS4eHfmBPl
         eRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793453; x=1769398253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiNtJwtw05QrNdGwEwvWFIn9UYOv/0m3Dr4ujrTo53Y=;
        b=BEL7h2V/xfBia92N5GOsW8lpGSKpWzk38vWD6djbwDZRrDvLPXzh0e2ehk+cycUL3f
         iDkvHTz/X2yesJNi7XEMVVfF17NJvIGzFAZC8gm2KDZc20dj81rHHCkJ7XFt2Zr7g6hP
         M3UGzqm6lHoHFJ8hlLUdSn2IAhZRAX6TU6NL9PrbM//NKLwHtRDCZwgbFtfvK3nArYV1
         Y78mtmcffHa/mOfO5IdHFBxAbGviotYa+8RZlZ0gDGtkLosqTUzt/gybhEHsBHrLlIE6
         w1VoW+fXEfBPujY3xWDQ8FFNGwfunFN5k7hn05T56OcYWaPhEz1CfdnpcWyE320sCDYG
         2Dfw==
X-Gm-Message-State: AOJu0YwecPy29/HgsTdNtxtpvyTzYrhir6N14JYzb2T0YlAcINM24jKg
	GNeJq84sc9Vjpdt10kIKO9JahCgYGw1IPa8Fffb8TXF/uiosFxB03kfW
X-Gm-Gg: AY/fxX6pJ5mY3bSCVhFAZ8nL2qdu44RzlTXydnlb8Htfavr8SvgVkyZccW3mWpLRKGp
	FlHWy305X3kYc9MXmGajMwgHwX3vFekgW+q70J61W8/rytbV2fP0T5TkP4xmuqZQEWF9Lm9z0W3
	HvylqntQRR/efJlzZUAubBYGtwjblShii6c4W7zo4crImKxYIqFydOH8ZNDTMniZmQEZZyrhuVS
	vqiichAeE3zsZ867mK35QKMXWXxGOoojrBrd2BypgVfIMFCzH3v5sajFWoUTID75tgvgIYSPPn2
	eiJ47f+N24e4Y/jkB1UtWsdZzzpy52Q17xiT8WSAAiOL14UP4AM7hTqmhbDWyu4FBzwo0Q+11T4
	xVyylWgwOGyuf9qzmKZEbE5g4F5yvb/c3m0o6ptlCz4UDPWjp/tTz41R5t0YINLJZSMHQgZZ1rl
	GDOEI0iU9fMXNsjAwQwC4jZUEuotM3zhQyjA4qsO9JfXYWVrC7yCc6IOq5kX8v0Z+gsXc=
X-Received: by 2002:a05:620a:448e:b0:84f:110c:b6e8 with SMTP id af79cd13be357-8c6a678b831mr1437612485a.68.1768793452693;
        Sun, 18 Jan 2026 19:30:52 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:52 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com,
	bavishimithil@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Date: Sun, 18 Jan 2026 22:30:32 -0500
Message-ID: <20260119033035.57538-9-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 14f1b9d8f..d8774c676 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -144,6 +144,7 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0


