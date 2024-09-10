Return-Path: <linux-omap+bounces-2176-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA89737F8
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 14:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DCBBB266E6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 12:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EB2192D83;
	Tue, 10 Sep 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awOkLxYL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67819192B76;
	Tue, 10 Sep 2024 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972687; cv=none; b=D3Xh0ZxRgZMyJQi3HRLFzLBp7wueGxg6Yd1Ix2hEcVj6Shr0JqFqHRKuYWzq1zSBHDV8dl2/jjc1JcPY08aC5cJV6fg03WJ8ImYqGWKkRgDHwxibscI7eE9qmiix4NgHjpDYb6BdT22PSIE139El89ZcDcgU5SB8Atk/bo15350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972687; c=relaxed/simple;
	bh=6wdnV6HdMVkp3ugnGGe8eg7mkzP3v3E6CFTydp2vS4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAx+g1LgWu5UYy5xz7ijCrTs8PgT5O7urW9c+p1YongSJ5HFQTwCge8XiTHchxxzaU0QxUfdpbiYAoNJafDO1cmn4VtoyLxDFz8ARaQElL7g/jxOeZkp8oxxApcPHumStfjoH54sd8Q5DviyqlWCNOBmvZ8hDrZICGM85JXHwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awOkLxYL; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2d87176316eso4663484a91.0;
        Tue, 10 Sep 2024 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972686; x=1726577486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zhYtyf6pWudgvlQc34K3t/DBsqlL88K8Bl2wQ6uvtE=;
        b=awOkLxYLgIjY/83ulS5iR9EEcgFR2ZwgzN0Mxg3IB4A/VHvz+17KE6qv2LjscoPcpw
         mm8UuxkXr22jtrUpzQ/6jt5YiucBvVJOG++yIrfxl0A0S9/NxQqBu7JmBJmer7EtEf57
         xC3mIzIaZzS18xgt8bUagy4hrtJLjA5kz+UPgRl7wRReZw062qed9cwYTt+SaOhvx/sE
         +fUNhUa6kiYpZ8/9zF9LdI9oOy7uLVJzbAMoJ+MxqfgjQocVsa8apXTojBG4YyZjquff
         5uj2SndVH79QCB5U+w9hFk7hhhRLulDujggv+gn7pTjyynOxlbs5/qxc2YylIv/WUKTI
         M6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972686; x=1726577486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zhYtyf6pWudgvlQc34K3t/DBsqlL88K8Bl2wQ6uvtE=;
        b=qyUmaTg2JA9MXZAq/npRBZlj+OdNP9WsiwgRow8wJY+/QkhSY8dhA+kaitgbsVwh5e
         96UxN6wTkE+Uuxo1B8NLVjrQ0TH8yasWMFgL+vndOiae/q2947HlcaGlOfKiMbKV6ba9
         1XcC6h2uKHOs0aX9dKzOtOtnD8vvQ6+rAtt+MBj8va5FOTF3RtXYPR/tQ3TCMN3CDV2J
         enIqb80NI9TyeHYP6afVDztMWkzjlSAZeD+OJJ4t2ng3o/Y6iWldDQTmoFuV6XTwCoLD
         EKviKT76x321bI3I2LGhTI2HtctcbdfwyBIiUXZbAmSPHfJlBXvjHHaSpAH2xDFGXS98
         BscA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ngL3hBUSvjB1FUC7m+lzo16KRU0+KbdLqpEY0kcPh58BnhuktFYVR4Rtj669HtmfR87xM823E50=@vger.kernel.org, AJvYcCVCkWSstRaRAvBlJB7FcEkO+K+mSiRIIb9WAsIvvSIyLGwhqQTXjPR83m7JSDsvEQu1Vn0uYUergYoJfRk=@vger.kernel.org, AJvYcCWu+4CVfR7ahARFpnOwzAc/msHQmay4lqbw2rgHq+za9CRMFUaE6uTrAVLQ5gjZklJCxFmiRgZe7LZVug==@vger.kernel.org, AJvYcCXF7IZAi2wQoNNGTGa/rQ4GG1deVBTS9c7A6AhcFX1/cc6JnsccNc8Ut1bFOxCl90fwHHNOSuSPBh7coYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfOwOzJ4GZe+LWn2D2yebWESxQdILxEQN74DO/ww4FR5cLjXD
	KwkhnKP0EuUabHeCeP/TMqDo/tbj340kfp2ZkNAwr452oFdXtGCG
X-Google-Smtp-Source: AGHT+IHmtwAlv5WOsgDMs4PwbsAgQwHfvUqLAI2y2+Ec8H07id42d2TgjmDzwdXFvKEdewnxAip6VA==
X-Received: by 2002:a17:90a:ba96:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2db67181b2cmr4323244a91.3.1725972685499;
        Tue, 10 Sep 2024 05:51:25 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db049883e5sm6314220a91.50.2024.09.10.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:25 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:08 +0800
Subject: [PATCH v3 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-2-486e75e5ae6d@gmail.com>
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
 linux-tegra@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=6wdnV6HdMVkp3ugnGGe8eg7mkzP3v3E6CFTydp2vS4k=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cDrv6t52TOH0iZkrUt9brR8+cNvzzWly4edHmz
 KnS8YlRey07SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIk8q2dkeCn9ctNlT57W
 mV7nV6ddm1O/7t3//P5ipuOnTFb9ePuY9REjQ9PLM2/CDl+fIVI3uTfpqs7h2D4hubfuDpWL5s1
 2tGqKZAAA05JRXA==
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

Reviewed-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e232ec7ba452881dcd7cb0d7f9aa2..4d93adb3f1a220ddd19a5437ff074e7fa9f3e1dd 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -23,7 +23,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y

-- 
2.46.0


