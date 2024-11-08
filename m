Return-Path: <linux-omap+bounces-2630-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455E9C2621
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17DEE28275E
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C411F26F0;
	Fri,  8 Nov 2024 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9lm38h1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE51C1F10;
	Fri,  8 Nov 2024 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096325; cv=none; b=dNh11RpJrRIEeJwcJCOjTmn7Tj4luIeQgo7VjKgBZg34j0/K09D/m+8S+fwXzm84U0YMjHc9DdODKI0AZNr5gqb8Ln80xh1s/SUkeX0ceEHo8zUj+vAP62kabYrATYMxgBP9wuxeylBm1Hu9PxDp+Tg5mXBh122NbtA3+lb4Qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096325; c=relaxed/simple;
	bh=UTJqTXnMKbNFkXWrPoN4J65UMdTzGvaS14bPNj/U/+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehSgyNMqF2ePeOz7BWZMdFlXNH7fu/X5rnzX7nSihFyrdKcUfE6Eji8Ope0bIqegx3eO+GqJXFc+0XBr+9m7mJLl1+j4N0eT6CqB0izLaFWs7wwmIYNxFhhwrBnmeHN4JH6zB/A1sF276kEBCwv6MLGCCuv/MZ0R8InhEzPQ4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9lm38h1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7240fa50694so1627592b3a.1;
        Fri, 08 Nov 2024 12:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096323; x=1731701123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TnroM0S8Xny+JCi9Lai+ZOcGXjw5KQQTXaY0agxtWM=;
        b=H9lm38h19NONElCUvtpqi2enTrhvO8+sWIOaTRxPkD8eKXvfVkjeZLHpbmubnqm4R9
         ZKdRKmiorHoyXHJsz+/pFGa9DfTxVrkyhPjvymG0fS2pEqAN4vni6LJqzb7Gm9KiEnX6
         4IWU7LliFvvfq2+eFXz8t83m4veC53UAA9nW3o/1bPDypwkGOXQpmQ31vVkbGsSoBUm+
         AFtmsCwuWj8wK0SfrvvYDzmkLh+Olt5AX91N7mQMiuN7jkbbRK6xdrA7jrIihdF2vvpg
         07O1GRqQT+/83J5+KwerhXWaumCPLtchpj/c0k1xzNz1HgrHcdQaOX8QWKpDTcF761ol
         Mg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096323; x=1731701123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TnroM0S8Xny+JCi9Lai+ZOcGXjw5KQQTXaY0agxtWM=;
        b=ErTAwwid9gol9V0HMm/a3qKWaooUkvrywO4pS2tcGoCuEjXHn28fi4ZeUEvfxpIXxF
         zgwi+QCkD8NAdx3grJYfdOfnmHAYqlHGcsLu2sA/M39XBncwnp0tc/CPNOxdtWX7H9ZO
         CDe3ZvG3fSBN8d3xcwLD+ExJaQ+b0r9BBJUMMkByeeboblIhpHSOVcnLiiYj2i16TFTk
         O0TjUmD5/A+PeKYakPUPc+hpm0O21rpBySc2gOhEwMLuiNBshxQ2tTe6Sv+9pQBN/YRn
         uPrxpNnzGdMZ5pEun8+pGefhSJuCltdh2sH6/vAHSkiyoRIyM6j9Zx/wD6pBRBN1s0Pb
         LRcA==
X-Forwarded-Encrypted: i=1; AJvYcCU2WOdSaeHff7kQdYZd+5uT1XhBnCoAsFVojmOLEzN2LmJwNGjldtU6qtqsVLN/tWsfOiAW/wfwH1Ay7ndnTi34@vger.kernel.org, AJvYcCV+OoSyDith+w9U4wFl7f7DqPXAy/h8XfYNykMgZEm3wKvVDoTB3DIAdYQw50nuIdHpbNBMHZTQss6Z@vger.kernel.org, AJvYcCXgMPLw3c4V0sy3o/F5vhE2+WN1p6QjJ0CwgLiyJmzTgIN5fChadG24Lkc2P3nsD4ohKkRdywHEMzDIVDtB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb75kJMoqGAnUjkJPDlJBpKSxdBE1S0TK+v5Dl3km0kkMGE3ZS
	RYsKfSvgMrr1cFATUEnbiKTAyp2iBoeVqkf5E210FBEznu+LRqtevanN57j13E0=
X-Google-Smtp-Source: AGHT+IGtm+j88SKyyeHLrp0K+VgKUxdy2Xk1X1xe8FR0CLG5s8B/59rD4gPB4WgDi7CTlBNjoQVZmw==
X-Received: by 2002:a05:6a21:3b4a:b0:1dc:2360:17ec with SMTP id adf61e73a8af0-1dc23601829mr5582468637.18.1731096323574;
        Fri, 08 Nov 2024 12:05:23 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:23 -0800 (PST)
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
Subject: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add compatible for Samsung LTN070NL01 Panel
Date: Fri,  8 Nov 2024 20:04:33 +0000
Message-ID: <20241108200440.7562-5-bavishimithil@gmail.com>
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

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 155d8ffa8..0cdd05d10 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -50,6 +50,8 @@ properties:
           - hannstar,hsd101pww2
           # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
           - hydis,hv070wx2-1e0
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.43.0


