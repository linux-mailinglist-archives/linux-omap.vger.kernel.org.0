Return-Path: <linux-omap+bounces-2113-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03E96CB91
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 02:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F8B1F23FF0
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 00:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88635621;
	Thu,  5 Sep 2024 00:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DGg5OnGJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CFD184
	for <linux-omap@vger.kernel.org>; Thu,  5 Sep 2024 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725495086; cv=none; b=WtlsqqKQ2ilZKY/wwa4+IbH0J/HKuonFsAhsvVsSjbFxds+ua6MGx20xnDrrK4xBZpZeBMel/3DeHJjfizcT3K+PV3JzJ+46t7l0VMa4Fc1YudBPvGOS/Llnog9fna/PwYX4RSogqY5PKugEb6DnITWhi8GzF4NqMe+ZwK2l6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725495086; c=relaxed/simple;
	bh=hpcoRJ+wdOzTUkcem0Ha0pFW29Ze+Oz80RqZAh/XHKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gt7yL5AiLq7kq446oux9Sg1mCa11wtdK6fsn3Ze2GyDxWSX2BiLJtB/eZRqhmhXI1z97XheKGbLy6iuc1khHwXlXSiUHkwev+vWzWD08QDv23k7ztYXHD33Mtt6PVnCqr2eB1ilZ8P+ItEwKxGIj4YtVRCytCShtydQ0hGjjzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DGg5OnGJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-714226888dfso158466b3a.1
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2024 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495083; x=1726099883; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WBb2m4LRqIVhYecRL8ia2k0mOHcNoJOjR2lFU/Vhyqs=;
        b=DGg5OnGJ2ivDylei6MhJxwybig9XKg7mzp7xNgtNGy6SaYPadGq1fBkEgjAUj626pF
         gj2kpfWISF5iP6dh1Z8H8no3JbTX56rptOZqLoQ8speJQuSToxRD4nB6T8lP9Yzc3LjI
         nCI8ECdyT+pSXLmxA5suU2CQdnfeT13d7VRBZPJwd+Odcu52kyAXcr60faHRZSAn/G2b
         YOF50eKrKZHP6w6ts/u4i8WVZLcUq314AVsUS0mf8/TMgH+mQdwmIACwxYKy7Z1FLTCP
         bBkLXsU9qi7saG7gUpZOUIyqbf8mp6vAt8toQcA/hUtlUGxNP9KPlhfga+QA/PhGmZqh
         KCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495083; x=1726099883;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBb2m4LRqIVhYecRL8ia2k0mOHcNoJOjR2lFU/Vhyqs=;
        b=CuNVKSbdY0o/JUJ+m0BM08q1Qw/1nt1W8WejHbZ7k7/c7EYZWAwxFADrCCzrx70+Gn
         lU7POHM67KHviuXV/7/1yuAbldQKMGx2834GalTzZ42gSIAKtPOMr5QUuhhfYoJUYq/q
         EUEo3uNHWhMif+gqCVqKwEol2z6HzNYPq1CrLU/56Fdt2FdL1dab77LZb3MZFS9F/mF+
         aK2W00RnZPlcPeg7S+XV9MUP1qDVVDZY3iki03W1MtdO8i0LEy36Os+DGWX8Q99FRwLq
         yZe4zi7CCE/Wn+e2i5pLvvRtPB/wkO8L5ep16uM8v6+AryyNEOyGFk2VVPwJq3OLJb50
         VIHg==
X-Gm-Message-State: AOJu0YzrWAKUFN6dX5+dy39U3aX7RUD3YJo8AeeYUp1cukhyah6tilQs
	Ldq2j6X1L20a/kn3tZ/pWi1X6YN1XP83Xkoy/FFKl34ST0sZQfyxy7PzBEJJBd7FDi5fsurEY9W
	c
X-Google-Smtp-Source: AGHT+IEispmsRDT/jVl+Mi6E0JuyUc+QsYEaQ8/O5NzZYXN3oQwk+xP3FkJL7y6A7+ov8gEQTBNBJg==
X-Received: by 2002:a05:6a00:2e8f:b0:705:c0a1:61c9 with SMTP id d2e1a72fcca58-715dfb127c2mr26216960b3a.9.1725495082771;
        Wed, 04 Sep 2024 17:11:22 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbdadd48sm1903769a12.79.2024.09.04.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:11:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: OMAP2+: misc driver updates for v6.12
Date: Wed, 04 Sep 2024 17:11:22 -0700
Message-ID: <7hcyljarit.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.12/drivers-signed

for you to fetch changes up to 9aee8262445d185960431e972e2d997e6aba3de0:

  ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init (2024-08-30 10:57:24 -0700)

----------------------------------------------------------------
ARM: OMAP2+: misc driver updates for v6.12

----------------------------------------------------------------
Dhruva Gole (1):
      bus: ti-sysc: Remove excess struct member 'disable_on_idle' description

Gaosheng Cui (1):
      ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init

Rob Herring (Arm) (1):
      bus: ti-sysc: Use of_property_present()

 drivers/bus/ti-sysc.c     |  7 ++-----
 include/linux/omap-gpmc.h | 10 ----------
 2 files changed, 2 insertions(+), 15 deletions(-)

