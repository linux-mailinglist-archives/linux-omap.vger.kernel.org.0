Return-Path: <linux-omap+bounces-3433-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BAEA68040
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 00:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613421794FC
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 23:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7068C211A1E;
	Tue, 18 Mar 2025 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tXJB/EAw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB6211471
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742338851; cv=none; b=JcvrFnBC4RdVE5PMF9DEpyDNSTKR0dW5HkotaKvWYSgnNAj6ouEaV1NEIqX/mXVPPtMbzBlp5SGuMS/xn0NDisE/aNbAbKK8mJsCV+FxbiVcOt357hIePM9XHRzxdlvdGCK9U0KQzmlsJxOLbK7UpV3u4RQ2fpo3ccbkbeGMTN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742338851; c=relaxed/simple;
	bh=Ya379Ijr2ofj10+RRG61gqv1ZJJPtyVebxeOMcaN51U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aaJamqrdqiCCaYlSwU17uMimVDMJO3SW+bIuNoxEwuzCXRRRU/6BWV8n1VwMVapueScOlBzXzIDwg9CiFoN7qvfhncOaOT72Ev13whFgI3ZAvXPBLwEdWRLIj3oWN4Taa7axTNMsf+BmQzCq0lFn9F/hAavRDrkVNoHGlmKlBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tXJB/EAw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22438c356c8so108262485ad.1
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 16:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338848; x=1742943648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYFuZAXLZfyhQ6Ofp04NHjTY3u72Upe1i27dNGQ4bgY=;
        b=tXJB/EAwlLWnvEMZ0+wcOO3OQ0yjxiGe1FiILgTu0OlX3ceTueTlTVfOifrYI7wASA
         K6tLlsOjZRn/Hx7/r13U7a1Ibm5gQbJQ0mvL54sG5X8U62CYpYS0eAX+/AwTPqBywKpr
         bKS6YixmG9xxObsnhQzNEU2zwesBpNbPnOm0GLge0uRleYGl5dRTBFJkvim7UvE5CVLC
         6EG63NvRnZ6eKBVtDgdf6Sa+uiHtN9ix4lZqOWxl3iP3jYjheNoQ3WvQDNLaTpp9gJq+
         WTik6WkiFvnvRRGTc+ikLeCK3Pbduv25FJ/81NgghjZlvD1NalrcY/OgFAkDNEE7/EcZ
         frJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338848; x=1742943648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYFuZAXLZfyhQ6Ofp04NHjTY3u72Upe1i27dNGQ4bgY=;
        b=PG2d6qnyozztL64hcygGrLkPFiVjjqdinuyTfDDbl+JS2CJhDij9q4FOKV0H2i6f59
         95zhM8qyHD+3ePEFWTctf2yqmt/ZS+MOsEK0kOfFP8SshnnveANJbxu1EvjYvSggKadi
         2diNM1JqXB+pXBPTSUge7hVaIbVi9Me3Cc+P+wQP9Nh5JbFlRQbyrrL5Cuf3WPuItEvu
         D4KmMNopZynVRaUOvdrLFe0Fuaj8px5ZBwCrrPF8N6vu7dI8uQDDYwtIPmI1C8pGHxVC
         e/32RDo+52WzkUwGK68JIV4WDPVnvLFIOXQ0bKCn0ga7BAWmkBScVe5eCmdfiKK7SLjh
         3UCw==
X-Forwarded-Encrypted: i=1; AJvYcCVrEt3HoAidnloRaMf8J1gb0yq37mgtvYD+HJWLdn3aU4ZWOYFZmF/Z/44Wi80C6YjqTNGqucXMsn7n@vger.kernel.org
X-Gm-Message-State: AOJu0YzCuQWhcdXZQzZHhVYUGlaKvJPG1gFhNjScusMnfmBHboiFu3M3
	pY/8vumOmqRu/ljYA2gP6czc/7tNlE8302//ZOloHhRJj55BdrOuORUEJFRYEI4=
X-Gm-Gg: ASbGncv5ibhywb7zDSOiJGeWkZihkPnmrmkcf8JCyRtHhpEyDCc/n1TnBhngNntDP2i
	I3HvmR5HnnmMshX8XnPRtFU+yTDuxSQfq4/aZfdd3pxPNZKd4uQ7J+Bvoe7T4lOeIUmO8Fx6F/+
	rNt6YrcgLKoTLMjf1+W+UBL49JXJ+FMWjLHrRdnxkT3CfuK3ibGd+bnQFfLWzRb+96txq9/siu8
	V0Me2fpbqNwiVnq0hBWcK3QJ4Vp1UJA46WNXX1VX486vWt82Xxd2/K2kEzR/NlQNQ+dJCREzG+Z
	0bjiFggcn0REaQZmSV/YqMjxVOQiz6lN3KyHhp0TXPmBQnF0agjK7efYMT+Yj/qKJC7SRaNM0ck
	k+4cCAQQ=
X-Google-Smtp-Source: AGHT+IFTfJJcr07mnjzLqCop80WxhC5Pssj38zY+A8XR2rKWIc2cYcEXx8f4iEqqmQsjWdqm+Dpo5Q==
X-Received: by 2002:a17:902:d2c6:b0:215:acb3:3786 with SMTP id d9443c01a7336-2264993661fmr6691435ad.19.1742338847956;
        Tue, 18 Mar 2025 16:00:47 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:47 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
Date: Tue, 18 Mar 2025 16:00:38 -0700
Message-Id: <20250318230042.3138542-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes the Power management issues on TI's am335x soc.

on AM335x, the wakeup doesn't work in the case of STANDBY.

1. Since CM3 PM FW [1](ti-v4.1.y) doesn't enable l4ls clockdomain upon
wakeup, it fails to wakeup the MPU.
To fix this, don't turn off the l4ls clk domain in the STANDBY transition
in MPU.

2. Also Per AM335x TRM [2](section 8.1.4.3 Power mode), in case of STANDBY,
PER domain should be ON. So fix PER power domain handling for 
standby. l4ls is a part of the PER domain.

Since we are not turning off the l4ls clockdomain on STANDBY in MPU,
PER power domain would remain ON. But still, explicitly handle this
to be in sync with the STANDBY requirement.

3. On am335x evm[1], UART0 - (UART1-HW) has a wakeup capability.
Set the wakeup-source property in DT for AM335x.

4. Enable PM configs for AM335x.

[1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/
[2] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
[3] https://www.ti.com/tool/TMDXEVM3358

Test log:
https://gist.github.com/sukrutb/bdbfd1220fe8578a9decf87d0bac6796

Sukrut Bellary (4):
  ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
  pmdomain: ti: Fix STANDBY handling of PER power domain
  ARM: dts: am335x: Set wakeup-source for UART0
  ARM: multi_v7_defconfig: Enable am335x PM configs

 arch/arm/boot/dts/ti/omap/am335x-evm.dts    |  2 +-
 arch/arm/configs/multi_v7_defconfig         |  5 +++++
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 drivers/pmdomain/ti/omap_prm.c              |  8 ++++++--
 6 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.34.1


