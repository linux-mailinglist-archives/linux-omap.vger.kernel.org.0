Return-Path: <linux-omap+bounces-1968-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E995BD97
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 19:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E892B2625B
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2024 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D81CF2A9;
	Thu, 22 Aug 2024 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtatUq/8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94361CF283;
	Thu, 22 Aug 2024 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348616; cv=none; b=RXuu/pqZ0WB3uynyAD5xm/Ev4D47AKz+QrIUXRERtmk5NXejagbCNiw4qSQsPktYjrw9ulKpOSnhU5RwZcTxM/ldy13MtolqXbRSj3Feg2sg3E9cp5xdLupMKOrdq/WwN73QFzs/V9jUxEpIy+SclBdPTyQTlCXBf3i7mZpOtJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348616; c=relaxed/simple;
	bh=oxm9xkvZGzIuUm2ABeNCmYX0SzCj7LhC0xOfwefJdzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=djxybZ4dgPrLWbxbqFulLsNSqVE4a2uTt4qEQXaS6LjUn4VDXpYYfKxD2pmUr9FUyCRLPF3VabfyWhrgKxHcck3joRZFoAY6Md4H9PASG2Caxlkp+9WFvnUjv16aj87dYzAxubSGQek4DxUV0sOMy2D//ospTK8vPs4RiNVLcKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtatUq/8; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20230059241so9709415ad.3;
        Thu, 22 Aug 2024 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348614; x=1724953414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4G0t5i5MjlKI07w+v9d5SvzMw5bgUZNebTVTOJ6/CU=;
        b=VtatUq/8ZEaKtcPI6TVmcnSkC0eXFMESbna/rGn1dSHt/r46u5G4tbg77LpKiyuPcj
         U6Trx8+EJJd9+96BVHUH3NjuRstCHPrZxDTSDRwOyKSNV/yO3GbysMgo6O8+JlUe/P6g
         1C37nr27CZy9IniftbJZI8oEs2oAam8AwcbvQaMals9Kjq0otAW1sPKvN+WwXMSMsg3O
         v13YF5mnH61KaN4Ir1rlw2YgeF38Ft5ZO+/JOPbj+naJxpnafwrzpFPtKH7kgHJFqGGD
         BKw0cBfNdTEbMz1szeAkCdQ/6n7uhSGchbJG6LY/7p/J6fZ4jeGyFFykE8Io1Y4ko4me
         FYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348614; x=1724953414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4G0t5i5MjlKI07w+v9d5SvzMw5bgUZNebTVTOJ6/CU=;
        b=q8G1wNYdNLjryl15XQlNel1pL2s/oyO4+Z4zoYXwIOqD0aB+ewj4Lo0LyVe/pYv/GW
         0t/mi0xFve9wVtdxOnou/ffdOdOfkrf9XHSkbWpWcG11m0890rr5cOu1277jDN0nxHIi
         cGm41BbH2kIqeopWlchqNeX22RtGs6ywRUYMPgtLWw/dwnI1QCUAaErTZyQP5zKy0iB7
         HvIAjjvYXgZz+8zxQq/qIkR6qpEqop84hem5xmtwp6QrNujzhtpXJh2vlsRlhv69coVT
         N/PcK9slLjR3+MtkpVxFYyGIVghT/cEw0UhbND+u9o9XxIXCu05zHUdDP7KkcEWyKPXW
         UERA==
X-Forwarded-Encrypted: i=1; AJvYcCUSX131txhjzMYy8ztWSdter6SuM2yhUwNjGJJQhUqKVKf/+S81mT6Q03sdolujJCBCP/oMVg80uKvnHG8=@vger.kernel.org, AJvYcCVvWfwzcebVXVvEfQ5PLYhLW1lzTTuql0xyk4PK4pu89PBxg2K2w0TwjG4H8F8E/PW25vkKaM5fSuEIKQ==@vger.kernel.org, AJvYcCW9p1tJ5c2M6tL9YlhTFOXj7gyPpNhowSCRcYOej1djF1aMIbyqlLYE5SpCGdU5vcieVOpiBL776w28rlE=@vger.kernel.org, AJvYcCX79eVKjrFPWCSbLkhSPSYlsl5ToVuoTB3E0aSIrPeA3fpj3aZYeeJ1jerOB2hlYp+6QnruBT3prV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xCp9J1WbPacFmMxbv9dXkmg9BcHHYSEvX5az7oNvyqPFoPpz
	DSOJE5Odh9+SZEFyMrxI6f3C0LT+X7NLBmjpnjE+99ZlRuPr3rtOJxl3Yi/qA/53UQ==
X-Google-Smtp-Source: AGHT+IFfPPdFj0NG4vrABOMrZhiOMEMUIocsG6aUP8ME2w6mPmC8V1x0YBQJmJXakBKYnVWudfb/Rg==
X-Received: by 2002:a17:902:e748:b0:202:371c:3312 with SMTP id d9443c01a7336-20388b37240mr34252965ad.40.1724348613908;
        Thu, 22 Aug 2024 10:43:33 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859f0121sm15191405ad.246.2024.08.22.10.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:33 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Subject: [PATCH v2 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Fri, 23 Aug 2024 01:43:25 +0800
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL14x2YC/0WMwQqDMBAFf0Vy7kqSxmp7KvTSfyhF0mQ1AWNko
 yKI/97QSy8PBt7MzhKSx8Ruxc4IV598HDPIU8GM02OP4G1mJrlU/CJr6PwG5JNZgea2p7hMbTI
 OLViJXKgPqsZqlvWJMH9/6dc7c0cxwOwI9T9YnbkQ4qrqslJ5FTTwiDhoo8fZLemJ270P2g+li
 YEdxxfPntJjrgAAAA==
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Xi Ruoyao <xry111@xry111.site>, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=oxm9xkvZGzIuUm2ABeNCmYX0SzCj7LhC0xOfwefJdzk=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccr9jMo1nday5+o9yiKZj1x6s6KBcXT5ip+vbit+
 pK2/07GJOOOUhYGMS4GWTFFFrGdT18vK330YRmvyQyYOaxMYEO4OAVgIrzFDP/LFhfY+Txl79n8
 45WIn9G5C0q8/Gw3VpwyibbwDnDcsUyDkWF3X9DPiOvHLumY7P5ar2Xwb5OBhXfZNLfkW4c4E4z
 PnGAGAOh7Sxw=
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

---
Changes in v2:
* Remove MIPS and PowerPC patch because of merged.
* Link to v1: https://lore.kernel.org/lkml/20240530111947.549474-8-CoelacanthusHex@gmail.com/T

Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)

--
2.45.1

---
Celeste Liu (4):
      riscv: defconfig: drop RT_GROUP_SCHED=y
      loongarch: defconfig: drop RT_GROUP_SCHED=y
      sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
      arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>


