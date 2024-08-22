Return-Path: <linux-omap+bounces-1972-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C844F95BDA4
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 19:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E905F1C23314
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 17:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C991D0DC8;
	Thu, 22 Aug 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSOWVQZw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED151CF2A1;
	Thu, 22 Aug 2024 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348626; cv=none; b=of0fP+0729CBTwgXJ+G6wV1I0CXLh/4xAQ3Qs1ywN/mGiz+KbslY6u9hnixrLVJkGRMWkfxg0agCaH8MrtoaNqQPcQuML54WHP3ssH67YkIGymfR8eFt9enK70UB5+L5OnVGWwVNB47MhfyKlWUbrsn9YqN7l796PApTYkVUkCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348626; c=relaxed/simple;
	bh=NFJyZNClpVUHx0Z3NXNiq6kpWDX+CueV3L4clx5uBrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYhcCsEfcISmHVbpSJdZtoCNuzfBA/cHiKHRYHGLucKP8ud37S1rq4ekevIvpRzGbWjRtuoR8nzaoLmS7uO4/d/vURIwxgmpw2LBvMEPkurOmqJ7n53OpG/WAv7bxKqb5BqvP96xvW2yUfc6hAJlgAGFcGf09r5OZUg9JEeM5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSOWVQZw; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so726464b3a.2;
        Thu, 22 Aug 2024 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348624; x=1724953424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=dSOWVQZwhOcxjVN5NhMtpWMc0b4V2cUbWjyNtqKKOSKnkmYyO6Vj43Frn4EyO3C9PA
         lgVmN0XYJRCg6keRGP1QEj36Tw7oyhhhpRBSbsJ9qoKpXKO9Bcft9R6RPPmGOa2ktSy1
         KHikYBdIuAOYe5BL4JggNPW0R6KRpKc2ILlupWu1E6I4dixdJv/4N0Tkgi5ZiMQZJfeX
         st609SF7ifqipGGesTl3QVHbRaq2CiffN10cs+Fp/SmggfhTRDgTDYCRJAjVKo5jNq62
         EY9gc9bvEbZP9LULIER18n9V6fCGCfNKl+FfOZczz+zme/eBKct68wn7KR1FJL2qPpkl
         xZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348624; x=1724953424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=mXeWGN0phtdJj+9RzgU3jxZFXCq7XCDM+ywV5h4Tl0dww3tjhvT9GFU1WsU2i48HqN
         8jezbm93jrieXu4SDprYOcHfNxeMGBu1N6FiQZrWS+pNoLkAmOoXG9W8RYDKxAvQ304P
         gE7sSeWvWazUcBCSB5eJRSgSBy03Hlp4fnEkycNNt5A1tGt2nPPx2luwJ3CVONtk9q14
         Z/95GRa7MySPXg40glNYzjTvjdSvWY/mqilx4cgPMmIqwwS3hD5iquLk3h05U8cJUw65
         nMrQ3KdWxBJleu3z91/YP22HtE9eBEWvbyyiypEKZWJSbV/vcNrYA+0v6E0sUXyVTD6K
         Ga6A==
X-Forwarded-Encrypted: i=1; AJvYcCVCDbTORMXC3NYrfyvkY6IzP32VoXBuxjEMj9uivGyuvO5byyeEpsq074dUCzBIwuINBBiuae/+630=@vger.kernel.org, AJvYcCVVHajNRqg8yddsy3nZPkHvKWmdI00xSXzoGJIiXeUkw02eT/CyiFu/mawPfgIlQ+dNIDKI1bMl7d4DiJI=@vger.kernel.org, AJvYcCX1YHG6vS72A55wZmw0qs3+jwQOaOwwbaJT5guVVJj2c+a86/pxjH6Wt4HugmpUlAmRwxJknDlcdgTZZ/0=@vger.kernel.org, AJvYcCXsso/i4PhipK/btJL3okGONJleKufxokeRYkXEQQif3epVKpY/HeP8zqiJZetld2w4KPfAV1EKPI78JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8aQULUBd70iuyfT3f1SRCEh56/uUBQMuTuWSa3DTpuo2dy1R
	NG2/19n+WLkFHmV/d4dzAFlHRmxBreBaRiSuxk16c9d8W6RC6RJ0
X-Google-Smtp-Source: AGHT+IFGkELVvNa0lI1frVFe6EWSijWeT2NndQtVRkhY3tXIvi6/Nr7KdOgUntuymQnVsLZZV1NHsQ==
X-Received: by 2002:a05:6a20:cfa4:b0:1c4:9c27:77a5 with SMTP id adf61e73a8af0-1cad7fb3fd0mr7479354637.31.1724348623824;
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434af17ebsm1583180b3a.3.2024.08.22.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:29 +0800
Subject: [PATCH v2 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-4-e4dbae24f7e1@gmail.com>
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
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=NFJyZNClpVUHx0Z3NXNiq6kpWDX+CueV3L4clx5uBrg=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDivyM1yYePqvmKhQXbdc0o4/M99VH9rqbjfrd
 C2704FIwfKOUhYGMS4GWTFFFrGdT18vK330YRmvyQyYOaxMIEMYuDgF4CKcjAwdc84dWeL8XvrP
 oXWq2Tvq7x9Qlrtz8PpheXWhu2maxd+PMfyvY/2cPcnsqtDXK2v61hZlLJVe4rPDPnSvlHrjhGk
 +FpHMAC41TKg=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
with systemd") said it's because of recommendation from systemd. But
systemd changed their recommendation later.[1]

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.

[1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700

Tested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig   | 1 -
 arch/arm/configs/omap2plus_defconfig | 1 -
 arch/arm/configs/tegra_defconfig     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b5f0bd8dd536..27dc3bf6b124 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..9cb265c8d414 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -13,7 +13,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360c..3a9bda2bf422 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y

-- 
2.46.0


