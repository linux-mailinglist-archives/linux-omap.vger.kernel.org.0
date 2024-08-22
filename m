Return-Path: <linux-omap+bounces-1971-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4B95BDA0
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 19:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B77E1C23228
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 17:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA721D04A0;
	Thu, 22 Aug 2024 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHSLWAHI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD921D0495;
	Thu, 22 Aug 2024 17:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348623; cv=none; b=fS8VhCE0YPCb3IYbFDBaYnqqWUKeHEwaf82bUMaRkLQlCiUVNTs4cqIWk4ro/6KZYK2j+IXchGk2ykSC5qThXakiQ6l7mEX4beaZJxKyPt1yFK2h+XdM1EzraezTRoWmuXeigiPJcCqQdASpDNYBiVJwQpn/aJpEc8I3A5TPXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348623; c=relaxed/simple;
	bh=RtVPfBukDdiWXFe+rES/vpRLMHkhNnaCFx7uCSJVdVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPqwQTzfoismQaYi6Je0WuJMsnnyIDD9CPgu2TtlqhB5EDxe5myNm20utfWojWA1QwED4CZ9T0AShesXaWd426ydjhQVnbnN43bCda001VTarPX0WR8BvH5ObwrMIP8HcFQVjiSOJ/KlgBla9NUezoecd+HDY/I3wgRkaFsKZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHSLWAHI; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2d3da94f059so820989a91.2;
        Thu, 22 Aug 2024 10:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348622; x=1724953422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sOOkFBlhh23O4ezy3O2VeMYO9nyKzVNPflyo9LvKHU=;
        b=EHSLWAHIsSoN+CeuQsdmpY0fIuTqTXFahbX1leaDiRTziHL4cvNB8Qp/fDkp+6NZg6
         +lPJx4eR5lls3+8ezyIuDGTA1h+j0QvnvpzIWGJmCHmqvh314fU0yOkk3MFa6WBjlS5+
         3TvC0fn1Rov8VyRPjPenk01CDhV4Nw1Paq4kV5KFZzmreITvB3X+VJPv5Lx4AhYgz+b7
         IgZQQowRqmHsyxmA0GIrghVTwQOAYqpnWIbjygDRRubF7PdbiHyVKpnL5LbjlAGaxuf/
         nxo+wI1NoQdY9rrKf2IFtruX1LVSR+AZuE/6aqLvL+p/kE49rZFsAlZ2p5fTBnu/Kbkz
         qVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348622; x=1724953422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sOOkFBlhh23O4ezy3O2VeMYO9nyKzVNPflyo9LvKHU=;
        b=Cr+dl1QaZwcf4bZY/Rlp18RQ+AC0BjcTsssDFZtvIFnCPZwzSdrufp9NfTBv3xtbUO
         QfesSNGls156p/ee9ltVKluO7pfqEmgfY4dw5zRUjPpvdsgLmd31IjMZRuErG6hjLKRk
         xdvOMEbPqdLZyalZwTCpQsQkOpBOaGDZkyVlppf3LdML/hfNR0/XwbVvlhLP4Pt5MGF+
         h4NhH+D2l/yemU45RqJHOS4SjH+krPcf7AJeDFxIZy12A5NNT20TD6qGOYI0X77bEzJx
         pwE+FDGqQSm/QtCgcDCBzTzXPi5n86Yv8y/0WxGutZ602ntuHQqFaar+gq3bnwuVSMWt
         gqCA==
X-Forwarded-Encrypted: i=1; AJvYcCUGDBeXJbFFYD1IdAHs9af9dxz0ncmWp6ARkHkZl9+oliDvKO8MmF8l1EI8HTkm9s72NlePOTJFCloHyA==@vger.kernel.org, AJvYcCVldqLXzEE4MN6bjXTywkahjY3GACqmtCuojfaew2OY+8gE57EkCdu46fQ7wfQnoavVQ5TtGMk7DPuQyWA=@vger.kernel.org, AJvYcCXR46iSgCpDF6/x1LJtxLhtDF+6ZWqJFrbWtvs175ORXyEiWuW47zVgR2WiOWVQSX623BluNWR43W4NTpo=@vger.kernel.org, AJvYcCXd+E27DUIvqcjsU1TWtFlWC9UjAzVLGZeZb3Pl1TgwpZOuelRVcgFGPXJruaI2oe9GfpWXOUkyad4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUUPBRiCmUSh/Z2nJ+DjnY9C/Uhzm1lEaOOpcZsSrhhFQL702
	QzlkbmQIqgycHmB0kUq/dHsHXUKPZAdrhPID/IaiwIw+JkjQLCPa
X-Google-Smtp-Source: AGHT+IFVKAnltALjlFsjogL3o8zeO/3bEDh5Wkul+T/Aa6h0si5BxRHsYJSRp8SKq/v4VG7qkbpDqg==
X-Received: by 2002:a17:90b:3881:b0:2c9:7d09:1e7b with SMTP id 98e67ed59e1d1-2d5e9db8804mr7441404a91.27.1724348621520;
        Thu, 22 Aug 2024 10:43:41 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613941e6esm2174700a91.26.2024.08.22.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:41 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:28 +0800
Subject: [PATCH v2 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-3-e4dbae24f7e1@gmail.com>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
In-Reply-To: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=RtVPfBukDdiWXFe+rES/vpRLMHkhNnaCFx7uCSJVdVE=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDrHXhbvqv0j2K04OUp6r9c3yjL7wmfkK3ed0L
 wiLJwVfOdVRysIgxsUgK6bIIrbz6etlpY8+LOM1mQEzh5UJZAgDF6cATIR5CcP/uAsdETX3d4jM
 P1D0MeoGY0/w5qWbQibevqlWcn6F0szobQx/ZR6s/XP6xDnB6RkyIt+j14R9+7s1gD9Tsy1IxPC
 t2qsvjAD/Nk5/
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 7b427c17fbfe..3599b1683593 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04..9cf4a719001e 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y

-- 
2.46.0


