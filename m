Return-Path: <linux-omap+bounces-5544-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9ED39D02
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0629730275BC
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D72279DC3;
	Mon, 19 Jan 2026 03:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnRch5G3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8775299959
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793452; cv=none; b=JX9vlv9+Qc347e545LEr1tNqwpdXsE79d378tiWwqys77AqTszNouI36+jSbGBLzrz8H+E1puXBjDvPXBRasvn9pC1SEgWrjmc4r72dGX3UXOEabUc1lwmGE6ue+CrOJ+gTaoJg6nAHzexGzAfTZLI2AtZSSWayViRHEeadEcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793452; c=relaxed/simple;
	bh=5HxovrdF1LsVk8dy4niAUAipDGB4bXXvyb7MpvuxIec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlzSTxzOPZP/Tm+1HyueJ/Fy0CumaxkiCbCRz4tEPA/5C5Ok4OfgnLsq96wWuEIt5QoH/RUBBgDhcGxyaYPGgP8NXv/40Isxt9HiW8HXATW6ah+2Wn+peYTEkMKbmbnegdoBTYFj4Q2WjfH+nbJDkccnDJz3IiVIUy/1WWvy8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnRch5G3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c6a7638f42so449970185a.2
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793450; x=1769398250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NkSp3Qp2ev5DvLNgpn6PFK/BAYbn/itTgc2RCCe8u8=;
        b=gnRch5G3HvvQvowU7nsX/AwgITvYYUlgysrpu6cCbXTz7Yrd0qtlLBeYbCcZO7v9Ae
         /RLAp68QHxroPX2PU+md/EBJuINMseyBsaHkmgE2r+FGy3HwH7kjqH1BysaEKtqdDe3g
         oy2hBxe4mDgadgelw3HobIebwAujqQAORDdd73caf64W1+6zPTAgmXRVo0j8ZwYtNUJr
         ZLw7CoAPjVKzZ08RgP4Ov8qWFHMCBcWl9ejirE8Aa+WkgdtCIf0efJiXha+InN4QVmyV
         LX0wSxQsAxBldcI6WAiC+SY7vW1AOT0qzolDRP2B/0tzI02/BsJWHcw7dXeNLzgQi9Wy
         THhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793450; x=1769398250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NkSp3Qp2ev5DvLNgpn6PFK/BAYbn/itTgc2RCCe8u8=;
        b=PY0vLZzG4M95sddlrY8mxowBgqr8/H+wdBAnVX5q7tasSIsOfO5qZl2bT6NU5V/1Ik
         3JZioUfiZ+jhShmhlkmHw0aoPY2a7HahCvV6w8H2u3+Nusss9fpsFNsOZ810H6/L+3U9
         Vrk9hEImDNeoud85X+vKTG/ExEDYCSbFwxMFB90qSBrBVmQWseMnEVJEY+iNvLguUF4d
         PF4hTiTj5jM44XbofFTbQ+fwCyuVZHuoaVQpwb6pPDx4ZT9nQ9hif20L5PGrKJprSbof
         gv/EfA7o0mk61c23pEuHuW2leK9gyp88JrAwY6Xz8kQ8Xz7eBl9NJIYnRo1K/PphE23J
         Th7Q==
X-Gm-Message-State: AOJu0Yx4JE4PTlsr77LTF08TmJf3mGO0co30JHtqDjb15bcpWpzuUzMt
	bf7TMda8GlJ0ZZxyAKuRivMqCeSmdZ9G7oBislngWOjZ2nONYDbAOzP1
X-Gm-Gg: AY/fxX5cqPRNrYem7mEzkki7ckvnpqGiofHNn5ANPI1C2l2Vgf3q+OB4uhbjn4CwuOC
	5Y+LemJ6BV+qm6nQp190RZxemJY1KO7BLwal3D0U8UqUBxnGdw2u0tVkj53sEhX6fkew5YgpjsG
	b6oZ2vtlhZ7W4hNlFtqcyJcsXMWw/zwf5EvIM2hvJtqash8dxwu2qINMWpcNX3RgHcNg7Ib6bOB
	LuflxYXsfMgzb3vOeueFjAq9yyeUNwuMG1jzcSw1eXqhRhkI9+VuO0Q0ohN5n3RZ8ESg4U/s3Em
	Aeit8OC+gElh2i70zdiVUH712SVJsYHA/HiQcPBefNRRDl6gNLGw2pR4S6VDT8nTZTrG7RrDUhD
	+mqIn9siC9OY8ViyidrGDPSh7PJcDaJMuum1AFvjbWXfsfSgWTlQYOuF/cl6rbCsJC/qssAYPBT
	WzEcZFwqIxzsa/l5uW8sxr2Wcr7Gj8z2Vxh2GqhgTIoDD0LCAKQOQ/iND16SMeAKZXwl8=
X-Received: by 2002:a05:620a:4729:b0:8b2:e8b5:1ea3 with SMTP id af79cd13be357-8c6a68ec4edmr1367928485a.28.1768793449722;
        Sun, 18 Jan 2026 19:30:49 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:49 -0800 (PST)
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
Subject: [PATCH v4 05/10] dt-bindings: display: panel-lvds: Add compatible for Samsung LTN101AL03 Panel
Date: Sun, 18 Jan 2026 22:30:30 -0500
Message-ID: <20260119033035.57538-7-bavishimithil@gmail.com>
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

The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 68c16c1ae..b31c67bab 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -60,6 +60,8 @@ properties:
           - jenson,bl-jt60050-01a
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0


