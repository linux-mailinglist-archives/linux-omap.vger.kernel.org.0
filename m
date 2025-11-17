Return-Path: <linux-omap+bounces-4924-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA52C6585E
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60BCB4F15C8
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 17:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744132BE657;
	Mon, 17 Nov 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i0mQ5we8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0E275864
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400524; cv=none; b=V3dxRgm2wQovjaKzj4jOWlO6j9nEl6l7q30MBNZbGmVGBTD3vTtIS9qN+lQ2Qbhh7zWCOpswytShgWKrOapDLaNs6qxYzCYo6HXM2gTxyteJ8mR0Mcx2YvH5z++4X78VOdh2M0R3p32eGusou0XB1H0/wCbnSjlmQtY32RkjCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400524; c=relaxed/simple;
	bh=kDPsXivH00xRQlXERSN4T6T1lscUspSNZe53c/pLOQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GTj+4a2BvQoWX+H6a4crCXZ3hepZBzbEBisB0OC9J0GSF4ggz+4HEHHP/qRka4C2lRI34RQBySF1UiVSaRshi2PG1cLptMWDYYB6J89lp70vTiPBtTRByXDYVIJGo20nBn/r8ZNIHr7KckFVpIVKKtndnEdiMxzscP3iQijTGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i0mQ5we8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so4341356a91.0
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400522; x=1764005322; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=i0mQ5we8zCrHlNDxzAAt72OyegYe+oLGrcD/1T/4xj63BSlWfS7dd5gSzm/B6NucUh
         I72iUw5DdiCWUriK+xp2PRxaP641Ni2ikDZ4kKbo0/u3K/dzdfGCECG/YrXpCXqjB9Sb
         5Xdo+BAKRrH+5u6e6CEzpp3+ktfqYEYP9cgz/wEmzwcLloUeBo3poXu/gZl0lGT9ieTK
         shkbnBKQ3GnkEIV5rXc54/uhObw+9KaJteDKzojIhYmDvkvZPIELEXPumb2kNDBsfa39
         20weLfVKjnGwYI93l63u+jKteJWKpElr6HH9dS1K2iWNdPmf5cD/ofntltDCyF9yXFf5
         MIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400522; x=1764005322;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=BiGxCxzf1/SVPCM7rir4CHEJocScJDkfHjRg54I5HMf7RcAQqT69ZqRAaZ0FxDszND
         7ztS7EC15FgYw/bwlrF66O2Ub0+f8FBHCDvxzsHl2y2tJsah2KM3fVSUMfyAb3WhcyQ7
         mx3SNnOV4DyseQ+Bw3zNUumSHWQtOqI7+uZpqknP/vy8zmhuIaLe5Mv98/Ifs1BPHaCq
         AHi3R4ZhdBTjs91lgwNX4sSvLpkRNqsUH/vMWBEdyYk/SlKefCoptQ1e1osIOIEghEXC
         t/7YXOajMyHg4FFzk1DZdXlFM0ZmXG7zHF+LUhqX0ab3b26K0RAVQRH1cHr54wmNhVWI
         iHIA==
X-Gm-Message-State: AOJu0YwDFVHOPpQDBFbbLqCbNQKiXDNnp+25xjPYj6ByXj4NOEVnU5Vd
	enX3YqfLS5wWFAHZ3JRSNYvOxo1u7jOYSzUsn76EXOk8I24qrfrWC7cUqbR2MhhoHjVUs1ZVHSk
	fxnln1mI=
X-Gm-Gg: ASbGncspO5FHtT8QOeWlNWR+HtFYuMgtvRfWWJxOG2QwoMZ1Y4SBg1JGvIbj3eoRizg
	xShn5Nu9HylDIIONtyglQpSrZ3l+SJjVRrb3US17gZfARx9qFUKOHCqY48Jqre4T/vwzaKpNgYF
	hpyqy/vVGvUDfdJ2eJYXugyY+lxInDX99MqeFksC5p8KpvZBh8AiS+uxjnGPljScFxktlSPWU1s
	jPNGiyRuAiejcXmbJiqtaUGegykbxbzrszV7BnJls9vJ2WZBvVoxQx0xP3OC9ZviyaqBzFCZnYx
	Xgfd38jeKp7wze3n2L2YdFxM9nqcdlAVqR8qrbMM6pqGCU4e6pWC1oI/mZcN9x378MFih4lk2Cl
	KPlR0d+L6MIAbJshMdKKyjcjnVOS+tk9hB66B0yGrZ7UxmzYeE6q+GpEXFFBcZspD5An3d2A0Zw
	==
X-Google-Smtp-Source: AGHT+IHYbjHg19oozELCuH1Sepl41Hl6vXq0kA2LdsYPKUkCrFNp41EV5hBuCCfJikNQi6qXu7K8CQ==
X-Received: by 2002:a17:90b:1d0e:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-343fa74fccdmr13709653a91.28.1763400521875;
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794ed1sm18965400a91.12.2025.11.17.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/drivers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:28:40 -0800
Message-ID: <7hzf8kk1pz.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/drivers-signed

for you to fetch changes up to 3f61783920504b2cf99330b372d82914bb004d8e:

  ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx (2025-11-04 14:48:47 -0800)

----------------------------------------------------------------
ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

----------------------------------------------------------------
Matthias Schiffer (1):
      ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

 drivers/bus/ti-sysc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

