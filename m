Return-Path: <linux-omap+bounces-1969-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34A95BD98
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 19:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC6131C22982
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 17:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66971CFEB0;
	Thu, 22 Aug 2024 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4mNzBZE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066301CF2B3;
	Thu, 22 Aug 2024 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348618; cv=none; b=bDBLtiGZT650wnEzM4suzwhZ6oSoQeCzna5uj8ccZ1Oy31ZDH4OCvDQe2LuUE85B7rsYK4qC98kzMZawaimDGMZJbBGM8S18WAY//DBxsFkSlkyOWTpMqP4dC6RjXyTSdP6K/fpJUWZs0sgy/esQtZyTsYgXjeYfzoAcoRP/M3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348618; c=relaxed/simple;
	bh=zrg/IlnMUyssz1StuHquhO16krnEeXCPcrxCVtormZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpwz/fWuQp1H5H4oANCsARIOJgLY8Anmlom6c8hBXiIHe8N78cal4OioJ+6B2/RFg/fCXuaRPxoO81JxN3K2Wg84GnMvbzK9SFOkqdoElslF8uDFOPpP9YzY7E2BlKjL41nskJrjE2m2qOiQWAgKhmy8qimCcVEwFLSB1EJM9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4mNzBZE; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-71433cba1b7so959708b3a.0;
        Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348616; x=1724953416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=h4mNzBZEu7pehzJ8Yb4G6G0Z06R9RbK2XjMSo/aFc1dlHDXnnYi2ah3I+wIKNQ1wM7
         g+rmNZyCBdPj+3mca/8nSofbkH+LHhG/UKIlqY4U2dbSM99Hgfym8lzsv6UzCkcoLlc1
         vpciQbSYOWOJIFTCyLXlPs/eiWcxKlu+sWS/FHH8j7fqxXKXzJtyHDy/oV/dvdvgd8zv
         +V1YVVHLfsaoBpArjZsNe4HpKhbzOxIVIXPW5orxbfen4OZCBFu8/2LfNwv4GddBYqZ7
         GaU5N2o9v63+ndG0pClEEj5ckB62oQmLkHdUU0awe2BZ9g5g0ykcD9RZ/nBJnJ8fAd9F
         C2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348616; x=1724953416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=I0WYCTaWWICSuI8bEUeRGU0lG2SK4B3mSlifOqryGgz4LTaX+1peXZWLpR6QZpzrvw
         ZmgmumL0q8rlxkMZ2bplKLG1fBDwX5Y6OCSBIXlyNCyJnSEeDDE56fUfnwUw79fdIZQi
         3pHRS6W4NAMn703QeRX3fPBFU3SHdGKpoGA5Bq5dMgUfdt2VT38GutMsRaRmSsFYzEyu
         +kD2KOMHYGAc6ZUguiHgZlUiC2U1S33cZnMtNYvn7IS2GhA2BD8XLEg4dNGmYZZqJL08
         VgLeZa0IVhQkJ8MetIkqfHBQ0A/c8mvLTXUVI/9vQu5ggrAjuTMkqhlKe1JNsI6/BR7y
         x+mA==
X-Forwarded-Encrypted: i=1; AJvYcCUMEnJheDa8/iAjxwaTrjTVQuAMRVTBkUq4Fus4CC8LEj1RjDL0AtX8RkASf1SjBios/igBVEPJKbDmpA==@vger.kernel.org, AJvYcCWUtelNG5R6GhQ8dQQ/3UlvVwaSCNx3BWbzJup+lPnGXbMnRdY2e8BGLiZbf+cNdkNXeezzTVnWp0E=@vger.kernel.org, AJvYcCWu+O9awnWmcDHiQOBnunh47ztVh/eE7cYNHdlJyF3Oae039t6Erb5yCHfsD/qb4mHJi5eqs+c3cEt3x34=@vger.kernel.org, AJvYcCXiNxnBsWiArVzpHo9EXF5+MXmEnXYGPnflO4peiFOcjNG43t3ZJ4FdU5RgJBodnt6pjvhqNOOnExmISSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV03KM9OZ6zle30AjhrBmJT/eIPUa+5Tu9r0zpRBa+3gAZJydk
	kHI5WaqDdCTwcWNstjVfqv1yoGSutND7w9p8Y7N+5iXG1XuFfigb
X-Google-Smtp-Source: AGHT+IFY7faoa1ysSNP/WTlIuc5cvUwL0iduNK27/aTo1Ui5+aFB0dzwQSjau/0u3AZ2vjSD7A4hzg==
X-Received: by 2002:a05:6a20:d04c:b0:1bd:2214:e92f with SMTP id adf61e73a8af0-1cad7f8daafmr8210064637.14.1724348616184;
        Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430964fsm1647764b3a.150.2024.08.22.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:35 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:26 +0800
Subject: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=zrg/IlnMUyssz1StuHquhO16krnEeXCPcrxCVtormZo=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDj6cdSh5rvkhA43VF5ie/BGZ8aZM6IH+r8Sia
 u1NErnCStc6SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkEJTP8j35R0LfbpvUd
 1xaRRpYmh5N3lf8sPhhZfaL89dFXV1JWzmZkmLBztbxRUUjEvrpX0xSd53Jw9lcJmBeKL5h0U7r
 m3345dgD+6E2g
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

Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..de85c3ab261e 100644
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


