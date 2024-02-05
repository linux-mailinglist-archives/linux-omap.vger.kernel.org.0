Return-Path: <linux-omap+bounces-492-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B6849C7C
	for <lists+linux-omap@lfdr.de>; Mon,  5 Feb 2024 15:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DCA01C248D2
	for <lists+linux-omap@lfdr.de>; Mon,  5 Feb 2024 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FD82C1A5;
	Mon,  5 Feb 2024 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b="W8dS7/1v"
X-Original-To: linux-omap@vger.kernel.org
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD61CD1C
	for <linux-omap@vger.kernel.org>; Mon,  5 Feb 2024 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.184.203.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707141616; cv=none; b=YOEV0H2ZRtEKWnJTgNEBMV4VmATfyDwhj19OgiVSWIm4RpF+FEyCuoKXXVppu2Yi236NML5QGLA90l/nEHHyQF6j8cjWQF8OFVyLkG7w31yZGXI0aqKb+kuGQshUrgNyqijUx413V8K7p5M/PjjJYz1xSbFUuC35gTx1uzPR56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707141616; c=relaxed/simple;
	bh=/6zDVpTQxTpO8Rt7fqCeo96mpq7mjUP0IlGNFtYHc1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c1p8qJu9yV1KOM3C70yZswQkqrKJURmKJ2AD5AbINeVR9J/lgGK6BnJAEyWp7wy+HNg8BNC/loDmfTU+1FDQZNXFcKFilX8TK5qF2jSf08D97DPPLR+GpMPG9Szxzk88qIIGgamjlfrzyFSjgsvnW0zH0LaataC/KMSHAxfXyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com; spf=pass smtp.mailfrom=mistralsolutions.com; dkim=pass (1024-bit key) header.d=mistralsolutions.com header.i=@mistralsolutions.com header.b=W8dS7/1v; arc=none smtp.client-ip=18.184.203.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mistralsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mistralsolutions.com
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71]) by mx-outbound45-34.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 05 Feb 2024 14:00:06 +0000
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-59a25e89211so4806852eaf.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Feb 2024 06:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1707141605; x=1707746405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMXVXJW0OFWoix7qY497nt0fmYOWqwLi2f9LeVZ82B0=;
        b=W8dS7/1vueMeFrQxesV34QbMHrYp8H4HQKQohMC28EFmqjvMg33d0rLRcsQEGDOVeR
         lKOfwE099AgYZlNWQ6blDCX5QFNI2EZyi1dBPOhRFWPVLCWTwOnHrAn7Vs8U3Q5+fev4
         Tf/QgRvAH2sIfq6T5MelD0QergVUTqLHQfYV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141605; x=1707746405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMXVXJW0OFWoix7qY497nt0fmYOWqwLi2f9LeVZ82B0=;
        b=bQ8fP6sRMj6ItVWvDgVWGad8RG05v0od93X19UAnjZlRRjCRduXEfc3ml9Onx5WpsP
         dek6oYNAznkhUHCv40pLNRCIUzcHUbB8Wtxzz/9JUwvvh+g9tQyjoXczuqpYW7XuP3tS
         ZuiFEpBX2HHP8n3KIF2Ij/S9AL+3T5tSFzFgxslNm6LjposFoTh9EgRWwgQ5OUDS/SlD
         9oW/+nfdqrJa4BkyLzyhE21rLiMJdbX5JiYQNnOOShtHaR+4QFy8+WwJfx9rGy8ga+3z
         9PrrfAqlpvS5WKlVxdajZh/V0E/bV8pE5oRPDloMNZVjIaMNrWytar1boeHFSVIjfViB
         o7vA==
X-Gm-Message-State: AOJu0Yy1IW7Ykf+XAvzCwK2p6b3Z3fKI4MqiEnisI+eRowCAHsW3Bc0Z
	/wtCHFWuOuUnPDQgLkJUsWKxRjLQu/ftCIRloIOVUAoO5WuFqTvH7x3JblEIfByNZ79+N7hAQ/Y
	sf8fXrcUZpz9I2fiFEXHNNzLw2/X5J1inXlml9t3BuknB3r2vgb4N4xY5CB6sQEfQoFAqSiPHF1
	YrfiE2ooR3KsYRYcULig==
X-Received: by 2002:a05:6a00:2e91:b0:6db:e14f:3956 with SMTP id fd17-20020a056a002e9100b006dbe14f3956mr17014279pfb.20.1707138497341;
        Mon, 05 Feb 2024 05:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNXHqSPziIiSbO4sZ+G6kXuaiJtK9gYDJuk+t3nQyBe7Vx85wEELo7/664uQfeffyM3mUsPw==
X-Received: by 2002:a05:6a00:2e91:b0:6db:e14f:3956 with SMTP id fd17-20020a056a002e9100b006dbe14f3956mr17014252pfb.20.1707138496948;
        Mon, 05 Feb 2024 05:08:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVjN/4GYid4eXCABddW2uHoUktZQouQAFMefEu2Drp+ejGf8LUMxvo9I1/RCHN6P9ohqbwR7rPSdMCWl8KSKEJ/l5uKywZz9ExM7pIqzWjMErXA4ib6B7q6VYvUjg0ldfetrXMOkFj9Lonby3mTyj8rw3QlzbWUJMoF64n2v/XeEwJdwFSEe6lUuuAg7z2J8N2icB8Al9LL
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id j7-20020a62e907000000b006ddc5d8ecd7sm6604756pfh.32.2024.02.05.05.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:08:16 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: Denis Kirjanov <dkirjanov@suse.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V3 0/2] CPSW: enable mac_managed_pm to fix mdio
Date: Mon,  5 Feb 2024 18:38:08 +0530
Message-Id: <20240205130810.14571-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1707141605-311554-12416-11393-1
X-BESS-VER: 2019.1_20240201.2150
X-BESS-Apparent-Source-IP: 209.85.161.71
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrKysDQDMjKAYsapiSkplkbmyR
	bmpslmyUapholmZkYmFsYmqcmmaSZGSrWxADALva1AAAAA
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.254005 [from 
	cloudscan20-102.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_SA085b, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1

From: Sinthu Raja <sinthu.raja@ti.com>

Hi All,
This patch fix the resume/suspend issue on CPSW interface.

Reference from the foloowing patchwork: 
https://lore.kernel.org/netdev/20221014144729.1159257-2-shenwei.wang@nxp.com/T/

V1: https://patchwork.kernel.org/project/netdevbpf/patch/20240122083414.6246-1-sinthu.raja@ti.com/
V2: https://patchwork.kernel.org/project/netdevbpf/patch/20240122093326.7618-1-sinthu.raja@ti.com/

Changes in V3:
Address review comments:
	- Add the same fix to the drivers/net/ethernet/ti/cpsw.c file as a
      seperate patch.

Changes in V2:
Address review comment:
	- Add Fixes tag.

Sinthu Raja (2):
  net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
  net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio

 drivers/net/ethernet/ti/cpsw.c     | 2 ++
 drivers/net/ethernet/ti/cpsw_new.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.36.1


