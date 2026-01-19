Return-Path: <linux-omap+bounces-5549-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F63D39D01
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8E9930069B5
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85982DC79A;
	Mon, 19 Jan 2026 03:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY4VtqG9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6D2C1590
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793459; cv=none; b=CW0hHOTv5FUtsOnaJCV7+aj1cUa/UGN5VYGS8oEvcK+I8fzM7th/0ixkhN/KXtR5p6njRIUPd/pHo4Ox7NRXvdCU1Ok9W86vLxNfoDCMU+Q2kagdjW4zIYwbBc0ylDOree15x7Lnvjf1tRDRhp1c9p6MhhctwDAMRs7SHy4Seco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793459; c=relaxed/simple;
	bh=sYgVWqZsv/TROqvYUD+azJpccjPNPUbbOaignxHHa3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqUQwW7yWg9+49n6qxbLpim4XMpPxklk6PdEwUgZYisShhLLDUaANBT10JdS2QXQRW4omdNQ6c3R5yxZDgFtHah9Smzs3EvDAJi222Eq4Sdm6CJRtO8dyPiVctHIv0Y11sumhKoiqBhY+Wbc0Eqr/MwE6WZgWDtgGTqqNbbyxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY4VtqG9; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c5384ee23fso427960285a.1
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793456; x=1769398256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJZwBKE1B5fG1xmzuppeSdMMZvJUhNtvUP/Jy0XEbK0=;
        b=YY4VtqG9t0lbCjFKDbjmXsBlMhEoaYTGUD9H0HtzmHPhd5bMXfpLXfjkDfHafeU7HB
         ymycm0kFihWdsE3LMOR2FY8n2Db9Wdtn+tfZwNLyZOTsAv6/oMzSWoRLY8K/xspcHpGI
         oqtlFyseR3UpQlI3og912lhQ9iftK3aAciFZHlolnvB+XHurCLGhqyBdTXW2RHjDVSUY
         mIuq19R1v0OsHiGFsvlg55W7Sh27cgqHR9QYaulLPk/ALfdXu6JjziCnGU90anK91x3k
         fq0jmqrf7ura22p/A5DBgR9/PBIFyQFgrK3mntpXhjdYnaENvtVfwjVBTqF+uKWoe1CQ
         kI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793456; x=1769398256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJZwBKE1B5fG1xmzuppeSdMMZvJUhNtvUP/Jy0XEbK0=;
        b=QEfU6jiWQDaTrUJUkcSdS7o2RCALIzOhtc9Fn+DyZtB6HOuHwy4md5pY1bnET5sGPW
         9langfWqglcUFFDogQHeaW6PfRwustOD0EdYQ5uxxs9ua7EVCUoA7c1a7ZXTDN3mSOhq
         5SXjAOcmVgiU8GS962F/Yj7/cUND6rDwDvXc+jvPdJecRH7KyQzHVAq/mfcyIYkrIioX
         eFQadu2HdkfJAY0MdrWmr8DUk7BvAbI+GPLRX8jKtCJqBzJqxdl1vSz3UR05t+JKYHVj
         2UF6ogFldW+udfSyEQpaX1fK3o95Rcoeajse3qbLWnG8SH1mGmW3DNmOmi0LKME5I0a3
         jzyg==
X-Gm-Message-State: AOJu0Ywf1K5vfGV6BBMPcxLBHHv1BwY53Km0ZroJqUtUE2QzJGhUUhRn
	rwdsgYjd8V30ORuN6nbv00k20gxzqm23qlgmZhq8w6/lK4vL6UjHutqB
X-Gm-Gg: AY/fxX6sJ+hmHj4vEyGHwqMrmwPfBFrAVmwZTiNk+SS+cd90mxHyG+u6H3NEdbew7Ji
	THDu+KkcA1BuU+/3xVduXdFX7Ty77H2Yoqlp1mTC9l+2npnMMr1yuzjUk1i5a2mjb2lVAsr4n6x
	nkYey4z0dRFwJlUQRHoGs4vxj8PCiYIudcdoPLBXuoqS7Ewm0ACwtQdlMO+c5oV5NBsdlV3zLVI
	5U0gn1ss4Gry++ITZHx6cIjB31yQspK6KUPOWzQOikDMPaZbkLHH459MQjW7Yb//SY+RgFZhwiR
	XfZHLamycH9neFY4xh/NGhS0ncl1qW0omoV2LEmY96VsHkK4XZmaXxFjdS802DsL1XjaVXqJ5Lj
	/9d8dE+vgb1zRbymdmHWrJoclWH6wKbU4uzVTwcnCAEBEaz4iGJ148zQmNDEPsBKBkxYaE+TuR0
	EstbPSO3J6dHY4nx/VS9BW95GpeR4OPdD8upvNXxN2Ci1jbVnhse/Cg+0FWBWfff/V0Pg=
X-Received: by 2002:a05:620a:1a1d:b0:8c3:9be4:b209 with SMTP id af79cd13be357-8c6a68d8c70mr1274200585a.20.1768793455695;
        Sun, 18 Jan 2026 19:30:55 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:55 -0800 (PST)
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
Subject: [PATCH v4 09/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
Date: Sun, 18 Jan 2026 22:30:34 -0500
Message-ID: <20260119033035.57538-11-bavishimithil@gmail.com>
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

Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index d8774c676..f694dcbf2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -145,6 +145,7 @@ properties:
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
               - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0


