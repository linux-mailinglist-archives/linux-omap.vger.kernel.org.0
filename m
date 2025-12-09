Return-Path: <linux-omap+bounces-5133-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C8CAEDEC
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 05:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF2573007C92
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 04:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33372DC323;
	Tue,  9 Dec 2025 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iP0wR6bJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63B2D73B6
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254490; cv=none; b=SotpZ84Tv8jYNQ7W2tK2R2XBAsWtV4tBQJPInpc7G4I7XupeTRm6aOoH7iQs+deho23rLrGUDg360xDpqVhQRQCpmRkTGkrf14Gy15Z4WWFiX+UhSrXKozqsFYqI85/OPQlFKU/C2pLj6Mr5tYvNtWuBv4vwpyAwIjnq6qC6QQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254490; c=relaxed/simple;
	bh=LsB2Rw1u+BAgI+Dke597qwki4yRQSIPkKWxz+iJXnKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKNE437xcHKbps6LvMPFO+J9y+dBnEv38MWX98IQDYf3A7BAZmffjK2qjQD3KvZPJW8kL5JIk2f/Nv1U2sg8MoZ5gP7RnWO2XimM1IQzAP3oXbjwwtSPHUKZaXV8pYxnHjmrt+w95Q3bwv8iJzzaplCEPcmiY9Uddaz4jnsWOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iP0wR6bJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso4161523a91.1
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254488; x=1765859288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
        b=iP0wR6bJhNO2gY/tLDMnaPxTUfxT3IY2A6qwLfRmR4lDwH2mxSx80g+NuX2fU5Avh2
         RtMIaM1Ct5EbYwd8lBXHySUhbXEO76C6vzWSotMBnW5mEoTSpy8YYlG46DrJd+5AGEaW
         dc1Vo1t5beMYsJqIl8J6kZicAdBBpwTsLeBWtTgayKeluikViLXlY89Gjco/kcFpm3nC
         ymGpJwMNHTmz+S5SIH7DCrOmdBNA8pt1lTZ9EH4oVgtxHSgPSK2YeyPRBES2ejxXVKtA
         7AwXDl70ZAEPcjciiIOO0Xo/U05w6s/n/s25iwawuacLqF76nzDt+GUK+wv+/5ARakW9
         8Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254488; x=1765859288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlS8NGZoUAbx3WVREmoqnUjbjOgDJ/P+b1vdg2wt/Bk=;
        b=mdbYGVFcGaAQxcCIDiPtvzyjbefC0MDuGLfdskHVVpY8wOMeDY69lFOPErQCHQsybE
         ffYK6totN8ZwSZOOcrS5QmjJwPBmbxjnz3uzI1XmrPlC0Ui18bG/LS3/SQFwWMEGo+0t
         jb/jzHpKlQ8XiSAWhF7z7dQqjL4GjfCt/laIM2Aeevw99aSqtNzInj9oZwk9JzXjZY73
         bpFauFLhDVH1hlz1KdAFKXMy227IiuSkrfHfYQExVghAN0BAmUXFP0msHk9ANRkqC/Pu
         b6VzfuO17Ze1VUgyVKTNG11V41X22vOV6Y1V30cFLQKIFo95Osn1Ao5aza3X5lebMBSJ
         XoWA==
X-Forwarded-Encrypted: i=1; AJvYcCU71le2W/wEvTknblQl7UoTw4YbiPCWnoptAsO33zqpYZYwPUAn7bhPb5nZDXtohwWrht8oAKBWinqN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOzafvy3dHON+wlVVVh47I4hMlziiSZgVkp44Azgen7AL45Pb
	IiNvLiAUbx0xFnveg1/PLUVGfM75HJ046+1WS5dPm3i30iPJzbWhBaby
X-Gm-Gg: ASbGncv9qSytjnEiRkgNkvO8iMAlTTYCF2P5EGSXIEqLbBTQkEVl2fj9I7VSFbHWhlm
	7vw5EZ31A9v/xWHyym58YgYIOlPXAGgWSKOLbIWRNazhYpTU2Y1zHZ87JswYSTRkXmNCwM9B6hH
	iuwgTDYYSCo3HRHtnVV9mTCh7Bzw9oN9yqbQTecKQxSHSf8wJpwP9Iw4p1Kyu1Y1kLavA6n3bZR
	n8I9sI3jLnmF3jt+c3DGgM2K43BlV3okyjgAeTe4AqtIYeOsffsv6Y92C+2vx1K9U0ihXt0xZT8
	OLOm6WswUuRpqEWg1J6vUrKn6pTcSRSLeD2PzfedE7U1Xa+BhqG/3eaorHPEB+lPC2PHN73ctvw
	RrhFznEfOAollVYliHguvPQgNDgqGM6ZdfakTpELlatWbE5Vl740c73lwZS+nQb5wyIDFswxBV7
	SoPbvD5W/oOMl3kjiyYVsAgeraGaozgn60fiVhUXHyY15svptTD5Aeyw==
X-Google-Smtp-Source: AGHT+IFg1iIMyFLucr9uOHmmv9GE122UxHPeUmvBUIJroW50FItL/tqkSaQEcjZrl0Un6zQJ6OWfHQ==
X-Received: by 2002:a17:90b:1e07:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-349a2511cbdmr10578046a91.12.1765254488312;
        Mon, 08 Dec 2025 20:28:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:07 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:41 -0800
Message-ID: <20251209042744.7875-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small series makes several legacy fbdev drivers buildable with
CONFIG_FB_DEVICE=n. Currently, multiple fbdev drivers rely on fb_info->dev
and sysfs attribute registration unconditionally, which leads to build
failures whenever FB_DEVICE is disabled.

Thomas previously noted that FB_DEVICE should eventually become optional
and that drivers should not depend on sysfs or fb_info->dev being present
unless the Kconfig explicitly selects it. This series pushes in that
direction by tightening the FB_DEVICE dependency boundary without changing
any runtime behaviour when FB_DEVICE=y.

What this series does *not* change

- No functional behaviour changes when FB_DEVICE=y.
- No removal of sysfs interfaces.
- No changes to fbops, memory allocation, or display update paths.

Build & test coverage

Tested with the following combinations:

1. **FB=y, FB_DEVICE=y**  
   - Baseline configuration; no regressions expected.

2. **FB=y, FB_DEVICE=n**  
   - Drivers build successfully.
   - No sysfs attributes are created.
   - fbdev devices operate normally (where applicable).

3. **FB=n**  
   - Drivers depend on FB, so they properly do not build, unchanged.

Motivation

This moves fbdev closer to supporting FB_DEVICE as truly optional, helps
reduce Kconfig entanglement, and clears several long-standing TODO items
as suggested by Thomas Zimmermann around legacy sysfs usage inside fbdev 
drivers.

Feedback is welcome, especially on whether the guard boundaries around
sysfs are placed correctly or whether more logic should be pulled under
CONFIG_FB_DEVICE.

Thanks,
Chintan

Chintan Patel (3):
  fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
  omapfb: Guard sysfs code under CONFIG_FB_DEVICE
  sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE

 drivers/staging/fbtft/fbtft-core.c            | 20 +++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c           |  8 ++++++++
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  2 +-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 11 ++++++++++
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 ++++
 5 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.43.0


