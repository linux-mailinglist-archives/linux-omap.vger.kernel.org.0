Return-Path: <linux-omap+bounces-4636-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4BB56B95
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 21:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5710176829
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 19:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37522E06C3;
	Sun, 14 Sep 2025 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwtek0Nz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690B2DEA7E
	for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757877977; cv=none; b=S/x/5qpSNwxeVjRrJMDwucBQufxk8Fu6bjwsWbKcYM+vMgWpx2nu7ejL0rDqTS2A/NG38bc2QfciuLDNAF+CGkjrm7YnBgTeGW5wO4QuA0ClGNo4n73GNd/dnlMwmxsyjXOAVdo/A1hlf88p0QxuwFQedoVpshfLR2AyCdrjAA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757877977; c=relaxed/simple;
	bh=Lm5i4b7mAVDGymTe6khqNmqSl5p9B05je89nzQDq8fI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6DGN7IJxj7FEK3kgygc0fiiTxSMfPa73nFHs8kfMHZoA7cRF2V/YYp5yQ5KBex9VwtlHuATJBCa15S5nzttqA+4VNEVOi0MbUOLVQf7GVOla2AFH1yt3wMU9d13qfpXVnO+Kh0QnIDqugt1KgS3eUasc60BoBBv/I89/OMdp60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwtek0Nz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07c28f390eso431152766b.2
        for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757877972; x=1758482772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVTlEPKPlwuib9HCFIdCPPdpVMx8ZMnPeuxJ3eeRcq8=;
        b=mwtek0NzNrIT4ZW1UvQVe3z3ACd6LXFWK1e7PBFKMV8ForJ+LDbpByB9v5562VzzRz
         yQSNNCEeUty4nhCQ9oN01ET3FMX23IpUBMCI34Gl9QHoEVpsrlzuvKOZNifayE3am8Mz
         iuPqbiH2OZb8BscHFuYohImFY3Ti1bcqf0seRoM+cS0zTS4O8xv99oyhWvN3aa/JGVO3
         c6A/aXwt3SSXu8Qv+KKWrsfCERV0SeqQNDzOKH0TdjQxnXJ3ajwEJu2U7sZkqSsDhj/2
         X7DLQDZVm7rmWadRaVhbueERLdutJ7NK2q0kh70NZs03SNG/xljHj5mk+AwYl7h87i4u
         RhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757877972; x=1758482772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVTlEPKPlwuib9HCFIdCPPdpVMx8ZMnPeuxJ3eeRcq8=;
        b=RJLlvgHrdx9X7nReagSZD5aFgOPu9YE8oilZudaTWYxZGB1WNfqK2G9w8z6z0PWyl5
         mbFJ5cAYjz8x7ZiAZAyt/DHWHtU45iSatTvQozbuxNJzryovhsyiVi2o/LeiRCE9IIcE
         XOiqVIkv73TSF66jmCLbm1GT8XG9VXLcm0K+2YcuDZ78mbgbOvdxhxiYm144Y21I6xGB
         xthH/uGtSF5koeQy91HQY+ZRrzYHMVj/R8OgzVmpBLpHXtyF5LxU27sHwDzKDu1KouQf
         k5smii+dqkHaIksomvVoSnV/fiVKC6DwavisU/mXsLycPtFk00W7oqA3BzjFlZic6OuA
         XbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFSGDg7cFjXFAZq0SlaKwW1l18Q38Quc7fdq9XiLoRA9e8xRKmI8l/RgoEUF9IT1DYbw58SzvIS+B6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLKcw5/ZkDF+9kRhRm6l0NjZgUwveuoiMhSDUVyF/4naYs7jr
	lckZU8EhgZyk0j4eGjn4LzqEbjU1PcDuHZo1VUy6lUu3KqxnR7fuaP8=
X-Gm-Gg: ASbGncujqsWWksG/h+T0Ad5sYA7henoZpEkYIj1+QWEEvHdu72BLvgRWLEQ2E2dJIR2
	pIf7zARvtdRrW/I96Gw4VTOlug5lQKJGNRNWQVyAikyWo9758sSOo+3+YpiMrQ4YeISViWV5hXn
	+RSGLWzdGK+56hAAAspD4gwvIyA4J49VNLru+kLRzyTBrhagODPCuy7+XhTT4z5ElcCiPMirl6n
	le2cHBF9iRergi+TDr0/YtUm2C4bCJMvb4uNY04ujti7U2xqBzsvToCK5RILAxmLX6TH+d266WR
	tz9a5n+N7iWPoMz6qPZ2Hk4iCbzeotVQ3RkmG3GgZkbqvxjkRVSruptreXox3MxdNwjX4zjQ0bB
	V5AFcPUlD2HeAdyRsCcyW9E9XTh5ATA9//mQJnph2t/D5vICicV0P8WH/Lw==
X-Google-Smtp-Source: AGHT+IHTzXsvzOE8gM88xrt61pYKRHy5EioOPp0Xw1v1cLK4amMFP8Qrg1NdiSmbj5h++KW+u3JMqg==
X-Received: by 2002:a17:907:7f17:b0:b0c:b51b:81f6 with SMTP id a640c23a62f3a-b0cb51b85e4mr435788266b.43.1757877971562;
        Sun, 14 Sep 2025 12:26:11 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:226e:7d72:f695:46fd:3aef:7487])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07baf35488sm707841066b.38.2025.09.14.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 12:26:11 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andreas@kemnade.info
Cc: lee@kernel.org,
	krzk+dt@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	ukleinek@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v8 2/3] ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
Date: Sun, 14 Sep 2025 21:25:15 +0200
Message-Id: <20250914192516.164629-3-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
References: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ti,twl4030-power-beagleboard-xm" compatible string is obsolete and
is not supported by any in-kernel driver. Currently, the kernel falls
back to the second entry, "ti,twl4030-power-idle-osc-off", to bind a
driver to this node.

Make this fallback explicit by removing the obsolete board-specific
compatible. This preserves the existing functionality while making the
DTS compliant with the new, stricter 'ti,twl.yaml' binding.

Fixes: 9188883fd66e9 ("ARM: dts: Enable twl4030 off-idle configuration for selected omaps")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v8:
 - No changes.

Changes in v7:
 - No changes.

Changes in v6:
 - This patch was added in this version
---
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
index 08ee0f8ea68..71b39a923d3 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
@@ -291,7 +291,7 @@ codec {
 		};
 
 		twl_power: power {
-			compatible = "ti,twl4030-power-beagleboard-xm", "ti,twl4030-power-idle-osc-off";
+			compatible = "ti,twl4030-power-idle-osc-off";
 			ti,use_poweroff;
 		};
 	};
-- 
2.39.5


