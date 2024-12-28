Return-Path: <linux-omap+bounces-2909-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679799FDA37
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23BC7162127
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0398156886;
	Sat, 28 Dec 2024 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm7TMZBH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BDF433DE;
	Sat, 28 Dec 2024 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386337; cv=none; b=bdAb+TZ7Ofs89IiLLpH+nSO1jI2UIJM9419RlzDfICLwlMWyVe+8uo9FPQzWqqbVXp8nDL7ItN5C8Ocx69im0QDObwcow7+2MfcHvmkXBHfz028tF40GOAcXbZHygvxIL/Eywr2gbRVgiBPWVjySfSJMZOFZvmJcgk7RS2XwRJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386337; c=relaxed/simple;
	bh=34yddgM7wdEdgm3HTsH930/5IVTSI0hT5ORAaGsJOuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dhfann6Ju/1tV6OYl/8MP74+ziGO9RkfHhpTEEFKLNBG7SvcyZP7fLuhWTjthWa2yZcQe6FGhf1qNAk7o6Oz7/vf2CEm3/VkQMwkPYPJyXPxtHIVggjEUX1EPFmorMyM3xl/0fuPBbGd1dmg1ol/pltqe0ZmIJAnFCCLEhQnIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm7TMZBH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so4141929f8f.1;
        Sat, 28 Dec 2024 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386334; x=1735991134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qElSCzGpzRQFPoSlMm/iaBSBMhChDwP6OeCLqv0Xkks=;
        b=Hm7TMZBHUwBohoZw/LX9bkQxnFx/sPet65WP+p9rGD/ZyCo5lzIPCQWTa9UhJeJfex
         Owqdbwh2MG1dZSceYXrioSa3A5Nrb50pwqOcqo7OEHJLSFid1kFSrTdsXBjIlCefd0a2
         LpAkV55hgrmyDWNGuTNiPmv83lKq57G2b+4FjKkM9YCWmPj5lpnvBYPVPaOd9I7RXLIx
         81SANJZjCZPU4dKNxgRTkYpiG8QVYE+HfQbVCiOcAYkjGlOXAC9a5ckMmGfWB5qWxuPL
         yxHbonM1VeAelgRqk5HhaRSQil7k6z9JMrnPCxBoPt6lLyFGGOzFT5okkFGxSpPGIDRo
         g4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386334; x=1735991134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qElSCzGpzRQFPoSlMm/iaBSBMhChDwP6OeCLqv0Xkks=;
        b=kzsHGj0d6FEK5RI7Jj5tOoRqqpO1B7QLRzin+Q4zCMj/BvLOzaZVBoNb9x94kwg2fA
         Bc3FPgtPjctsoEUSd6PSFxlvUxr6YdVjRjw78qz1Yds8oIrIOtXOdeoOz6/rQtAdOqpn
         SBma5XIkyhercAJwVU48iqKaMp8im8HhfYJ8zVqe8GOV3LgjnnU/eA8FDI1LPcF2RbbJ
         ruAuapXke5W5mOr4Vh3ECfqSq+B6hXcyGdvV3qeTCa2yu+XWNIIZSEuoAwO9VDDU/bgP
         vlfHGd1Z5bO4/IXCretY1b6zYSoFLNKq0Z2MnFd4XHASK3NVks2N5iDpJ4zjfT5KVWjB
         ewDg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Cau8YM0uhMUz9EXqRle/0/n6U8r7Qd16hrsVSPimx+MyGFBa0fYrf3QjSOH8llVUtrgsRMcglzVpieE=@vger.kernel.org, AJvYcCU2tFvVHpW1RfB5jfunTEXz9p3iOCiywkksS1WmenAO3xrbklrCik0hlvGc+BC4mc3nfq12FUu4eHAr65U=@vger.kernel.org, AJvYcCXzLX3u3x912Y+Hy1gv5BJHCZG7hyD5w0RT2lQMCKcPNGaFlsOaXFOk/3PnW+Dey9DRe2U94CTHSQEY2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywljeva8kg5ilfgwBJoYvgrsEYthiCM2ftErYw3u8qn23iCdue4
	pvQjx7X5bNYfQjeWDSjq9ljJSYj1Ps9OLausC5FW3mZrpaWqO427
X-Gm-Gg: ASbGncsqXmEAhuAKnzVv1QNCF2bkzL5aNmSLMHz76ajdA9ju6qjmSSKDCYg2sRa0OCt
	R/zMaEdrp1ghH45Um8PZlx02M5H/qzZTA9SwPYWWpQswW2DluxjWyJbVIlLySXHpaCMqJOOtDO0
	kY3/Oqm6xwaFzVvF4FI+PfXOj+iTYAptxMiY71mz6ujTWDZ7vihn6D7EHy37YA6YjJNMLIdNA3J
	H+FK06Tth8MkbXq4Q9eccDVpAjeFv1YjgDVC3nThROvY1Mnsq2HUn558x08wQurpNqSWvhpaSoc
	u6I=
X-Google-Smtp-Source: AGHT+IEInlMt8hSiLqoNGNSPE2DufcAInsQykOna2HBvJoOOu+UV8VXInxn2IQf8RQRc/r/GR5tgMA==
X-Received: by 2002:a5d:64a6:0:b0:386:32ca:aa0e with SMTP id ffacd0b85a97d-38a221e1455mr29267955f8f.5.1735386333974;
        Sat, 28 Dec 2024 03:45:33 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:33 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 0/5] ASoC: cpcap: Implement jack headset detection
Date: Sat, 28 Dec 2024 13:45:09 +0200
Message-Id: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpcap audio codec found on cpcap PMIC supports headset detection
and PTT button through its 3.5 mm jack. This series implements
support for those capabilities.

Ivaylo Dimitrov (5):
  arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
  ASoC: cpcap: Implement .set_bias_level
  dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
  arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection
    interrupts
  ASoC: cpcap: Implement jack detection

 .../bindings/mfd/motorola-cpcap.txt           |   9 +
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   8 +-
 sound/soc/codecs/cpcap.c                      | 200 +++++++++++++++++-
 3 files changed, 215 insertions(+), 2 deletions(-)

-- 
2.30.2


