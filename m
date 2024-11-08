Return-Path: <linux-omap+bounces-2631-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151909C2626
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FD1282D3C
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7511F26CA;
	Fri,  8 Nov 2024 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlbHto8a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7891CFEC1;
	Fri,  8 Nov 2024 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096334; cv=none; b=SGmlP2piIkDDJUGyEAeJpq9OgB5l8LkitnXIlNWdh3I0V4HKEdOHZv6I0cG/TqMduCdkE00U86k9fhTYzVQgao1T+cwYS9mTLOC4PIkmgUL5svaWpnI+/5i7HO54do30kJExWH0VaMTJe+MM8Cybk1mkHWGD9VnJq7JkczIVOEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096334; c=relaxed/simple;
	bh=p4lIjwtmNBKtjStZ2E/zOaVP+OCzrp7EO//R9mEqIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqXf0+eK5zeCyjvQrj/OAguJWpTWz7OPBIuT0fODcG6+PxCVAu+HM1TDOItsutMO1IToNfS76A5HvRk5PfOiZcbdkCXwAKQRVf0x+wzRX0v8Ovu2yNdmS+luh2jMGF3B437AQ9Rl8lCn8HeZ90rfSvrc5s6ntrPLwMQhAs+EEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlbHto8a; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e681bc315so1964463b3a.0;
        Fri, 08 Nov 2024 12:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096333; x=1731701133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DQrmyvUoy8Qxlg/sWb3GUfwZsisNLmKE8ES1NvInQY=;
        b=MlbHto8aEnD1ipyNJKES7SF6OrroXBjwUZJM/q72NfySvkJTSP7mNAv3dVljnYUwc1
         i1B1gPj1ol2HU/ujBjWC42CQvzmVbVLvse1Jx3R093jTh5Nmz70bBut+xEOTAFaOrdZc
         /4+vBHLl1dMytdKwfdKAjGtSSYL+W9ZNeVGL0jvN+mrsQ6AMevJ+J7LvppK8MPNR5sIT
         tL5ccsetqTl8+sVfiMHqkuujq+o35Rd98MajaqgyepO2wk8ln0s96V2F2Z40qBKy18O1
         OdXggEhgfDWqQMqsxOxppmgdu4ydwou6uUJythasuE3Ng7wsEhsDMBnnH8yyNO1f4aOV
         EZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096333; x=1731701133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DQrmyvUoy8Qxlg/sWb3GUfwZsisNLmKE8ES1NvInQY=;
        b=HH6QZd7ZHGTVJ+dzf/09KmXHcBUXORksfm/Xty7mV8oKlz0ooYHQOT8xZGjerVG1LS
         RKV34v/iHuhJoLTu0fhEoehLfwcLaBvcNtnb5PqFsGLijzVgoqrwmt9Z9eM2rE704TOB
         KvyhSAudWlZxjxiGikQln2Il/kYFCvEh6r+uZyQkf6nHv7+p6hWVbrhrlkWpqKf/+HQ+
         JdOJ4LPPO5dSjuMe9CuHQrYnGz1oIqwYjZp/+IZu77pPjdU8mf62tdmP3FZvm3k9odn5
         0x5n5L3UaBrLYy9eZDnRA9jZ8L++BAaxEQB0VA9u+YCPyxL9HYQLypkEBJyTPSYPyJh/
         1zaA==
X-Forwarded-Encrypted: i=1; AJvYcCVt+UrXluJPM6MVM7Ptz5qlM32p6jIecVw/gvLRgEDHKwOJ6GasZg856Qas4q6p3Ls2lLLSVgXntwEXabpXIM2n@vger.kernel.org, AJvYcCWFR2HD8Sdh8vRsV8SC2cVP+obmtgyN2OLFkHWFH0l6QPKm93GvC8ZxeD/5oToEHonKt7A6HIK7hJoJxG8y@vger.kernel.org, AJvYcCXCQb6nKeCEMUcLfdbNbWNzWvZPycot5R7FURhypPYfxGzlu7C7Ww2n9ka7wONyleTlv6cCdT5rWGbt@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/1TvZHCW8F9e6MeIhae8EGVeAEuETvvKhdxYTk9fDybHekRV
	Jkfc1Lud5TkuQALNN4aqsm0iofYrhXJxshIUkEnJfRXLzRcdULOq
X-Google-Smtp-Source: AGHT+IEBDpjZzXfnVHwO2ss0VK89kVwX/FZLVLrryxr3xjlDKEYrfiwufADuBXcAKyGSEpGJlvWSXw==
X-Received: by 2002:a05:6a00:1943:b0:71e:41a6:a0c6 with SMTP id d2e1a72fcca58-724140a4ec8mr6229167b3a.13.1731096332673;
        Fri, 08 Nov 2024 12:05:32 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:32 -0800 (PST)
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
Subject: [PATCH v3 05/10] dt-bindings: display: panel-lvds: Add compatible for Samsung LTN101AL03 Panel
Date: Fri,  8 Nov 2024 20:04:34 +0000
Message-ID: <20241108200440.7562-6-bavishimithil@gmail.com>
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

The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 0cdd05d10..82bcaec68 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -52,6 +52,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.43.0


