Return-Path: <linux-omap+bounces-2175-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B519737F3
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 312B7B261DA
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A9719259E;
	Tue, 10 Sep 2024 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLitljtu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B06191F9B;
	Tue, 10 Sep 2024 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972685; cv=none; b=IcYztcaVwbzWThAaigKJlJHh9oFjf74b5z0C/dHUkNs35IrakiP+InWg4g/UBHzpICfVjcc+iDbj0OggsqtZTljhtuMEpFNm8nRuC+Vu77/O0/2F3LYCJfm8QFHeFbmWVnNF0fvuVCdBu3TUo/vI96yG1+8aScetXyI0MUz6WpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972685; c=relaxed/simple;
	bh=cfUrWXL9qtt/rVda6iREvTUmuGd0VH6THULMDnviMOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpYXCOQ8jsUXLog3mLN2e63NUJtf6+ievU//FTljp0U/hOa5iiZLwXYlh/AvuWewLyR4YE7bjwiO2DF5TzJZc5SAfZIcDf/0VDz0cssA02NVRqhkeecDh8ZisAp0JLrrJMiw6QGK03yz66dzqBE0S8z0srONeeCY9rNPqqi3fuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLitljtu; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so3981788a91.2;
        Tue, 10 Sep 2024 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972683; x=1726577483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7Rc9kfm8v0kZDrGPOkzuOTqF6FHBC+bkHagLjAPL1g=;
        b=PLitljtuNYjBRIGYeJjQcWoAn0DsMqUfwrN3s/sX32pntOXAecwLvFv83jrYbVrqkp
         6dAgtF7hwNdmPNA86Kv/Vs9+dSfMousHxgqSX12lY7ERtEd9EEKy44wrG7SznJ7ihwQr
         qdaKVuMvV2YHs9OOrEbOapi+LOh7KEppdshFIp55vdum0aGb1ctaFYTPBSPI2HK2Lmx4
         CNX08+w9PjBFwdtNdCoj2iUdJbzENjBktK39qgAl0Q7Zu0tPiDdYkhtYyG543+tIjC2v
         ogL8GT9Fyc3TWIUCUuRdtFsWT1UKfaSEuIY+DaoYoWybCduXqG9xyq/6OxYgw1lpiWal
         /EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972683; x=1726577483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Rc9kfm8v0kZDrGPOkzuOTqF6FHBC+bkHagLjAPL1g=;
        b=On+otRieCownq6JLVataZwb6rncP+7TtAiB1tfDdcHiJkRKz2HadY+SXVi9ynzg9fU
         0DfanvOTT2sd2tif/gludTThcQQw6qO+5zAOBDVw1k1bXaB6wJN40a0wvu9rdM7I8yL7
         /ljafkqF/wU3ohyOfLPAOEtRZUpM3FCtKhW1hDcMVMzR8A8QxCeVKENIJfoSGOq37fBf
         jHGLOvXV7zYHDPfs61BjyhAQmyRx4PyRkL2Fe7O6mS/rmJUGPKMnZSum6r7gy86O8dtf
         pJnBzaj2V5osB0IKaUP9LzOMSy6NUXbvdikJ2o5UxE6uIPkYgiF4C4XduHoOMFOewVoJ
         3CiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Z44c49Rc7kt0Y0lHsC+cUVahuAXjiX8oYguwb/TCT0PqKPDRFE2PGURCqAMxeZDfw59FDOltITYwUNk=@vger.kernel.org, AJvYcCURf+NvpFJx3el7+UEbhIwqTWj1jeC3pzZK9FiRcyQDP80fTlLHkkzO0qjf3GWHEtYdtp6n1Kaz0cB2yEs=@vger.kernel.org, AJvYcCVyiERFxz8RyllVhNfTnOdL+1NSX/86P8Db3KzQuDZnbKqtWaMdAQ65YvNGnFAUO9nVYY2ZpKGDhPFvtQ==@vger.kernel.org, AJvYcCW+fL8y1NV2e9ZExTO6DNHmp9zqTR25xC2duUxben419ya5vhzBV8R8zNo0SAQf6JRYOSDg5fTD2JQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqgzOSSyj/ZIjVQbmMXUMi1Bj9z2DdRE2RJIjyHK1h2llJoVn2
	+wSUxtEZ+qjYin/9OCEijZUaKyMe97R42GVbuI8pW/J1YnzdGXh0
X-Google-Smtp-Source: AGHT+IG5eZbjm5Ya2QBW7ZmccQn2oryjff4WMMcYPIAxT9c+ncTv25A+QUGWTxzLMOWwgDIsjCJItA==
X-Received: by 2002:a17:90a:5802:b0:2d3:c4cd:245f with SMTP id 98e67ed59e1d1-2dad5010441mr15248405a91.17.1725972683183;
        Tue, 10 Sep 2024 05:51:23 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc04041csm8412798a91.27.2024.09.10.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:22 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:07 +0800
Subject: [PATCH v3 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
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
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=cfUrWXL9qtt/rVda6iREvTUmuGd0VH6THULMDnviMOM=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cDm15vp/BYfcFjgX95w7z6J1xDnyz/unOC5Ybh
 Ru7vd5krt/bUcrCIMbFICumyCK28+nrZaWPPizjNZkBM4eVCWQIAxenAEzk1h+G/3nNNzrefDjr
 uVHmtuD2L8ZKWk3ztJKEfp63tdjRv3j2njUM/7MmH5p8S52Ljfl156oFGppi72Q6l51aoTf3s1v
 Ttv0OB1kAKbhR+Q==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

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
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8acfaa5c8f442968a807de303428d9e..de85c3ab261e6d62b2089a3c89bdc9d1b34fa792 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y

-- 
2.46.0


