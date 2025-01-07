Return-Path: <linux-omap+bounces-3025-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6DA04D74
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 00:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B850E16343C
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 23:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693DF1E501C;
	Tue,  7 Jan 2025 23:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="luGCOFNy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531F273F9
	for <linux-omap@vger.kernel.org>; Tue,  7 Jan 2025 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292309; cv=none; b=H8goDNp6gkP5S8W+4N/24Y06JEQ0tZZuXr4jz9nIfx4SKdJI/hszMORBQiFTnlqYNHfYwDrQGTKDUCWjSyPFk2n4FeC1eAtr3GkfV2W60/9tsK/V6SohPqL5dh5TFvkh6dq9xvE6Mrexaflc88IkVDqc4mjQfvH09u5506WBURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292309; c=relaxed/simple;
	bh=cEGqH9VvxrADKoWN2N29Th6xWngmCgiaV0IQ6N0CFTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hK6WVzZhWmuKSwH5CWJrahMG5AeMpyxylKZaVKJ5GGZZNKVgWK+/CX7eTnrnKoI+1B3jqJ0ra2Q74NhjCVKQW/46+IaflrvNjXdkEBJSLR3R045iU97uTiP4PxmLrbHNjKBh1xHFIheVCNR/TkfGldKpAByf6KLeXhp8lHrAuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=luGCOFNy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2164b1f05caso233819895ad.3
        for <linux-omap@vger.kernel.org>; Tue, 07 Jan 2025 15:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292306; x=1736897106; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=luGCOFNyDPu5yNaojlUrXS/F1FjCmysYLOdv+NCyH8JRlMC0wp6Oc7jbptrqG9t2Ol
         Oo/dwqdJfsFjjWnAA6sZ9jQF5IwB4qb4tQuSzOMyOuQtBuGFZDefZ5MO75W1BMFGZss2
         pT5VhFjc9rsTNUAEQLhDN5+NojMqWX2C4ufWgnCY3u9GciAH7Xg2vfmL4DAm4rYEj/TE
         yoBWWGA8YU07jf7fU8WN66U8PlCt1euyMjT9P60agaAmk3XyTY7HTZFB31xKvhPHZDCy
         1+pFSH00VS9sYayLojgjy+yqHuGdaqwmNNV9DBq15Bf0ndbXvoxvQLxNDKvgJNBM1m2e
         QF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292306; x=1736897106;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=vhM+DTFHt6o28+RDgkuVi4jnLj0TNoiDGKZys9mWT/qINBIlHPB/MNpXF9XPoQQi1F
         hJH9C6ufwCZJL1pxzN60pROejxx6GEkTNnVpqvT4ekzaF0DVnh2ittkPKMi657RvzXSQ
         wiWt6nZ3PhiewG9iuhEbO/0yKM5dzTarbm5aIRdvBSK0tk3JSLt01mHBNWlULCqrJw6V
         ZcPHQtARzHL8HTP3N8Yk3C3n/8cCe2qQ7xMtGOflpUo6qT9pH1tML+Hf/vWQGius7FvD
         Bkks07bn/dlYtHURlGsRxFdtdUJcLRLnpv5Di8oI56zCNjwq38jKl8IpsbS3rGxzaxZP
         HUyA==
X-Gm-Message-State: AOJu0Yyx9IGcoTt1rIV+hUKkplERSICKzzAzHtl6LfpCf4EQeJJVJI7b
	I5jZht/AFVQcAzh8Tg8C3kOMugtcZKy6fHo/ea1eCSgOqNTFHeHW7a2xStY9yMc=
X-Gm-Gg: ASbGncusLTf3Y1wAEQ8o1Sa1+gGWUuCVPLX3zwH1p/7uCM6G4YZnlmqoI+/xdO7B7cd
	tdq0X7jUgDEZB+lbtCx8BWB1lXEVNJwAcPc6sC4sjqhXduq3/yT3MDJl1LukPnfJdDERp7IPR6V
	6o4WekWcyzqIuyKadR1I9tW2jJ7ZLlFEXIIo0yzu5e0sNbHbrTyj5Q/7vU2TWancm7L3qy9KzbH
	q9Ww8CSfil5hPqT59PYPidZMJEU0DuEFgWh32kfRADM79E19ljLAOI=
X-Google-Smtp-Source: AGHT+IHVFOR6GkERpP6WR0/FI8WmwY9S92Nz5kINYPVjjjtNFK0rP3anDsgdAdMUKFY2u5SJ/13PZQ==
X-Received: by 2002:a05:6a20:8403:b0:1e0:c954:ea85 with SMTP id adf61e73a8af0-1e88cfa6a5dmr1874365637.13.1736292306314;
        Tue, 07 Jan 2025 15:25:06 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e87deasm31264743a12.45.2025.01.07.15.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:25:05 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:25:05 -0800
Message-ID: <7hikqqb41a.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/soc-signed

for you to fetch changes up to ad455e48bba7f21bb5108406da0854cf8dede8ea:

  ARM: omap1: Fix up the Retu IRQ on Nokia 770 (2025-01-06 15:12:05 -0800)

----------------------------------------------------------------
soc: omap: minor updates for v6.14

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: omap1: Fix up the Retu IRQ on Nokia 770

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable charger of TWL603X

Christophe JAILLET (1):
      ARM: OMAP2+: Fix a typo

 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 arch/arm/mach-omap2/powerdomain.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

