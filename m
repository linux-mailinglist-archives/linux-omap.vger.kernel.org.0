Return-Path: <linux-omap+bounces-5542-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC8D39CF9
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFF9630161C1
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786F928642D;
	Mon, 19 Jan 2026 03:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp8uDvin"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44F285C91
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793450; cv=none; b=sqelAv6+R5JdqnRbI8UqYdtUdpeuKTNd+cVobMsT4/Uy+Y9GZjAf4ZMDAjzO9vBMHg6GZeLFobSoLAVz1HyeQ/O314Vv4Cta4y6tlV35E+U0ID8lxfVqsvG5hGERXDCaYBdt2DFOI51uSjs/cI6L3MeAAQ8irS+Q6ODcCALYVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793450; c=relaxed/simple;
	bh=eLdlv9TEAKtAVrbAkOJSd2uzG1zAErgJhfjsS5MIxoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrAomBzeHTj3uRLQc2myBekhevc3EDsSD8D9/dqOL54XWGekHUk+fHEpjg3R6/6CKUvCKee18+obdmFNuECcT5gEaywFRAbBaHbv3at5Tq/7RBQ38zIsBjlGS6DSXIAxIadYiCJepjeHYVrDEbFXk8dGCb4LzlYeNSarzlck6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp8uDvin; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88ffcb14e11so52361746d6.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793448; x=1769398248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT+OlgLwisjDHGRQGA0CO4AmF6Wqh7tGvnECOOk06AE=;
        b=Vp8uDvin6Vl4VNt0Bsp5GIT18BgI1C2ommmoJ4zIx/ZkpRfx0lwl4mfY1eCreZKJcH
         mGONuCcyjz1MYS9mIoMFbMTtHa4yx4NDNqYX7EhimdEEm7VJ3wOksw6booBT0spT0agM
         YJ0nNJCuxXJZbm4diBU/xRzKPYqSaNMllEfI1Neo10wAjYQ+K2XaMGFDKpIpBhjmcjq+
         0UIigk0Kym5G1XdCb/o07jqq9hb9BntzU5QLLPSBCn7rwRjO6ogImtT0RhATM9J9g4mB
         yc1deJ8LANj8bcI8CJxSh3Isvo3JuTtxmimx6sLThkRDv3YmyeUaSkjw92uCWRf1MkBl
         FZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793448; x=1769398248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xT+OlgLwisjDHGRQGA0CO4AmF6Wqh7tGvnECOOk06AE=;
        b=H6/GNUuodAiHbRDuEpu+Qd5G0JadLynFtjqn/+E38BlZP+ZNtd3NHrtQsuRjhQVaLC
         wUkJ4YPrBFG7uLaYZy/9NGPE4DiG63LqDzrwxK58LqevjVBYNbk1yBGeNWuX309zW31D
         CuKsG6XJjAGWqSoC9gIAoHRUSp2RJAHD51kAufDzLpOe0cgtabeByNBs8mQUGetnBm9h
         veC1o8Ctbi/RjFdWviH2FrTNZ2sY08jznurI4/AYlv7WxSqeGItBXYQgqzym3SiQmW7L
         wNt9bpUd+tZhjKBzEU4x8Unnxse/rvGFnzH2X1wa5bdqVL8huqbslzbwC30vVwvQQK1h
         Lhjg==
X-Gm-Message-State: AOJu0YxhH8rsMqX7DcNQ2zRR8VstJ+usTyTzHsWFUA1YGt5HMYeBmp4O
	/kKxebLCW+XRzxHIBNP42pK/FCLp6v/39sMUtoMeP3nvR1TcgtS/7YfA
X-Gm-Gg: AY/fxX4/NQuKVbCLSGdWtVhX64IcX1Sv+NOtaT7xkvD5BY2wittaJYcAWNLYkQe65Kw
	d8U1vUSVaYHGEYX91+CLGcfojsYoGjM7LoLzt4DXTZFk7wcD9CfunBeUJcvOK6/UZxT3Xn4TUGr
	j+u7/28C2Wmb+PE//sIRwOVzymZAG4Jqupg5r5ghb/NrOsGWYP7SMqsffd+5s813FbkI8ZnwuhE
	p9t1MRSnLVNLvgLHuY110WbiZqhfP0aiZHHzrCVSYYjV/TDt5x+rwsDFbZi1304JyV44R7erkVi
	JqfEKbKaIeAxUOvLv00H++9ZNTphkW6xFdSUOmkMWJNe2dKXE4J8NAOqBop0g+HcA9aNznid3hk
	zpYYmVmn4wCPkETByfpdBFcxn5FbgjIpBDyCOpIO4c7DnmsbnBe0ocsMSDXoigZa4Wc1HhJuNwX
	NLJ47SoqBpWEcZKQorPazDm3tiENehmXYVqFv7J/328j/Wh/S+7NPVrLi0A7pHhVVORn4=
X-Received: by 2002:a05:6214:1d25:b0:7d2:e1e6:f79f with SMTP id 6a1803df08f44-8942dda1871mr127151346d6.47.1768793448154;
        Sun, 18 Jan 2026 19:30:48 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:47 -0800 (PST)
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
	linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/10] dt-bindings: display: panel-lvds: Add compatible for Samsung LTN070NL01 Panel
Date: Sun, 18 Jan 2026 22:30:29 -0500
Message-ID: <20260119033035.57538-6-bavishimithil@gmail.com>
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

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index dbc01e640..68c16c1ae 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0


