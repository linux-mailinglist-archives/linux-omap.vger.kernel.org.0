Return-Path: <linux-omap+bounces-2177-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 979029737FD
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261A41F261EB
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 12:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE49191F65;
	Tue, 10 Sep 2024 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+qyQnOL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81956192D97;
	Tue, 10 Sep 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972689; cv=none; b=Yn39ESnohWqRWnhzE0UUprewm5vHXXcFt/fKn2t+boaBg2e9SFf/LwnnikKgzqTC/Uj4MH//O7rr7NF1sTVrSnNuP/NLhyFBhzeMQk9UVMk4ZGFP1P4S5hYkRAbYvkWqVj4nA1mMsRT5Bc3b0XoB+n99QsnNNER0wUuOSIi2c8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972689; c=relaxed/simple;
	bh=i4dMYbikEhftIrSd1gq7tvjKJfStRheJwUa1Cpif+Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASLlpmXTzyzu+ltegqgAMZ7o4yiVQVGvCz2QXnrc0HZZLUycV5ofoUlOPXaSiiZHLPUuA5w/U8R8c3k8U1No3sSjxIyjCrwKwkC1sbeQgyanGcjTtjYYDkp9rRRhjsKJE8EojaFYzCLgCoxOz/94fIgNdk7aisHoi0PhWb9+ulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+qyQnOL; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7dafd9df795so605647a12.1;
        Tue, 10 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972688; x=1726577488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=T+qyQnOL8P/fLsuTI27tyrOjnlhWpH3xK3M27axLvVcNkIt81qi+MSVxOP8x9Limz+
         BoFjBZadxfPZosv9aXQ9OPR6e85gmpMox58X3Qe7xHWhPWMkU6X9jMOuCXYf3A+Bts87
         HQHgPJifRSv3DMe8qzg+ukLqsy7Q8atFX6wJaEK6CIGCZmq4+pw4mTxxEmn/4BL3VuRr
         1FcWPcimgnszj2szLC/jc0348wRaBd7ssZkOSTqojsX29eJdpKAvfTx6g1PCJA2TEQoV
         voU0qzhaCQtaQWxI1sOlVvUa4u0UjAmD2pmktuf+ioNBdyQBSbFQy4QDLuhERpT4s2lC
         siDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972688; x=1726577488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=wyKJkXz1MBY3IjjfyNFc4QRFaPGXDuXhiDtfe0qEDNniyPFl+W+9g2gVrvdTgNfOE6
         ldIqXuyacfgVSb+7s82gFKS8x6oe9vSPcrM/POHHnZkk9i/BpbfQ07AqBKtBKIwyR/Rq
         2RGLlQZT/70Rtca6MXX/8qXyiX4I2gLaeNOtZgZPdttgfrnKmZnhlzMDLFQbKZwTSuP8
         sHkWWB1v7XPEwvVp+N/G2Mtga0GtNmIQbT+F293CCc6cna3+73r2ZlUlv1dmup1M2Gvf
         adBunv6LsbrhiJzfSgyYNhUtMcMtIMAoJkRuDbVar/wZbUsg+q39RUNrQ/CXGezhBJOr
         Nyew==
X-Forwarded-Encrypted: i=1; AJvYcCU0u87t6rvNsZNA8LQDDHnrBcm/HtfWMx8KEj7z6wlsnKmPGNyLnzLGm5k0fjKIDLiP8SHSKxBHY10=@vger.kernel.org, AJvYcCUVuk3qMCbr479DhccvO5uDeysf70od57V/52QfY8N0TLWDiaR/4tgBOFcRZFCucMarHVNb3hkreZT9Cek=@vger.kernel.org, AJvYcCUfnfeDedVyxPFLZEKHJdcLChCiUG9nn5zvSUWuTZxAhOddrgf1fhxLYxTo8j1Ee+Mvn4HAXe6wOdWgPg==@vger.kernel.org, AJvYcCW43CJP5dFthGHRsNY4VcqP70r7aJTLtBsf2yH/OBTvwKw5c58i7wjgV1C/cKx+e2zL8ne+90YlfhF3cxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlwA4jMY3EkI4MhAy1UoBuuh47KDQLircSkR3j2thY2JCWosO
	3LpffnS2nImx1A5m1N+v+qYOkN4+gC+h9xhZVW/IoGxU47yRRbdq
X-Google-Smtp-Source: AGHT+IHgHbCzgcyX/yq2/aN5BrFUKFDAFGLiltGw+vmIZ7aKbx1Z6fmvlBgd0wE3EiRb5/sbMP7HqA==
X-Received: by 2002:a05:6a21:150c:b0:1ca:981:8e4e with SMTP id adf61e73a8af0-1cf5e096a13mr901315637.3.1725972687795;
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04966b75sm6317071a91.36.2024.09.10.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:09 +0800
Subject: [PATCH v3 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-3-486e75e5ae6d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=i4dMYbikEhftIrSd1gq7tvjKJfStRheJwUa1Cpif+Lw=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cjhgVSl/QKw754HE9X+Szg08Pp2726RsspZo1s
 cuehoW11HeUsjCIcTHIiimyiO18+npZ6aMPy3hNZsDMYWUCGcLAxSkAE5EsZGSYdUDWq+zSzrNb
 uf2nMx3iy3m2PDCA48XSy62/naf1Wu9cwvBXwMtR5NxLTpaWCzuFXEqvq6VyxJlzXj0uYqrOt+/
 TP1EOAFFySKE=
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
index 7b427c17fbfecb24d63e717023aad19ce1c953e8..3599b1683593b865d863800eb84b3f8f89d3d57e 100644
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
index 00ef62133b04ded8d0b4221f11e0adafde99d386..9cf4a719001ea5ef4b031c1bbbf8098e8af5a2b2 100644
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


