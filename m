Return-Path: <linux-omap+bounces-2635-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4919C2636
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A173AB23853
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E8620DD7B;
	Fri,  8 Nov 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/uyDmWC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE920DD67;
	Fri,  8 Nov 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096367; cv=none; b=pJxej5KrnxAWNdBAAY6xmbfOJ1dfVwX4qKcYi4BQN7kMAC/XEvDG3lSc3ix3fo4fx3Qe0t4A/OkSFYwLQLN1FxVTZr88vactfZVGMHjzVyBzt5X4Ig9frsAzDUhREIFqfaJS88DSGfNwhFQh2exebxBuELTYVN8YgRhFP1OxVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096367; c=relaxed/simple;
	bh=9Z+/f5LdEfWAwvaQ3bA1UlqChoTTThOVOjrM36++tIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLcKMlMYxIMdqQRJ+TRrqAtbFIx9QL72dB9wnvrhDqgbkWzAnYktEA8UcaeHkPHFQM7xmxm5wlVmpDBZQ1fNkX1bBeyArxsH8ogg7UEz1cnX7OayhAn0HyvKKZdZuzIUKDl7jE/0Kcvb68ei5/g7qbkvgAQlVLFSvzoqCsBWX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/uyDmWC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso2235560b3a.2;
        Fri, 08 Nov 2024 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096365; x=1731701165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MixVMk/wslAw1xsTOkN6wfczgHqltXmLX+pKvnNl3Lg=;
        b=k/uyDmWCdfYU1fO+LSjV12V2WVbcxBuJxZfJ2rXNkPZ6AZXqrbmtGxN+Dcx0B86KSn
         hwRN1xZ9YGNJn0R8XfUvIfoy/lKTbX22aKGjEy5tT9TYNojkEbrYLWs+blonR8eXZHjH
         raD7SSFZ/PxjOrOuvDK+kq94sp1qEM2fkcerEilwi9PD31z6mwPHN/mKab4doWLS3kvw
         Zh/NHmHi/mqyXo+TYrsic3YuaiABNfPhsQji6Wgv2Tev2kAOolojnG9GT9QQTITi+CLF
         taFzAF/g/pxIZRXY94UR0z6IeFOicYpdhSIiMe+iiGV/mTdhDptr9Z50uujJbFxkqHxS
         lrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096365; x=1731701165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MixVMk/wslAw1xsTOkN6wfczgHqltXmLX+pKvnNl3Lg=;
        b=E3V2FApJIpvLMKz1YCaQ88c05BcQRKmgECSyL4P0bDmrmofXOLfUt37Wpy+umINsTY
         m1wh9CPKviWkICxmLvdVccCwT8cMYBvzRiKHaIo5nPMaWdFFfK5MONQMolpmbB/xC5Yv
         sApixtmS3+3ITiCHRfb72BtThpxlbcgZyyi+jttv8AWgK75m3buasAxKacuV3Fo+waaJ
         ViZPqwlxkkAztzghqz4jzKCDeg4ExejHnp75BfQuIS+F6scs9AvVzCe2syd5CqSZKsFx
         aU9eaz7ZebhJVh+a+ycOuNHoYPbEcbo1WkQA8LoZFK80PRwkMXT6xtsLa9kBSbUrYN5c
         1M1A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Bw4aH0bNRREotsVtxbknh90uv0K2N0pa/te3p2/GdwaTut09uOZlLASO6DidWYy5hrws5K0Xo2AoBtzzwpPi@vger.kernel.org, AJvYcCV4cWKvyyyfmiV75VLv5Ok5DBizhnjzuTnKHS00a81DWozOVwjkPEOYIRJq8SMzcWh6zk8Fg+ZtQZYsMoyZ@vger.kernel.org, AJvYcCW/7cSI/I9LIOz37Ugu3SMGFsEegLZj/SuWHOlA0sA4A5KlZ2iuUxQn3tIsE6o4uwt+iQWTF1hqlONe@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvBAKyc0uLQh+7SilNFoivTZL9Wv+vjWXPKymzkGnT7pUzQ3D
	pkM4V3rkN7stA0AE+KNZIISelKCDBTIpCeKoDE8S6s8MRupBAwGF
X-Google-Smtp-Source: AGHT+IH7o11M93UClWtTtaFbiAidNYRC+oB2PSMV8zE6Xekyw2VNGFNt3IpJUTSxb/NoeMwagI8ZrA==
X-Received: by 2002:a05:6a00:a95:b0:71e:b4ee:960d with SMTP id d2e1a72fcca58-72413290c8dmr6281896b3a.10.1731096365103;
        Fri, 08 Nov 2024 12:06:05 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:06:04 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Mithil Bavishi <bavishimithil@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 09/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
Date: Fri,  8 Nov 2024 20:04:38 +0000
Message-ID: <20241108200440.7562-10-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
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
index 32978dd9e..4ddea1a20 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -139,6 +139,7 @@ properties:
               - ti,omap4-panda
               - ti,omap4-sdp
               - samsung,espresso7
+              - samsung,espresso10
           - const: ti,omap4430
           - const: ti,omap4
 
-- 
2.43.0


